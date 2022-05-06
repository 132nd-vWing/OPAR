do
--create an instance of the IADS
redIADS = SkynetIADS:create('1stCorps')

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


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('1ST_SBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('AD_1ST')

--add a command center:
commandCenter = StaticObject.getByName('1ST_13th_AD_DIV_C2')
redIADS:addCommandCenter(commandCenter)


redIADS:addRadioMenu()

--activate the IADS
redIADS:activate()

end
