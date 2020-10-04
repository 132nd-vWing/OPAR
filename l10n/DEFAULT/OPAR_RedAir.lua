

-- CAP active from Airbases --

Jirah_CAP  = true
Tabqah_CAP = true
Abu_Ul_Duhur_CAP = true
Hama_CAP = true
An_Nasiryah_CAP = true
Al_Dumary_CAP  = true
Khalkalah_CAP = true
Marj_Ruhayl_CAP = true



-- DISPATCHER
DetectionSetGroup = SET_GROUP:New()
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 ) --range in meters for targets to be grouped
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetEngageRadius() -- 100000 is the default value. Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetGciRadius() -- 200000 is the default value. Set 200km as the radius to ground control intercept.

CCCPBorderZone = ZONE_POLYGON:New( "RED-BORDER", GROUP:FindByName( "RED-BORDER" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )
A2ADispatcher:SetSquadron( "Kutaisi", AIRBASE.Caucasus.Kutaisi, { "Squadron red SU-27" }, 2 )
A2ADispatcher:SetSquadronGrouping( "Kutaisi", 2 )
A2ADispatcher:SetSquadronGci( "Kutaisi", 900, 1200 )
A2ADispatcher:SetTacticalDisplay(true)
A2ADispatcher:Start()
--END MOOSE CODE

-- add the MOOSE SET_GROUP to the IADS, from now on Skynet will update active radars that the MOOSE SET_GROUP can use for EW detection.
redIADS:addMooseSetGroup(DetectionSetGroup)