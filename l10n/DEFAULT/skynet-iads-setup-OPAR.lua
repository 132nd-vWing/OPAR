do

--create an instance of the IADS
redIADS = SkynetIADS:create('SYRIA')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.samWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.ewRadarNoConnection = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.hasNoPower = true
iadsDebug.harmDefence = true
---end remove debug ---

--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EWR')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('IADS')

--add a command center:
commandCenter = StaticObject.getByName('ADCC')
redIADS:addCommandCenter(commandCenter)




-- EWR CONNECTION NODES

-- EWR CONNECTION TO SECTOR COMMAND CENTER - WEST
--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_1-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_2-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_3-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)





-- EWR CONNECTION TO SECTOR COMMAND CENTER - WEST
--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_EAST')
redIADS:getEarlyWarningRadarByUnitName('EWR_E_1-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_EAST')
redIADS:getEarlyWarningRadarByUnitName('EWR_E_2-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_EAST')
redIADS:getEarlyWarningRadarByUnitName('EWR_E_3-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)




-- EWR CONNECTION TO SECTOR COMMAND CENTER - SOUTH
--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_SOUTH')
redIADS:getEarlyWarningRadarByUnitName('EWR_S_1-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_SOUTH')
redIADS:getEarlyWarningRadarByUnitName('EWR_S_2-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_SOUTH')
redIADS:getEarlyWarningRadarByUnitName('EWR_S_3-1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)






-- POINT DEFENCE


-- POINT DEFENCE SECTOR EAST
-- SA-2 Al Qusair
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_W_SA15_PD_1')
--redIADS:getSAMSiteByGroupName('IADS_W_SA2_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-2 Al Duhur
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_W_SA15_PD_3')
--redIADS:getSAMSiteByGroupName('IADS_W_SA2_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 Hama
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_W_SA15_PD_2')
--redIADS:getSAMSiteByGroupName('IADS_W_SA6_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 Aleppo
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_W_SA15_PD_4')
--redIADS:getSAMSiteByGroupName('IADS_W_SA6_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)




-- POINT DEFENCE SECTOR EAST
-- SA-2 Tabqua airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_E_SA15_PD_1')
--redIADS:getSAMSiteByGroupName('IADS_E_SA2_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-2 Jirah Airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_E_SA15_PD_2')
--redIADS:getSAMSiteByGroupName('IADS_E_SA2_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 TABQA Airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_E_SA15_PD_3')
--redIADS:getSAMSiteByGroupName('IADS_E_SA6_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 KUWEIRES airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_E_SA15_PD_4')
--redIADS:getSAMSiteByGroupName('IADS_E_SA6_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)




-- POINT DEFENCE SECTOR EAST
-- SA-2 Al Dumayr airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_S_SA15_PD_1')
--redIADS:getSAMSiteByGroupName('IADS_S_SA2_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-2 Damascus International
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_S_SA15_PD_2')
--redIADS:getSAMSiteByGroupName('IADS_S_SA2_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 An Nasaryia Airfield
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_S_SA15_PD_3')
--redIADS:getSAMSiteByGroupName('IADS_S_SA6_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

-- SA-6 EWR South
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_S_SA15_PD_4')
--redIADS:getSAMSiteByGroupName('IADS_S_SA6_2'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)






--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


--activate the IADS
redIADS:setupSAMSitesAndThenActivate()
end
