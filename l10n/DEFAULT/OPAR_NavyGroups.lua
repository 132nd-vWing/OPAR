carrier_root_menu = MENU_MISSION:New("CSG_72_Abraham_Lincoln")
--carrier_root_menu1 = MENU_MISSION:New("CSG_73_George_Washington")

--- CVN72 Supercarrier ---
CVN72 = NAVYGROUP:New("CVN_72_ABRAHAM_LINCOLN")
CVN72:SetPatrolAdInfinitum()
CVN72:SetDefaultROE(ENUMS.ROE.WeaponFree)
CVN_72_beacon_unit = UNIT:FindByName("CVN_72_ABRAHAM_LINCOLN")
if CVN_72_beacon_unit then
  CVN72_Beacon = CVN_72_beacon_unit:GetBeacon()
  CVN72_Beacon:ActivateICLS(12,"C72")
  env.info("CVN72 ICLS started on channel 12")
end

--- CVN73 Supercarrier ---
--CVN73 = NAVYGROUP:New("CVN_73_GEORGE_WASHINGTON")
--CVN73:SetPatrolAdInfinitum()
--CVN73:SetDefaultROE(ENUMS.ROE.WeaponFree)
--CVN_73_beacon_unit = UNIT:FindByName("CVN_73_GEORGE_WASHINGTON")
--if CVN_73_beacon_unit then
--  CVN73_Beacon = CVN_73_beacon_unit:GetBeacon()
--  CVN73_Beacon:ActivateICLS(13,"C73")
--  env.info("CVN73 ICLS started on channel 13")
--end




SCHEDULER:New(nil,function()
  if CVN_72_beacon_unit then
    CVN72_Beacon = CVN_72_beacon_unit:GetBeacon()
    CVN72_Beacon:ActivateTACAN(72,"X","C72",true)
    env.info("CVN72 Tacan refreshed")
  end
end,{},5,5*60)

--SCHEDULER:New(nil,function()
--  if CVN_73_beacon_unit then
--    CVN73_Beacon = CVN_73_beacon_unit:GetBeacon()
--    CVN73_Beacon:ActivateTACAN(73,"X","C73",true)
--    env.info("CVN73 Tacan refreshed")
--  end
--end,{},5,5*60)


function start_recovery()
  if CVN72:IsSteamingIntoWind() == true then
    MessageToAll("CVN-72 is already recovering, recovery window will closes at time "..timerecovery_end)
  else
    local timenow=timer.getAbsTime( )
    local timeend=timenow+45*60
    local timerecovery_start = UTILS.SecondsToClock(timenow,true)
    timerecovery_end = UTILS.SecondsToClock(timeend,true)
    CVN72:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,-9)
    MessageToAll("CVN72 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end)
  end
end



--function start_recovery1()
--  if CVN73:IsSteamingIntoWind() == true then
--    MessageToAll("CVN-73 is already recovering, recovery window will closes at time "..timerecovery_end)
--  else
--    local timenow=timer.getAbsTime( )
--    local timeend=timenow+45*60
--    local timerecovery_start = UTILS.SecondsToClock(timenow,true)
--    timerecovery_end = UTILS.SecondsToClock(timeend,true)
--    CVN73:AddTurnIntoWind(timerecovery_start,timerecovery_end,25,true,-9)
--    MessageToAll("CVN73 is turning, Recovery Window open from time "..timerecovery_start.." until "..timerecovery_end)
--  end
--end
menu_start_recovery = MENU_MISSION_COMMAND:New("Start Recovery at CVN72",carrier_root_menu,start_recovery)
--menu_start_recovery1 = MENU_MISSION_COMMAND:New("Start Recovery at CVN73",carrier_root_menu1,start_recovery1)

