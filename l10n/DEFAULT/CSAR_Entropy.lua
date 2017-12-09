

--CTLD Modified Functions--
-- took this function from CTLD to spawn a CTLD-compatible group at a vec3 instead of a zone
function ctld.spawnGroupAtPoint_EJECT(_groupSide, _number, _point, _searchRadius)

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

function Skinnybeacon()
ctld.beaconCount = ctld.beaconCount + 1
ctld.createRadioBeacon(CrashPos, 2, 2, "Ejected Pilot" .. ctld.beaconCount - 1, 120)
--SkinnyPos = Skinny:GetRandomVec3(15)
--ctld.beaconCount = ctld.beaconCount + 1
--ctld.createRadioBeacon(SkinnyPos, 2, 2, "Ejected Pilot" .. ctld.beaconCount - 1, 120)
end

SetClient_Plane = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories("plane"):FilterStart()
SetClient_Helo  = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories("helicopter"):FilterStart()
SetClient_Plane:HandleEvent (EVENTS.Ejection)
SetClient_Helo:HandleEvent (EVENTS.Ejection)

function SetClient_Plane:OnEventEjection(EventData)
-- MessageToAll("MAYDAY MAYDAY MAYDAY",15)
   SkinnyPilot = EventData.IniUnit   
   CrashPos = SkinnyPilot:GetRandomVec3(3000)
   
   ctld.spawnGroupAtPoint_EJECT("blue", {aa=1}, CrashPos, 10) -- This calls the modified CTLD function to spawn a single Manpad as 'downed pilot'

-- play an emergency ejection sound to all players   
--trigger.action.outSound('ejection.ogg') play the sound for all
trigger.action.outSoundForCoalition(coalition.side.BLUE, 'ejection.ogg')
   
-- the below would be a specific beacon transmission that could be tuned in at the freq given below its deactivated right now and instead a sound to all is played
--SkinnyMenu = MENU_COALITION:New(coalition.side.BLUE,"radio option for Ejected pilot")
--MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate Homing Beacon",SkinnyMenu,Skinnybeacon)
--
---- we use a random unit as broadcast station
--EmergencyRadioStation = UNIT:FindByName("BLUE: HAWK SR GORI")
--EmergencyRadio = EmergencyRadioStation:GetRadio()
--
---- Now, we'll set up the transmission
--EmergencyRadio:SetFileName("ejection.ogg")  -- We first need the file name of a sound,
--EmergencyRadio:SetFrequency(243)         -- then a frequency in MHz,
--EmergencyRadio:SetModulation(radio.modulation.AM) -- and a modulation 
--EmergencyRadio:SetLoop(false) -- optional set true to loop it
--EmergencyRadio:Broadcast()
end 

function SetClient_Helo:OnEventEjection(EventData)
-- MessageToAll("MAYDAY MAYDAY MAYDAY",15)
   SkinnyPilot_helo = EventData.IniUnit   
   CrashPos2 = SkinnyPilot_helo:GetRandomVec3(500)
   
   ctld.spawnGroupAtPoint_EJECT("blue", {aa=1}, CrashPos2, 10) -- This calls the modified CTLD function to spawn a single Manpad as 'downed pilot'

-- play an emergency ejection sound to all players   
--trigger.action.outSound('ejection.ogg') play the sound for all
trigger.action.outSoundForCoalition(coalition.side.BLUE, 'ejection.ogg')
   
-- the below would be a specific beacon transmission that could be tuned in at the freq given below its deactivated right now and instead a sound to all is played
--SkinnyMenu = MENU_COALITION:New(coalition.side.BLUE,"radio option for Ejected pilot")
--MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate Homing Beacon",SkinnyMenu,Skinnybeacon)
--
---- we use a random unit as broadcast station
--EmergencyRadioStation = UNIT:FindByName("BLUE: HAWK SR GORI")
--EmergencyRadio = EmergencyRadioStation:GetRadio()
--
---- Now, we'll set up the transmission
--EmergencyRadio:SetFileName("ejection.ogg")  -- We first need the file name of a sound,
--EmergencyRadio:SetFrequency(243)         -- then a frequency in MHz,
--EmergencyRadio:SetModulation(radio.modulation.AM) -- and a modulation 
--EmergencyRadio:SetLoop(false) -- optional set true to loop it
--EmergencyRadio:Broadcast()
end 



