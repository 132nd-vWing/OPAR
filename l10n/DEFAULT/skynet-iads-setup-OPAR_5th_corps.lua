do
--create an instance of the IADS
redIADS = SkynetIADS:create('FIFTHCORPS')

---debug settings remove from here on if you do not wan't any output on what the IADS is doing by default
local iadsDebug = redIADS:getDebugSettings()
iadsDebug.IADSStatus = true
iadsDebug.radarWentDark = true
iadsDebug.contacts = true
iadsDebug.radarWentLive = true
iadsDebug.noWorkingCommmandCenter = true
iadsDebug.samNoConnection = true
iadsDebug.jammerProbability = true
iadsDebug.addedEWRadar = true
iadsDebug.harmDefence = true
---end remove debug ---


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('FIFTHSBORKA')


--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('FIFTHAD')


--add a command center:
commandCenter = StaticObject.getByName('FIFTHCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)


--activate the IADS
redIADS:activate()

end
