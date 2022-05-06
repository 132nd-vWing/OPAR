do
--create an instance of the IADS
redIADS = SkynetIADS:create('1stCorps')

--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('1ST_SBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('AD_1ST')

--add a command center:
commandCenter = StaticObject.getByName('1ST_13th_AD_DIV_C2')
redIADS:addCommandCenter(commandCenter)

--add SA6 BN

redIADS:addSAMSitesByPrefix('1ST_SA6BN')

--add SA11 BN
redIADS:addSAMSitesByPrefix('1ST_SA11_Batt1')

redIADS:addSAMSitesByPrefix('1ST_SA11_Batt2')


--set SA-6 site to always work as EWR
redIADS:getSAMSiteByGroupName('1ST_SA6BN'):samSite:setActAsEW(true)


-- Go active at 70 percent
redIADS:getSAMSiteByGroupName('AD_1ST_SA15_1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_3'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_4'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_5'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_6'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_7'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

redIADS:getSAMSiteByGroupName('AD_1ST_SA15_8'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)



--activate the IADS
redIADS:activate()

end
