do

--create an instance of the IADS
redIADS = SkynetIADS:create('1stCorps')


--add all units with unit name beginning with 'EWR' to the IADS:
redIADS:addEarlyWarningRadarsByPrefix('SBORKA')

--add all groups begining with group name 'IADS' to the IADS:
redIADS:addSAMSitesByPrefix('ADIADS')







-- POINT DEFENCE


-- POINT DEFENCE SECTOR WEST
-- SA-2 Al Qusair
--local sa15 = redIADS:getSAMSiteByGroupName('IADS_W_SA15_PD_1')
--redIADS:getSAMSiteByGroupName('IADS_W_SA2_1'):addPointDefence(sa15):setHARMDetectionChance(100):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)



--activate the radio menu to toggle IADS Status output
redIADS:addRadioMenu()


--activate the IADS
redIADS:setupSAMSitesAndThenActivate()
DetectionSetGroup = SET_GROUP:New()
redIADS:addMooseSetGroup(DetectionSetGroup)
end
