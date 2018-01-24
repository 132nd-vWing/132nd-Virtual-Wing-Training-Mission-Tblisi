-- activate advanced scenario
function FLAG80() 
trigger.action.setUserFlag(80, true)
end

-- deactivate advanced scenario
function FLAG81() 
trigger.action.setUserFlag(81, true)
end
-- Sa6 on
function FLAG60() 
trigger.action.setUserFlag(60, true)
end

-- Sa6 off
function FLAG61() 
trigger.action.setUserFlag(61, true)
end

-- Gori Convoy Start Moving
function FLAG95() 
trigger.action.setUserFlag(95, true)
end

-- Gori Convoy Stop Moving
function FLAG96() 
trigger.action.setUserFlag(96, true)
end

-- Cory Convoy IED explosion EAST 
function FLAG97() 
trigger.action.setUserFlag(97, true)
end

-- Gori Convoy IED explosion WEST 
function FLAG98() 
trigger.action.setUserFlag(98, true)
end




SCHEDULER:New( nil,
  function()
NecksPlane = GROUP:FindByName( "617th Neck AC" )
      if NecksPlane and NecksPlane:IsAlive() then
       AdvancedMenus =  MENU_GROUP:New( NecksPlane, "Advanced Menus" )
        MENU_GROUP_COMMAND:New( NecksPlane, "Activate Advanced scenario", AdvancedMenus, FLAG80, NecksPlane)
        MENU_GROUP_COMMAND:New( NecksPlane, "Deactivate advanced scenario", AdvancedMenus, FLAG81, NecksPlane)
        MENU_GROUP_COMMAND:New( NecksPlane, "Sa-6 ON", AdvancedMenus, FLAG60, NecksPlane)
        MENU_GROUP_COMMAND:New( NecksPlane, "Sa-6 OFF", AdvancedMenus, FLAG61, NecksPlane)
      end
end, {}, 10, 30 )

SCHEDULER:New( nil,
  function()
EntropyPlane = GROUP:FindByName( "617th Entropy AC" )
      if EntropyPlane and EntropyPlane:IsAlive() then
       EntropyAdvancedMenus =  MENU_GROUP:New( EntropyPlane, "Advanced Menus" )
        MENU_GROUP_COMMAND:New( EntropyPlane, "Activate Advanced scenario", EntropyAdvancedMenus, FLAG80, EntropyPlane)
        MENU_GROUP_COMMAND:New( EntropyPlane, "Deactivate advanced scenario", EntropyAdvancedMenus, FLAG81, EntropyPlane)
        MENU_GROUP_COMMAND:New( EntropyPlane, "Sa-6 ON", EntropyAdvancedMenus, FLAG60, EntropyPlane)
        MENU_GROUP_COMMAND:New( EntropyPlane, "Sa-6 OFF", EntropyAdvancedMenus, FLAG61, EntropyPlane)
      end
end, {}, 10, 30 )

SCHEDULER:New( nil,
  function()
GORI_RANGE_JTAC = GROUP:FindByName( "GORI_RANGE_JTAC" )
      if GORI_RANGE_JTAC and GORI_RANGE_JTAC:IsAlive() then
       GoriAdvancedMenus =  MENU_GROUP:New( GORI_RANGE_JTAC, "Gori Range Convoy Options" )
        MENU_GROUP_COMMAND:New( GORI_RANGE_JTAC, "Start Moving", GoriAdvancedMenus, FLAG95, GORI_RANGE_JTAC)
        MENU_GROUP_COMMAND:New( GORI_RANGE_JTAC, "Stop Moving", GoriAdvancedMenus, FLAG96, GORI_RANGE_JTAC)
        MENU_GROUP_COMMAND:New( GORI_RANGE_JTAC, "IED explosion EAST", GoriAdvancedMenus, FLAG97, GORI_RANGE_JTAC)
        MENU_GROUP_COMMAND:New( GORI_RANGE_JTAC, "IED explosion WEST", GoriAdvancedMenus, FLAG98, GORI_RANGE_JTAC)
      end
end, {}, 10, 30 )

SCHEDULER:New( nil,
  function()
TKIBULI_JTAC = GROUP:FindByName( "TKIBULI_JTAC" )
      if TKIBULI_JTAC and TKIBULI_JTAC:IsAlive() then
       TKBULIAdvancedMenus =  MENU_GROUP:New( TKIBULI_JTAC, "TKIBULI Range Options" )
        MENU_GROUP_COMMAND:New( TKIBULI_JTAC, "Sa-6 ON", TKBULIAdvancedMenus, FLAG60, TKIBULI_JTAC)
        MENU_GROUP_COMMAND:New( TKIBULI_JTAC, "Sa-6 OFF", TKBULIAdvancedMenus, FLAG61, TKIBULI_JTAC)
       end
end, {}, 10, 30 )

SCHEDULER:New( nil,
  function()
TKIBULI_JTAC2 = GROUP:FindByName( "TKIBULI_JTAC 2" )
      if TKIBULI_JTAC2 and TKIBULI_JTAC2:IsAlive() then
       TKBULI2AdvancedMenus =  MENU_GROUP:New( TKIBULI_JTAC2, "TKIBULI Range Options" )
        MENU_GROUP_COMMAND:New( TKIBULI_JTAC2, "Sa-6 ON", TKBULI2AdvancedMenus, FLAG60, TKIBULI_JTAC2)
        MENU_GROUP_COMMAND:New( TKIBULI_JTAC2, "Sa-6 OFF", TKBULI2AdvancedMenus, FLAG61, TKIBULI_JTAC2)
       end
end, {}, 10, 30 )




