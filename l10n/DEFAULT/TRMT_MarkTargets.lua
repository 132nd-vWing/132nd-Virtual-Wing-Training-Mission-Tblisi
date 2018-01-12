
       -- Add command to pop Flares on Ground Targets
  
 function TETRA_MarkTargets()
  local TETRA = ZONE:New("pickzone8")
  local TETRA_Targets = SET_GROUP:New():FilterPrefixes("Tetra_S"):FilterStart()
  TETRA_Targets:ForEachGroupNotInZone(TETRA,
  function (TETRA_Targets_Mark)
  TETRA_Targets_Mark:GetUnit(1):FlareRed()
  end)
end  

function DUSHETI_MarkTargets()
  local DUSHETI = ZONE:New("pickzone6")
  local DUSHETI_Targets = SET_GROUP:New():FilterPrefixes("Dusheti_S"):FilterStart()
  DUSHETI_Targets:ForEachGroupNotInZone(DUSHETI,
  function (DUSHETI_Targets_Mark)
  DUSHETI_Targets_Mark:GetUnit(1):FlareRed()
  end)
end  

function TIANETI_MarkTargets()
  local TIANETI = ZONE:New("pickzone7")
  local TIANETI_Targets = SET_GROUP:New():FilterPrefixes("Tianeti_S"):FilterStart()
  TIANETI_Targets:ForEachGroupNotInZone(TIANETI,
  function (TIANETI_Targets_Mark)
  TIANETI_Targets_Mark:GetUnit(1):FlareRed()
  end)
end  
  
MENU_MISSION_COMMAND:New( "FAC(A): Red Flare on Targets", TRMT.RANGES.TETRA.MENU, TETRA_MarkTargets )
MENU_MISSION_COMMAND:New( "FAC(A): Red Flare on Targets", TRMT.RANGES.DUSHETI.MENU, DUSHETI_MarkTargets )
MENU_MISSION_COMMAND:New( "FAC(A): Red Flare on Targets", TRMT.RANGES.TIANETI.MENU, TIANETI_MarkTargets )
  
