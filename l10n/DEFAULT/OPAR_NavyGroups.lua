carrier_root_menu = MENU_MISSION:New("CSG_72_Abraham_Lincoln")

--- CVN72 Supercarrier ---
CVN72 = NAVYGROUP:New("CSG_72_1")
CVN72:SetPatrolAdInfinitum()
CVN72:SetDefaultROE(ENUMS.ROE.WeaponFree)
CVN_72_beacon_unit = UNIT:FindByName("CSG_72_Abraham_Lincoln")
if CVN_72_beacon_unit then
  CVN72_Beacon = CVN_72_beacon_unit:GetBeacon()
  CVN72_Beacon:ActivateICLS(12,"C72")
  env.info("CVN72 ICLS started on channel 12")
end

SCHEDULER:New(nil,function()
  if CVN_72_beacon_unit then
    CVN72_Beacon = CVN_72_beacon_unit:GetBeacon()
    CVN72_Beacon:ActivateTACAN(72,"X","C72",true)
    env.info("CVN72 Tacan refreshed")
  end
end,{},5,5*60)

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
menu_start_recovery = MENU_MISSION_COMMAND:New("Start Recovery at CVN72",carrier_root_menu,start_recovery)
--- CVN72 Supercarrier ---
