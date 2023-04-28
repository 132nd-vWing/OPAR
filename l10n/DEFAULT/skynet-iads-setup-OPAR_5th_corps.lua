do
--create an instance of the IADS
redIADS = SkynetIADS:create('FIFTHCORPS')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('FIFTHSBORKA')


--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('FIFTHAD')


--add a command center:
commandCenter = StaticObject.getByName('FIFTHCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)

-- GO active at 70%
redIADS:getSAMSiteByGroupName('FIFTHAD_SA11_BATT_1'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

-- GO active at 70%
redIADS:getSAMSiteByGroupName('FIFTHAD_SA6'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)

-- GO active at 70%
redIADS:getSAMSiteByGroupName('FIFTHAD_SA11_BATT_2'):setEngagementZone(SkynetIADSAbstractRadarElement.GO_LIVE_WHEN_IN_SEARCH_RANGE):setGoLiveRangeInPercent(70)


--activate the IADS
redIADS:activate()

end
