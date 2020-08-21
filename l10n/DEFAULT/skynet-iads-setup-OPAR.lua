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

--add all units with unit name beginning with 'EW' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('EWR')

--add all groups begining with group name 'SAM' to the IADS:
redIADS:addSAMSitesByPrefix('IADS')

--add a command center:
commandCenter = StaticObject.getByName('ADCC')
redIADS:addCommandCenter(commandCenter)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_1'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_2'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)

--add a power source and a connection node for this EW radar:
local connectionNodeEW = StaticObject.getByName('SCC_WEST')
redIADS:getEarlyWarningRadarByUnitName('EWR_W_3'):addPowerSource(powerSource):addConnectionNode(connectionNodeEW)





--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


--activate the IADS
redIADS:setupSAMSitesAndThenActivate()
end
