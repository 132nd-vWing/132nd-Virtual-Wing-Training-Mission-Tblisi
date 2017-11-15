function Skinnybeacon()
ctld.beaconCount = ctld.beaconCount + 1
ctld.createRadioBeacon(SkinnyPos, 2, 2, "Ejected Pilot" .. ctld.beaconCount - 1, 120)
end

SetClient = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories("plane"):FilterStart()
SetClient:HandleEvent (EVENTS.Ejection)

function SetClient:OnEventEjection(EventData)
-- MessageToAll("MAYDAY MAYDAY MAYDAY",15)
   SkinnyPilot = EventData.IniUnit   
   SkinnyPos = SkinnyPilot:GetVec3()
   Skinny = SPAWN:New("Skinny"):SpawnFromVec3(SkinnyPos)
   --group_details = ctld.generateTroopTypes(2, {aa=1}, 2)
   --SkinnyCTLD = ctld.spawnDroppedGroup(SkinnyPos, group_details, false, 0)
   table.insert(ctld.extractableGroups, Skinny)

SkinnyMenu = MENU_GROUP:New(Skinny,"radio option for Ejected pilot")
MENU_GROUP_COMMAND:New(Skinny, "Activate Homing Beacon",SkinnyMenu,Skinnybeacon)


-- Let's get a reference to Skinny's RADIO
EmergencyRadio = Skinny:GetRadio()  

-- Now, we'll set up the ntransmission
EmergencyRadio:SetFileName("ejection.ogg")  -- We first need the file name of a sound,
EmergencyRadio:SetFrequency(243)         -- then a frequency in MHz,
EmergencyRadio:SetModulation(radio.modulation.AM) -- and a modulation 
EmergencyRadio:SetLoop(false) -- optional set true to loop it
EmergencyRadio:Broadcast()
end 

