
--- MOOSE config
local Trainer = MISSILETRAINER
  :New( 100, "132nd Missile Trainer is active" )
  :InitMessagesOnOff(true)
  :InitAlertsToAll(true) 
  :InitAlertsHitsOnOff(true)
  :InitAlertsLaunchesOnOff(false) -- I'll put it on below ...
  :InitBearingOnOff(true)
  :InitRangeOnOff(true)
  :InitTrackingOnOff(true)
  :InitTrackingToAll(true)
  :InitMenusOnOff(false)

-- Now alerts are also on
Trainer:InitAlertsToAll(true)


-- Flags in use:
-- F10 Formation Trainer

-- F11 DUSHETI Beacon
-- F12 TIANETI Beacon
-- F13 TETRA Beacon
-- F14 MARNUELI BEACON
-- F15 Lochini Beacon
-- F16 Stop all Beacons


-- This line goes into a doscrip trigger in the mission editor
-- formation_respawn = SPAWN:New( 'FORMATION' ):InitLimit( 1, 10 ):InitRepeatOnEngineShutDown():SpawnScheduled( 120, 0 )



--- Tanker and AWACS respawns
texaco_respawn = SPAWN:New( 'Tanker Texaco' ):InitLimit(1,10):InitRepeatOnEngineShutDown():SpawnScheduled( 120, 0 )
arco_respawn = SPAWN:New( 'Arco' ):InitLimit(1,10):InitRepeatOnEngineShutDown():SpawnScheduled( 120, 0 )
-- shell_respawn = SPAWN:New( 'Shell' ):InitLimit(1,10):InitRepeatOnEngineShutDown():SpawnScheduled( 120, 0 )
awacs_respawn = SPAWN:New( 'AWACS' ):InitLimit(1,10):InitRepeatOnEngineShutDown():SpawnScheduled( 120, 0 )


--- CTLD Modified Functions--
-- borrowed this function from CTLD to spawn just a single Manpad as CTLD-compatible group at a vec3
function ctld.spawnGroupAtPoint_SAR(_position)
    local _groupDetails = ctld.generateTroopTypes(2, {aa=1}, 2)
    local _droppedTroops = ctld.spawnDroppedGroup(_position, _groupDetails, false, 0);
    table.insert(ctld.droppedTroopsBLUE, _droppedTroops:getName())
    return _groupDetails
end

--- RANGE Smoke activation
local function SmokeMARNUELI() 
  Marnueli_Smoke = ZONE:New( "MARNUELI ConvCircleWest" ):SmokeZone( SMOKECOLOR.Green, 30 )
end

--- TETRA Range activated Search and Rescue Tasking--
-- This will spawn a simulated planewreck, at a random location within TETRA range, together with a CTLD-compatible Manpad unit that can be rescued or used as a JTAC. 
-- The 'downed pilot' will automatically deploy a CTLD radio beacon
function SARTETRA()
  -- SARtemplate can be any unit that is simply used as a spawn location for the pilot
  -- SARtemplate = SPAWN:New("SARtemplate"):InitRandomizeUnits( true, 11000, 8000 ):Spawn()
  SARpos = mist.utils.makeVec3GL(ZONE:New("SAR_TETRA_1"):GetRandomVec2(10000), 0)
  
  
  -- this line is optional and could be commented out. This will spawn an A10 without fuel at the crash site so a 'real' wreck will be produced close by
  SPAWN:New("crashplane"):SpawnFromVec3(SARpos)  
  
  -- This calls the modified CTLD function to spawn a single Manpad as 'downed pilot'
  SARtemplate = GROUP:Register(ctld.spawnGroupAtPoint_SAR(SARpos).name)
  ctld.beaconCount = ctld.beaconCount + 1
  ctld.createRadioBeacon(SARpos, 2, 2, "CRASHSITE TETRA" .. ctld.beaconCount - 1, 120)
  MESSAGE:New( "Simulated Plane Crash at TETRA. Radio Beacon active at the Crashsite (use CTLD Beacons to home in)", 7):ToBlue()
end


--- TETRA deploy smoke on downed pilot Range Search and Rescue Tasking--
local function SARSmoke()
  trigger.action.smoke(SARpos,SMOKECOLOR.Green)
  MESSAGE:New( "Green Smoke on the Deck at Downed Pilot Location!", 7):ToBlue()
end

