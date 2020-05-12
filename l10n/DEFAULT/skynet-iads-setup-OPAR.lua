do
--create an instance of the IADS
redIADS = SkynetIADS:create('IRAN')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.samWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = false
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = false
iadsDebug.harmDefence = false
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
---end remove debug ---

--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EW')

--add all groups begining with group name 'SAM' to the IADS:
redIADS:addSAMSitesByPrefix('SAM')

--add a connection node to this SA-2 site, and set the option for it to go dark, if it looses connection to the IADS:
local connectionNode = Unit.getByName('Mobile-Command-Post-SAM-SA-2')
redIADS:getSAMSiteByGroupName('SAM_SA2_MILBASE'):addConnectionNode(connectionNode):setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK)

--add a connection node to this SA-3 site, and set the option for it to go dark, if it looses connection to the IADS:
local connectionNode = Unit.getByName('Mobile-Command-Post-SAM-SA-2')
redIADS:getSAMSiteByGroupName('SAM_SA3_NORTH'):addConnectionNode(connectionNode):setAutonomousBehaviour(SkynetIADSAbstractRadarElement.AUTONOMOUS_STATE_DARK)

--this SA-3 site will go live at 100% of its max search range:
redIADS:getSAMSiteByGroupName('SAM_SA3_NORTH'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(100)

--set this SA-3 site to go live at maximunm search range (default is at maximung firing range):
redIADS:getSAMSiteByGroupName('SAM_SA3_SOUTH'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()

--activate the IADS
redIADS:activate()	


	




end
