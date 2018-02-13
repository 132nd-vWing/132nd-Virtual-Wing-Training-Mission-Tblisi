---------------
--- Tankers ---
---------------
--
-- This script manages the creation and replacement of tankers during the mission.
--
-- /!\ IMPORTANT /!\ This script relies on the MOOSE framework to run
--
-- 
-- To use this script, create one or more tanker group(s) in your mission,
-- and set them to "Late Activation" on the runway/parking start. Make sure
-- that the tanker group has one waypoing set as "Orbit", and that the group
-- has the "Refueling task".
--
-- You may also want to set the radio frequency on your tankers.
--
-- At the start of the mission, the script will start one tanker of each group,
-- and will monitor its status, spawning a new tanker if the previous one
-- runs out of fuel or is destroyed.
--
--

----------
-- TODO --
----------
-- + Automatically set radio frequency on every tanker

-------------------
-- CONFIGURATION --
-------------------

-- Tanker list
-- -----------
-- Comma separated list of groups that are to be managed by the script.
-- note, TACAN are on channel Y 
_TANKER_UNITS = {
  {NAME='Tanker_Texaco',   TACAN=5 },
  {NAME='Tanker_Arco1_1',  TACAN=8 },
  {NAME='Tanker_Arco1_2',  TACAN=10},
  {NAME='Tanker_Shell2_1', TACAN=9 },
  {NAME='Tanker_Shell2_2', TACAN=11},
  {NAME='RED TANKER 121',  TACAN=12},
}

-- Minimum fuel
---------------
-- Represents the minimum amount of fuel for a tanker unit to keep patrolling.
-- When the fuel threshold is hit, a new tanker will be spawned at the airbase,
-- while the tanker that is low of fuel maintains its orbit. When the new tanker
-- arrives, the previous one is sent back to base.
--
-- When setting this value, keep in mind that, with the remaining amount of fuel,
-- the tanker will have to:
--      A) Orbit until a replacing tanker arrives
--      B) Get home
--
-- The value is written as a decimal expressing a percentage
-- Ex:
--      0.2 = 20%
_TANKER_MIN_FUEL = 0.2

-- Debug
--------
-- If this is set to "true", then additional information about the current
-- tankers' status will be printed in the log file
_TANKER_DEBUG = true

-- Reinforcement zone radius
----------------------------
--
-- This value defines a radius around the "Orbit" point of the tanker.
--
-- When the new tanker arrives within this distance of the intended
-- orbiting waypoint, the out-of-fuel waiting tanker will be sent home.
--
-- The distans is expressed in meters
_TANKER_REINF_RADIUS = 5000


---------------------------------
-- DO NOT EDIT BELOW THIS LINE --
---------------------------------
_TANKER = {}
_TANKER._fsm = {}
_TANKER.INFO = function(text)
    env.info('TANKER: '..text)
end
_TANKER.DEBUG = function(text)
    if _TANKER_DEBUG then
        _TANKER.INFO(text)
   end 
end
_TANKER.UNITS = _TANKER_UNITS
_TANKER.MIN_FUEL = _TANKER_MIN_FUEL

if _TANKER_DEBUG then
    _TANKER.DEBUG_MENU = MENU_MISSION:New(  'Tanker debug')
else
    _TANKER.DEBUG_MENU = nil
end
  
