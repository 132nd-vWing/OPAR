do

--create an instance of the IADS
redIADS = SkynetIADS:create('2stCorps')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('SBORKA_2ND')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADIADS_2ND')


-- Go active at 70 percent
redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-5'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA-15BN-6'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-5'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-6'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-7'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

redIADS:getSAMSiteByGroupName('ADIADS_2ND_SA8_BN-8'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(50)

--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


--activate the IADS
redIADS:setupSAMSitesAndThenActivate()
DetectionSetGroup = SET_GROUP:New()
redIADS:addMooseSetGroup(DetectionSetGroup)
end
