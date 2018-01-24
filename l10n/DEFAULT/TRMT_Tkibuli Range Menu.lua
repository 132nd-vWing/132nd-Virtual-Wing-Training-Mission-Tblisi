function Tkbuli_Sam_On()
GROUP:FindByName("TKIBULI_SAM_1"):SetAIOn()
MessageToAll("Tkibuli Sam Activated",10)
Tkibuli_Range_Sam_Off = MENU_MISSION_COMMAND:New("Deactivate Tkibuli Sam Systems",Tkibuli_Range_Options,Tkbuli_Sam_Off) 
Tkibuli_Range_Sam_On:Remove()
end

function Tkbuli_Sam_Off()
GROUP:FindByName("TKIBULI_SAM_1"):SetAIOff()
MessageToAll("Tkibuli Sam Deactivated",10) 
Tkibuli_Range_Sam_On = MENU_MISSION_COMMAND:New("Activate Tkibuli Sam Systems",Tkibuli_Range_Options,Tkbuli_Sam_On)
Tkibuli_Range_Sam_Off:Remove()
end

GROUP:FindByName("TKIBULI_SAM_1"):SetAIOff()
Tkibuli_Range_Options = MENU_MISSION:New("Tkibuli",TRMT.RANGES.MENU.ROOT)
Tkibuli_Range_Sam_On = MENU_MISSION_COMMAND:New("Activate Tkibuli Sam Systems",Tkibuli_Range_Options,Tkbuli_Sam_On)