--- TETRA activate hostiles moving towards the crashsite Range Search and Rescue Tasking--
local function SARhostiles()
  vec2Target = mist.utils.makeVec2(SARpos)
  
  -- this will generate a zone around the crashsite which is used to stop armored vehicles from rolling over the downed pilot
  -- innercircle = ZONE_GROUP:New("innercircle",SARtemplate,1000)
  innercircle = ZONE_RADIUS:New("innercircle",vec2Target,1000)
  
  -- this will generate a smaller zone around the crashsite like above, for infantrycarriers
  -- innercircle2 = ZONE_GROUP:New("innercircle2",SARtemplate,600) 
  innercircle = ZONE_RADIUS:New("innercircle2",vec2Target,600)


  -- -- for debugging, uncomment to make the above zone visible
  -- innercircle:SmokeZone( SMOKECOLOR.Green )
  
  -- This will spawn in enemies from random locations outside the crashsite
  SARtemplate1 = SPAWN:New("SARenemy1"):InitRandomizeUnits( true, 13000, 9000 ):SpawnFromVec3(SARpos):TaskRouteToVec3(SARpos, 15)
  SARtemplate2 = SPAWN:New("SARenemy2"):InitRandomizeUnits( true, 12000, 7000 ):SpawnFromVec3(SARpos):TaskRouteToVec3(SARpos, 15)
  SARtemplate3 = SPAWN:New("SARenemy3"):InitRandomizeUnits( true, 19000, 9000 ):SpawnFromVec3(SARpos):TaskRouteToVec3(SARpos, 15)
  SARtemplate4 = SPAWN:New("SARenemy4"):InitRandomizeUnits( true, 17000, 7000 ):SpawnFromVec3(SARpos):TaskRouteToVec3(SARpos, 15)
  SARtemplate5 = SPAWN:New("SARenemy5"):InitRandomizeUnits( true, 16000, 6000 ):SpawnFromVec3(SARpos):TaskRouteToVec3(SARpos, 15)

  SARtemplate1_engage = SCHEDULER:New( nil,
    function()
      if SARtemplate1:IsCompletelyInZone( innercircle ) then
        SARtemplate1:SetTask({id = 'FireAtPoint', params = {x=vec2Target.x + 50, y=vec2Target.y + 70, radius=200, expendQty=100, expendQtyEnabled=false}}, 1)
        SARtemplate1_engage:Stop()
      end 
    end,
  {}, 0, 15 )

  SARtemplate2_engage = SCHEDULER:New( nil,
    function()  
      if SARtemplate2:IsCompletelyInZone( innercircle2 ) then
        -- slow down the transporter
        SARtemplate2:TaskRouteToVec3(SARpos, 0) 
        SARInfantry_location = SARtemplate2:GetVec3()
        SARInfantry = SPAWN:New("SARInfantry"):SpawnFromVec3(SARInfantry_location)
        SARInfantry:SetTask({id = 'FireAtPoint', params = {x=vec2Target.x + 40, y=vec2Target.y + 40, radius=200, expendQty=100, expendQtyEnabled=false}}, 1)
        SARtemplate2_engage:Stop()
      end 
    end,
  {}, 0, 15 )


  SARtemplate3_engage = SCHEDULER:New( nil,
    function()

      if SARtemplate3:IsCompletelyInZone( innercircle ) then
        SARtemplate3:SetTask({id = 'FireAtPoint', params = {x=vec2Target.x + 100, y=vec2Target.y + 100, radius=200, expendQty=100, expendQtyEnabled=false}}, 1)
        SARtemplate3_engage:Stop()
      end 
    end,
  {}, 0, 15 )

  SARtemplate4_engage = SCHEDULER:New( nil,
    function()
      if SARtemplate4:IsCompletelyInZone( innercircle ) then
        SARtemplate4:SetTask({id = 'FireAtPoint', params = {x=vec2Target.x + 80, y=vec2Target.y + 120, radius=200, expendQty=100, expendQtyEnabled=false}}, 1)
        SARtemplate4_engage:Stop()
      end 
    end,
  {}, 0, 15 )

  SARtemplate5_engage = SCHEDULER:New( nil,
    function()
      if SARtemplate5:IsCompletelyInZone( innercircle ) then
        SARtemplate5:SetTask({id = 'FireAtPoint', params = {x=vec2Target.x + 40 , y=vec2Target.y + 90, radius=200, expendQty=100, expendQtyEnabled=false}}, 1)
        SARtemplate5_engage:Stop()
      end 
    end,
   {}, 0, 15 )
end  

--- RANGE  Functions-randomize movement --
-- will spread out the targets at the respective ranges. Respawned units will hold but can be spread out by calling the function again--

local function randomize_range_movement(flag, range_name)
  trigger.action.setUserFlag(flag, true)
  MESSAGE:New( "Targets spreading out at " .. range_name, 7):ToBlue()
end

--- RANGE Options --
Range_Options = MENU_COALITION:New( coalition.side.BLUE, "Range Options" )
range_menu_tetra = MENU_COALITION:New( coalition.side.BLUE, "Tetra", Range_Options )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Randomize TETRA Movement", range_menu_tetra, randomize_range_movement, 20, "TETRA" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Deploy Infantry at TETRA", range_menu_tetra, ctld.unloadTransport, "TETRA_Transport 1" )
range_menu_tianeti = MENU_COALITION:New( coalition.side.BLUE, "Tianeti", Range_Options )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Randomize TIANETI Movement", range_menu_tianeti, randomize_range_movement, 30, "TIANETI" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Deploy Infantry at TIANETI", range_menu_tianeti, ctld.unloadTransport, "TIANETI_Transport 1" )
range_menu_dusheti = MENU_COALITION:New( coalition.side.BLUE, "Dusheti", Range_Options )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Randomize DUSHETI Movement", range_menu_dusheti, randomize_range_movement, 40, "DUSHETI" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Deploy Infantry at DUSHETI", range_menu_dusheti, ctld.unloadTransport, "DUSHETI_Transport 1" )
range_menu_marnueli = MENU_COALITION:New( coalition.side.BLUE, "Marnueli", Range_Options )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Randomize MARNUELI Movement", range_menu_marnueli, randomize_range_movement, 50, "MARNUELI" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Deploy Infantry at MARNUELI", range_menu_marnueli, ctld.unloadTransport, "MARNUELI_Transport 1" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Smoke on Bomb Circle at MARNUELI", range_menu_marnueli, SmokeMARNUELI )

