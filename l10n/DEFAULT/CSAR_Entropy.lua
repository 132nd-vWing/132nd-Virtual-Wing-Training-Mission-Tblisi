

function Skinnybeacon()
SkinnyPos = Skinny:GetRandomVec3(15)
ctld.beaconCount = ctld.beaconCount + 1
ctld.createRadioBeacon(SkinnyPos, 2, 2, "Ejected Pilot" .. ctld.beaconCount - 1, 120)
end

SetClient = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories("plane"):FilterStart()
SetClient:HandleEvent (EVENTS.Ejection)

function SetClient:OnEventEjection(EventData)
-- MessageToAll("MAYDAY MAYDAY MAYDAY",15)
   SkinnyPilot = EventData.IniUnit   
   CrashPos = SkinnyPilot:GetVec2()
   SkinnyZone = ZONE_RADIUS:New("SkinnyZone",CrashPos,3000)
   Skinny = SPAWN:New("Skinny"):SpawnInZone(SkinnyZone,true)
   table.insert(ctld.extractableGroups, Skinny)

SkinnyMenu = MENU_COALITION:New(coalition.side.BLUE,"radio option for Ejected pilot")
MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate Homing Beacon",SkinnyMenu,Skinnybeacon)

-- Let's get a reference to Skinny's RADIO
EmergencyRadio = Skinny:GetRadio()  

-- Now, we'll set up the ntransmission
EmergencyRadio:SetFileName("ejection.ogg")  -- We first need the file name of a sound,
EmergencyRadio:SetFrequency(243)         -- then a frequency in MHz,
EmergencyRadio:SetModulation(radio.modulation.AM) -- and a modulation 
EmergencyRadio:SetLoop(false) -- optional set true to loop it
EmergencyRadio:Broadcast()
end 

