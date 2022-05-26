do
--create an instance of the IADS
redIADS = SkynetIADS:create('SECONDCORPS')



--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('SECONDSBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('SECONDAD')

--add a command center:
commandCenter = StaticObject.getByName('SECONDCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)


-- POINT DEFENSES
local sa15 = redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA15_5')
redIADS:getEarlyWarningRadarByUnitName('SECONDSBORKA_22nd'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA15_8')
redIADS:getEarlyWarningRadarByUnitName('SECONDSBORKA_22nd'):addPointDefence(sa15)


local sa15 = redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA15_4')
redIADS:getEarlyWarningRadarByUnitName('SECONDSBORKA_21st'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA15_3')
redIADS:getEarlyWarningRadarByUnitName('SECONDSBORKA_21st'):addPointDefence(sa15)

-- ACTIVATION RANGE
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_1'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_2'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_3'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_4'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_5'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_6'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_7'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)
redIADS:getSAMSiteByGroupName('SECONDAD_2ND_SA8_7'):setGoLiveRangeInPercent(85):setHARMDetectionChance(80)



--activate the IADS
redIADS:activate()

end
