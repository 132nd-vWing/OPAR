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


--activate the IADS
redIADS:activate()

end