--- BEACON options
Beacon_Options = MENU_COALITION:New( coalition.side.BLUE, "ARK-UD Beacons" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Ark-UD at DUSHETI", Beacon_Options, trigger.action.setUserFlag, 11, true )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Ark-UD at TIANETI", Beacon_Options, trigger.action.setUserFlag, 12, true )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Ark-UD at TETRA", Beacon_Options, trigger.action.setUserFlag, 13, true )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Ark-UD at MARNUELI", Beacon_Options, trigger.action.setUserFlag, 14, true )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Ark-UD at LOCHINI", Beacon_Options, trigger.action.setUserFlag, 15, true )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Deactivate all Ark-UD Beacons", Beacon_Options, trigger.action.setUserFlag, 16, true )

--- SAR options
SAR_Options = MENU_COALITION:New( coalition.side.BLUE, "Search and Rescue" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Crashsite", SAR_Options, SARTETRA )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Request Smoke on the Crashsite", SAR_Options, SARSmoke )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Hostile Forces", SAR_Options, SARhostiles )


--- RANGE targets respawn

--- RANGE targets respawn - TETRA
-- Flags for Tetra 20-29 --
-- JTAC FLAGS for TETRA 70-79
TET_Shilka = SPAWN:New( "TETRA_Shilka" ):InitLimit( 2, 20 ):InitRandomizeRoute(1,0,4000):SpawnScheduled( 20, 0 )
TET_T55 = SPAWN:New( "TETRA_T55" ):InitLimit( 5, 20 ):InitRandomizeRoute(1,0,4000):SpawnScheduled( 20, 0 )
TET_Sa13 = SPAWN:New( "TETRA_Sa13" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,4000):SpawnScheduled( 20, 0 )
TET_BMP = SPAWN:New( "TETRA_BMP" ):InitLimit( 4, 20 ):InitRandomizeRoute(1,0,4000):SpawnScheduled( 20, 0 )
TET_Sa19 = SPAWN:New( "TETRA_Sa19" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,4000):SpawnScheduled( 20, 0 )

--- RANGE targets respawn - TIANETI 
-- FLAGS FOR TIANETI 30-39 --
-- JTAC FLAGS for TIANETI 50-59
TIA_Shilka = SPAWN:New( "TIANETI_Shilka" ):InitLimit( 2, 20 ):InitRandomizeRoute(1,0,3000):SpawnScheduled( 20, 0 )
TIA_T55 = SPAWN:New( "TIANETI_T55" ):InitLimit( 5, 20 ):InitRandomizeRoute(1,0,3000):SpawnScheduled( 20, 0 )
TIA_Sa13 = SPAWN:New( "TIANETI_Sa13" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,3000):SpawnScheduled( 20, 0 )
TIA_BMP = SPAWN:New( "TIANETI_BMP" ):InitLimit( 4, 20 ):InitRandomizeRoute(1,0,3000):SpawnScheduled( 20, 0 )
TIA_Sa19 = SPAWN:New( "TIANETI_Sa19" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,3000):SpawnScheduled( 20, 0 )

--- RANGE targets respawn - DUSHETI
-- FLAGS FOR DUSEHTI 40-49 --
-- JTAC FLAGS for DUSHETI 60-69
DUS_Shilka = SPAWN:New( "DUSHETI_Shilka" ):InitLimit( 2, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
DUS_Sa13 = SPAWN:New( "DUSHETI_Sa13" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
DUS_BMP = SPAWN:New( "DUSHETI_BMP" ):InitLimit( 4, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
DUS_Sa19 = SPAWN:New( "DUSHETI_Sa19" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
DUS_T55 = SPAWN:New( "DUSHETI_T55" ):InitLimit( 5, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )

--- RANGE targets respawn - MARNUELI
-- FLAGS FOR MARNUELI 80-89 --
-- JTAC FLAGS for MARNUELI 90-99
MAN_Shilka = SPAWN:New( "MARNUELI_Shilka" ):InitLimit( 2, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
MAN_Sa13 = SPAWN:New( "MARNUELI_Sa13" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
MAN_BMP = SPAWN:New( "MARNUELI_BMP" ):InitLimit( 4, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
MAN_Sa19 = SPAWN:New( "MARNUELI_Sa19" ):InitLimit( 1, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )
MAN_T55 = SPAWN:New( "MARNUELI_T55" ):InitLimit( 5, 20 ):InitRandomizeRoute(1,0,2000):SpawnScheduled( 20, 0 )

