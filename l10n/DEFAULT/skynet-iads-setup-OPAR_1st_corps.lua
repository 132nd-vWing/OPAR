do
--create an instance of the IADS
redIADS = SkynetIADS:create('FIRSTCORPS')

--add SA6 BN

redIADS:addSAMSitesByPrefix('FIRST_SA6BN')

--add SA11 BN
redIADS:addSAMSitesByPrefix('FIRST_SA11_Batt1')

redIADS:addSAMSitesByPrefix('FIRST_SA11_Batt2')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('FIRSTSBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('FIRSTAD')

--add a command center:
commandCenter = StaticObject.getByName('FIRSTCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)


redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt1'):setGoLiveRangeInPercent(80):setHARMDetectionChance(50)

redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt2'):setGoLiveRangeInPercent(80):setHARMDetectionChance(50)

redIADS:getSAMSiteByGroupName('FIRST_SA6BN'):setGoLiveRangeInPercent(80):setHARMDetectionChance(50)


--activate the IADS
redIADS:activate()

end
