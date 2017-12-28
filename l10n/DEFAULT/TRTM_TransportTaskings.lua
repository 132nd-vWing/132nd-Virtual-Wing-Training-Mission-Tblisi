-- root menu created in TRMT.lua
-- Transport_Taskings = MENU_MISSION:New("Transport Taskings" )

local function VIPSmoke()
    trigger.action.smoke(VIPpos,SMOKECOLOR.Red)
end

local function Lettersmoke()
    trigger.action.smoke(Letter_pos,SMOKECOLOR.Green)
end

function PickupVIP()
    Logisticscargotable = { "Logistics_cargo 1", "Logistics_cargo 2", "Logistics_cargo 3", "Logistics_cargo 3", "Logistics_cargo 4" } -- table for the guys standing around the troops
    
    LogisticsCargoPickupZonetable = { -- table for the 3 zones in which the troops will spawn
        ZONE_POLYGON:New("Logistics_Cargo_Pickup_Hospital", GROUP:FindByName( "Logistics_Cargo_Pickup_LochiniSouth" )),
        ZONE_POLYGON:New("Logistics_Cargo_Pickup_LochiniSouth", GROUP:FindByName( "Logistics_Cargo_Pickup_Kutaisi" )),
        ZONE_POLYGON:New("Logistics_Cargo_Pickup_TblisiArea", GROUP:FindByName( "Logistics_Cargo_Pickup_TblisiArea" ))
     }
    
    
 
    
    Logisticscargo_vip = SPAWN:New( "Escort" ):InitRandomizeTemplate( Logisticscargotable ):InitRandomizeZones( LogisticsCargoPickupZonetable ):Spawn() -- this will spawn the escort and define the location

    VIPpos = Logisticscargo_vip:GetVec3()
    VIPpos_beacon = Logisticscargo_vip:GetRandomVec3(3)
    ctld.spawnGroupAtPoint("blue", {aa=2}, VIPpos_beacon, 10) -- This calls the modified CTLD function to spawn two  Manpads as 'wounded soldier'
    ctld.beaconCount = ctld.beaconCount + 1
    ctld.createRadioBeacon(VIPpos, 2, 2, "Location of Injured Soldier" .. ctld.beaconCount - 1, 120)
    MESSAGE:New( "Transport Tasking for Rescue Helicopters: An injured soldier needs to be transported to Lochini hospital, a beacon has been deployed at the pickup location (use CTLD Beacons to home in)", 7):ToBlue()
    Transport_Menu_SMOKE = MENU_MISSION_COMMAND:New( "Request Red Smoke at the location of the injured soldier", Transport_Taskings, VIPSmoke )
    Transport_Menu_VIP:Remove()
end


function PickupLetter()
    Logisticscargotable = { "Logistics_cargo 1", "Logistics_cargo 2", "Logistics_cargo 3", "Logistics_cargo 3", "Logistics_cargo 4" } -- table for the guys standing around the troops
    
   LogisticsLetterPickupZonetable = { -- table for the 5 zones in which the documents need to be picked up
        ZONE_POLYGON:New("Logistics_documents_Pickup_1", GROUP:FindByName( "Logistics_documents_Pickup_1" )),
        ZONE_POLYGON:New("Logistics_documents_Pickup_2", GROUP:FindByName( "Logistics_documents_Pickup_2" )),
        ZONE_POLYGON:New("Logistics_documents_Pickup_3", GROUP:FindByName( "Logistics_documents_Pickup_3" )),
        ZONE_POLYGON:New("Logistics_documents_Pickup_4", GROUP:FindByName( "Logistics_documents_Pickup_4" )),
        ZONE_POLYGON:New("Logistics_documents_Pickup_5", GROUP:FindByName( "Logistics_documents_Pickup_5" ))
     }
      
    Logisticscargo_letter = SPAWN:New( "Letter" ):InitRandomizeTemplate( Logisticscargotable ):InitRandomizeZones( LogisticsLetterPickupZonetable ):Spawn() -- this will spawn the escort and define the location
    Letter_pos = Logisticscargo_letter:GetRandomVec3(5)
    Letter_pos_beacon = Logisticscargo_letter:GetVec3()
    ctld.spawnCrateAtPoint(blue,55,Letter_pos_beacon)
    ctld.beaconCount = ctld.beaconCount + 1
    ctld.createRadioBeacon(Letter_pos, 2, 2, "Location of Medical Supplies" .. ctld.beaconCount - 1, 120)
    MESSAGE:New( "Transport Tasking for Rescue Helicopters: A crate of medical equipment needs to be picked up from a local medical center and transported to Lochini hospital, a beacon has been deployed at the pickup location (use CTLD Beacons to home in)", 7):ToBlue()
    Transport_Menu_SMOKE_letter = MENU_MISSION_COMMAND:New( "Request Green Smoke at the pickup location of the medical supplies", Transport_Taskings, Lettersmoke )
    Transport_Menu_Letter:Remove()
end

Transport_Menu_VIP = MENU_MISSION_COMMAND:New( "Activate Tasking: Pickup wounded solider for transport to Lochini Hospital", Transport_Taskings, PickupVIP )
Transport_Menu_Letter = MENU_MISSION_COMMAND:New( "Activate Tasking: Pickup medical supplies and transport to Lochini Hospital", Transport_Taskings, PickupLetter )