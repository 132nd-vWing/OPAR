do
--create an instance of the IADS
redIADS = SkynetIADS:create('SIXTHCORPS')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('SIXTHSBORKA')


--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('SIXTHAD')


--add a command center:
commandCenter = StaticObject.getByName('SIXTHCORPSCOMMANDCENTER')
redIADS:addCommandCenter(commandCenter)

--activate the IADS
redIADS:activate()

end