--- Custom Tanker "class"
_TANKER.Tanker = {}
function _TANKER.Tanker:New( group )
  
    -- Copy the group spawned
    local self = group
    
    self.going_home = false
    self.route = self:GetTaskRoute()
    
    function self:Debug( text )
        _TANKER.DEBUG(self:GetName()..': '..text)
    end
    
    if _TANKER.DEBUG_MENU then
        self.debug_menu = MENU_MISSION_COMMAND:New(
            
            'Destroy '..self:GetName(),
            _TANKER.DEBUG_MENU,
            self.Destroy,
            self
        )
    end 
    
    self:Debug('hullo? Am I a tanker now?')
    
    --- Send the tanker back to its homeplate
    function self:RTB()
    
        if not self.going_home then -- check that the tanker isn't already going home
      
            self:Debug('screw you guys, I\' going home') -- let the world know
        
            -- Send the tanker to its last waypoint
            local command = self:CommandSwitchWayPoint( 2, 1 )
            self:SetCommand( command )
            
            -- Create a 5km radius zone around the home plate
            local last_wp = self.route[1]
            self.rtb_zone = ZONE_RADIUS:New(
                'rtb_'..self:GetName(),
                {x=last_wp.x, y=last_wp.y},
                20000
            )
            
            -- Wait for the tanker to enter the zone; when it's in, remove all tasks, and force it to land
            self.rtb_scheduler = SCHEDULER:New(
                self,
                function()
                    self:Debug('daddy, is it far yet ?')
                    if self and self:IsAlive() then
                        if self:IsCompletelyInZone(self.rtb_zone) then
                            self:Debug('no place like home')
                            self:ClearTasks()
                            self:RouteRTB()
                            self.rtb_scheduler:Stop()
                            if self.remove_debug_menu ~= nil then
                              self:remove_debug_menu()
                            end
                        end
                    end
                end,
                {}, 10, 10, 0, 0 )

            -- Wait for the tanker to stop, and remove it from the game once it has
            self.despawn_scheduler = SCHEDULER:New(self,
                function()
                    self:Debug('I am so tired...')
                    if self and self:IsAlive() then
                        local velocity = self:GetUnit(1):GetVelocity()
                        if velocity ~= nil then
                          if velocity.x ~= nil and velocity.y ~= nil and velocity.z ~= nil then
                            if type(velocity.x) == 'number' and type(velocity.y) == 'number' and type(velocity.z) == 'number' then
                              local total_speed = math.abs(velocity.x) + math.abs(velocity.y) + math.abs(velocity.z)
                              self:Debug('Total speed: '..tostring(total_speed))
                              if total_speed < 3 then -- increased from 1 
                                  self:Debug('Goodbye, cruel world !')
                                  self:Destroy()
                              end
                            end
                          end
                        end
                    end
                end,
                {}, 10, 10, 0, 0)

            self.going_home = true
        end
    end
    
    --- Create a zone around the first waypoint found with an "Orbit" task
    function self:ZoneFromOrbitWaypoint()
        
        -- "x" & "y" are the waypoint's location
        local x
        local y
        
        -- Iterate over all waypoints
        for _, wp_ in ipairs(self.route) do
        
            -- Iterate over the tasks
            for _, task_ in ipairs(wp_['task']['params']['tasks']) do
            
                -- Waypoint found;
                if task_['id'] == 'Orbit' then
                    
                    -- Save position
                    x = wp_['x']
                    y = wp_['y']
                    
                    -- Break the loop
                    break
                    
                -- Manages special cases
                elseif task_['id'] == 'ControlledTask' then          
                    if task_['params']['task']['id'] == 'Orbit' then
                        x = wp_['x']
                        y = wp_['y']
                        break
                    end          
                end
            end
        
            -- If waypoint found, break the loop, no need to iterate over the rest
            if not x == nil then break end
        end
      
        -- If the waypoint has been found, create a 5k radius zone around it and return it
        if x then
            self:Debug('creating ')
            return ZONE_RADIUS:New(self:GetName(), {x=x, y=y}, _TANKER_REINF_RADIUS)
        end

    end
    
    --- Returns the fuel onboard, as a percentage
    function self:GetFuel()
        local fuel_left = self:GetUnit(1):GetFuel()
        self:Debug('I got '..fuel_left..' fuel left.')
        return fuel_left
    end
    
    --- Return the Tanker "instance"
    return self
end
  
  
--- Declare a Finite State Machine "class" to manage the tankers
_TANKER.FSM = {
    previous_tankers = {}
}
  
  
function _TANKER.FSM:Debug( text )
    _TANKER.DEBUG('FSM: '..self.template_name..': '..text)
end

