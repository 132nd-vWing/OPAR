do
--create an instance of the IADS
redIADS = SkynetIADS:create('FIRSTCORPS')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = false
iadsDebug.ewRadarNoConnection = false
iadsDebug.samNoConnection = false
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = false
iadsDebug.hasNoPower = false
iadsDebug.harmDefence = true
iadsDebug.samSiteStatusEnvOutput = true
iadsDebug.earlyWarningRadarStatusEnvOutput = true
iadsDebug.commandCenterStatusEnvOutput = true
---end remove debug ---

--add SA6 BN

redIADS:addSAMSitesByPrefix('FIRST_SA6BN')

--add SA11 BN
--redIADS:addSAMSitesByPrefix('FIRST_SA11_Batt1')

--redIADS:addSAMSitesByPrefix('FIRST_SA11_Batt2')


--set SA-6 site to always work as EWR
--redIADS:getSAMSiteByGroupName('FIRST_SA6BN'):samSite:setActAsEW(true)


-- Go active at 70 percent
--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_5'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_6'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_7'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_8'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('FIRSTSBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('FIRSTAD')

--add a command center:
commandCenter = StaticObject.getByName('FIRSTCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)


redIADS:addRadioMenu()

--activate the IADS
redIADS:activate()

end
