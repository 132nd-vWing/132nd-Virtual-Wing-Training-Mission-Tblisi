--- Logistics Missions---


--CTLD Modified Functions--
-- took this function from CTLD to spawn a CTLD-compatible group at a vec3 instead of a zone
function ctld.spawnGroupAtPoint_Transport(_groupSide, _number, _point, _searchRadius)

    local _country
    if _groupSide == "red" then
        _groupSide = 1
        _country = 0
    else
        _groupSide = 2
        _country = 2
    end

    if _searchRadius < 0 then
        _searchRadius = 0
    end

    local _groupDetails = ctld.generateTroopTypes(_groupSide, _number, _country)

    local _droppedTroops = ctld.spawnDroppedGroup(_point, _groupDetails, false, _searchRadius);

    if _groupSide == 1 then
        table.insert(ctld.droppedTroopsRED, _droppedTroops:getName())
    else
        table.insert(ctld.droppedTroopsBLUE, _droppedTroops:getName())
    end
end
--/CTLD Modified Functions--




function PickupVIP()
Logisticscargotable = { "Logistics_cargo 1", "Logistics_cargo 2", "Logistics_cargo 3","Logistics_cargo 3","Logistics_cargo 4" } -- table for the guys standing around the troops
LogisticsCargoPickupZonetable = { ZONE_POLYGON:New("Logistics_Cargo_Pickup_Hospital", GROUP:FindByName( "Logistics_Cargo_Pickup_LochiniSouth" )),
ZONE_POLYGON:New("Logistics_Cargo_Pickup_LochiniSouth", GROUP:FindByName( "Logistics_Cargo_Pickup_Kutaisi" )),
ZONE_POLYGON:New("Logistics_Cargo_Pickup_TblisiArea", GROUP:FindByName( "Logistics_Cargo_Pickup_TblisiArea" )) } -- table for the 3 zones in which the troops will spawn
Logisticscargo = SPAWN:New( "Escort" ):InitRandomizeTemplate( Logisticscargotable ):InitRandomizeZones( LogisticsCargoPickupZonetable ):Spawn() -- this will spawn the 'escort and define the location-- 

VIPpos = Logisticscargo:GetVec3()
ctld.spawnGroupAtPoint_Transport("blue", {aa=2}, VIPpos, 10) -- This calls the modified CTLD function to spawn a two  Manpads as 'wounded soldier'
ctld.beaconCount = ctld.beaconCount + 1
ctld.createRadioBeacon(VIPpos, 2, 2, "Location of Injured Soldier" .. ctld.beaconCount - 1, 120)
MESSAGE:New( "Transport Tasking for Rescue Helicopters: An injured soldier needs to be transported to Lochini hospital, a beacon has been deployed at the pickup location (use CTLD Beacons to home in)", 7):ToBlue()
end

--  deploy smoke on injured solider for transport tasking--
local function VIPSmoke()
trigger.action.smoke(VIPpos,SMOKECOLOR.Green)
end
-- /--  deploy smoke on injured solider for transport tasking--


Transport_Taskings = MENU_COALITION:New( coalition.side.BLUE, "Transport Taskings" )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Activate Tasking: Pickup wounded solider for transport to Lochini Hospital", Transport_Taskings, PickupVIP )
MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Request Smoke at the location of the injured soldier", Transport_Taskings, VIPSmoke )

