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


-- POINT DEFENSES
local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_10')
redIADS:getEarlyWarningRadarByUnitName('FIRSTSBORKA_10th'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_7')
redIADS:getEarlyWarningRadarByUnitName('FIRSTSBORKA_11th'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_6')
redIADS:getEarlyWarningRadarByUnitName('FIRSTSBORKA_11th'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_1')
redIADS:getEarlyWarningRadarByUnitName('FIRSTSBORKA_12th'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_3')
redIADS:getEarlyWarningRadarByUnitName('FIRSTSBORKA_12th'):addPointDefence(sa15)



local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_5')
redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt1'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_8')
redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt1'):addPointDefence(sa15)


local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_11')
redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt2'):addPointDefence(sa15)

local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_12')
redIADS:getSAMSiteByGroupName('FIRST_SA11_Batt2'):addPointDefence(sa15)


local sa15 = redIADS:getSAMSiteByGroupName('FIRSTAD_1ST_SA15_9')
redIADS:getSAMSiteByGroupName('FIRST_SA6BN'):addPointDefence(sa15)

--activate the IADS
redIADS:activate()

end