function _TANKER.FSM:New( template )
    
    -- Inherit from MOOSE's FSM
    local self = BASE:Inherit( self, FSM:New() )
    
    -- Template name is the name of the group in the ME to copy from
    self.template_name = template.NAME
    self.tacan_channel = template.TACAN
    
    self:Debug('FSM created')
    
    -- Declare the possible transitions
    FSM.SetStartState(self, 'INIT')
    FSM.AddTransition(self,'INIT','Ready','NO_TANKER')
    FSM.AddTransition(self, '*', 'Failure', 'INIT')
    FSM.AddTransition(self, '*', 'Destroyed', 'NO_TANKER')
    FSM.AddTransition(self, 'NO_TANKER', 'Spawned', 'EN_ROUTE')
    FSM.AddTransition(self, 'EN_ROUTE', 'Arrived', 'ORBIT')
    FSM.AddTransition(self, 'ORBIT', 'WaitRTB', 'EN_ROUTE')
    
    -- Log errors on special event "Failure"
    function self:OnBeforeFailure(from, to, event, text)
        self:Debug('ERROR: '..text)
    end
    
    -- Spawn a tanker group
    function self:SpawnNewTanker()    
        self.group = _TANKER.Tanker:New(self.spawner:Spawn())
    
        -- Schedules the creation of the TACAN 10 seconds later, so the unit has time to appear
        self.tacan_scheduler = SCHEDULER:New(
          nil,
          function( fsm )
            if fsm.beacon ~= nil then
              fsm.beacon:StopAATACAN()
              fsm.group:Debug('stopping previous TACAN on channel: '..fsm.tacan_channel..'Y')
            end
            local unit = fsm.group:GetUnit(1)
            fsm.beacon = unit:GetBeacon()
            fsm.beacon:AATACAN(fsm.tacan_channel, fsm.template_name, true)
            fsm.group:Debug('starting TACAN on channel: '..fsm.tacan_channel..'Y')
          end, { self }, 10
        )
    end
    
    -- Triggered when the FSM is ready to work
    function self:OnLeaveINIT(from, event, to)
        self:Debug('initializing FSM')
        self:Debug('creating spawner')
        self.spawner = SPAWN:New(self.template_name)
    end
    
    -- Triggered when there is no *active* tanker
    function self:OnEnterNO_TANKER(from, event, to)
        self:Debug('no tanker available; spawning new tanker')
        
        self:SpawnNewTanker()
        
        -- If we come from "INIT" (the first ever state)
        if from == 'INIT' then
        
            -- Create a zone around the first "Orbit" waypoint
            self:Debug('registering zone')
            local zone = self.group:ZoneFromOrbitWaypoint()
            
            -- If we didn't find an "Orbit" waypoint, fail miserably
            if zone == nil then
                self:Failure('no waypoint with task "Orbit" found for template: '..self.template_name)
            end
            
            -- Otherwise, we're golden
            self.zone = zone
        
        end
        
        -- Let the FSM know we have a valid tanker
        self:Debug('registering new group: '..self.group:GetName())
        self:Spawned()
      
    end
    
    -- Triggered when there's a tanker making its way to the refueling track
    function self:OnEnterEN_ROUTE(from, event, to)
    
        -- Triggered by a tanker almost out of fuel
        if event == 'WaitRTB' then
            self:Debug('a new tanker is on its way')
        end
      
        -- Periodic check for tanker position
        self:Debug('monitoring tanker progress to Orbit waypoint')
        self.monitor_arriving_tanker = SCHEDULER:New(
            nil,
            function(fsm, event)
            
                -- Check that it's still alive
                if not fsm.group:IsAlive() then
                    fsm:Debug('transiting tanker has been destroyed')
                    
                    -- Kill the periodic check
                    fsm.monitor_arriving_tanker:Stop()
                    
                    -- Let the FSM know that someone derped
                    fsm:Destroyed()
                
                -- When the tanker arrives at the orbit waypoint
                elseif fsm.group:IsCompletelyInZone(fsm.zone) then
                
                    fsm:Debug('tanker has arrived')
                    
                    -- Kill the periodic check
                    fsm.monitor_arriving_tanker:Stop()
                    
                    -- If an WaitRTB event triggered the state
                    if event == 'WaitRTB' then            
                    
                        self:Debug('sending previous tanker home')
                        for _, tanker in ipairs(fsm.previous_tankers) do
                            if tanker and tanker:IsAlive() then
                                tanker:RTB()
                            end
                        end
                    end
            
                    -- Let the FSM know that we now have a tanker on station
                    fsm:Arrived()
                end
            end,
            {self, event}, 10, 10, 0, 0
        )    
    end
    
    -- "Normal" state of the FSM; there's a tanker orbiting
    function self:OnEnterORBIT(from, event, to)
        self:Debug('tanker is orbiting at waypoint')
        
        -- Periodic check
        self.monitor_orbiting_tanker = SCHEDULER:New(
        nil,
        function()
            
            -- Is the tanker dead ?
            if not self.group:IsAlive() then
                self:Debug('orbiting tanker has been destroyed')
                
                -- kill the check
                self.monitor_orbiting_tanker:Stop()
                
                -- remove the debug menu
                self.group:remove_debug_menu()
                
                -- let the FSM know
                self:Destroyed()
            
            -- Is the tanker out of fuel ?
            elseif self.group:GetFuel() <= _TANKER_MIN_FUEL then
                self:Debug('tanker will soon be out of fuel, spawning a new one')
                
                -- Register the tanker for later RTB
                table.insert (self.previous_tankers, self.group)
                
                -- Kill the check
                self.monitor_orbiting_tanker:Stop()
                
                -- Start a new tanker on the apron
                self:SpawnNewTanker()
                
                -- Switch to the waiting state
                self:WaitRTB()
            end
        end,
        {}, 10, 10, 0, 0)    
    end
    
    return self
end
  
-- Start the tanker module
do

    _TANKER.INFO('TANKER: INIT: START')
    
    -- Iterate over all the tanker templates
    for _, unit in ipairs( _TANKER_UNITS ) do
    
        _TANKER.DEBUG('INIT: initializing tanker unit: '..unit.NAME)
        
        -- Create the FSM
        local fsm = _TANKER.FSM:New(unit)
        
        -- Add it for sanity's sake
        _TANKER._fsm[unit.NAME] = fsm
        
        -- And start it
        fsm:Ready()
    end
        
    _TANKER.INFO('TANKER: INIT: DONE')

end
