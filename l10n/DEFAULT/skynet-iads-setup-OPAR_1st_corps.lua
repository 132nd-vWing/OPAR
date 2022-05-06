do
--create an instance of the IADS
redIADS = SkynetIADS:create('1stCorps')

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
