do

--create an instance of the IADS
redIADS = SkynetIADS:create('1stCorps')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('SBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADIADS')


-- Go active at 70 percent
redIADS:getSAMSiteByGroupName('ADIADS_SA15_1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('ADIADS_SA15_2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('ADIADS_SA15_3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('ADIADS_SA15_4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('ADIADS_SA8_1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(80)

redIADS:getSAMSiteByGroupName('ADIADS_SA8_2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(80)

redIADS:getSAMSiteByGroupName('ADIADS_SA8_3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(80)

redIADS:getSAMSiteByGroupName('ADIADS_SA8_4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(80)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


--activate the IADS
redIADS:setupSAMSitesAndThenActivate()
DetectionSetGroup = SET_GROUP:New()
redIADS:addMooseSetGroup(DetectionSetGroup)
end
