

-- CAP active from Airbases --
local Redair_Debugging = false  --change to false to silence the messages

-- at missions start there is a 50% chance that one or two CAP will be launched, one per the table below.
-- You can comment out any entry in the table below if you dont want to launch CAP from it.
airfield_Cap_table = {
  "Jirah",
  "Tabqa",
  "Abu al-Duhur",
  "Hama",
  "An Nasiriyah",
"Al-Dumayr",
"Khalkhalah",
"Marj Ruhayyil"
}
-- these are the airfields that will launch QRF fighters upon detection by Skynet. you can comment out as many as you want.
airfield_GCI_table = {
  "Jirah",
  "Tabqa",
  "Abu al-Duhur",
  "Hama",
"An Nasiriyah",
"Al-Dumayr",
"Khalkhalah",
"Marj Ruhayyil"
}

local function pickNumber() -- picks a random number of 1-4 with a weighting of 2 about 2/3rds of the time
  local choose = math.random(1,100)
  if choose < 1 then env.info("someone is a singleton") return 1
  elseif choose >=1 and choose < 98 then env.info("someone is a 2ship") return 2
  elseif choose >= 98 and choose < 99 then env.info("someone is a 3 ship") return 3
  elseif choose >= 99 then env.info("someone is a fourship") return 4
  end
end



--- CAP

local number_of_CAP_Airfield = math.random(1,#airfield_Cap_table)
for i,_cap_airfield in ipairs(airfield_Cap_table) do
  if i == number_of_CAP_Airfield then
    CAP_Airfield1 = _cap_airfield
    table.remove(airfield_Cap_table,i)
  end
end
env.info(CAP_Airfield1.." has CAP enabled")
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 ) --range in meters for targets to be grouped
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetEngageRadius() -- 100000 is the default value. Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetGciRadius() -- 200000 is the default value. Set 200km as the radius to ground control intercept.


CCCPBorderZone = ZONE_POLYGON:New( "ColdBorder", GROUP:FindByName( "ColdBorder" ) )
A2ADispatcher:SetBorderZone( CCCPBorderZone )
A2ADispatcher:SetDisengageRadius( 460000 )--important to stop caps drifting 460km is 250nm, and covers coast from Shiraz to a bit east of Abbas
A2ADispatcher:SetEngageRadius(200000) --everything inside 200km from the aircraft is handled by the CAP
A2ADispatcher:SetTacticalDisplay( Redair_Debugging )
A2ADispatcher:SetDefaultCapTimeInterval( 900, 1200 ) --between 15mins and 20mins
A2ADispatcher:SetDefaultFuelThreshold( 0.3 ) -- % including tanks before heading to refuel. Note refuel is on INTERNAL max only for AI.


A2ADispatcher:SetSquadron( CAP_Airfield1,CAP_Airfield1,("Cap_"..CAP_Airfield1))
A2ADispatcher:SetSquadronGrouping(CAP_Airfield1,pickNumber())
A2ADispatcher:SetSquadronTakeoffFromParkingHot( CAP_Airfield1 )
A2ADispatcher:SetSquadronLandingAtEngineShutdown( CAP_Airfield1 )
A2ADispatcher:SetSquadronCap( CAP_Airfield1, ZONE:New( "Cap_"..CAP_Airfield1  ), 5000, 20000, 400, 700, 400, 1000, "BARO") --start disabled
A2ADispatcher:SetSquadronCapInterval( CAP_Airfield1, 1, 900, 1200 ) -- only one CAP ever, between 15mins and 20mins
A2ADispatcher:SetSquadronCapRacetrack(CAP_Airfield1, UTILS.NMToMeters(20), UTILS.NMToMeters(20), 180, 180, nil, nil, {ZONE:New("Cap_"..CAP_Airfield1):GetCoordinate()})
A2ADispatcher:SchedulerCAP(CAP_Airfield1)

local number_of_CAPs = math.random(1,2) --randomly have 1 or 2 airfields launching CAP
if number_of_CAPs == 2 then
  local number_of_CAP_Airfield = math.random(1,#airfield_Cap_table)
  for i,_cap_airfield in ipairs(airfield_Cap_table) do
    if i == number_of_CAP_Airfield then
      CAP_Airfield2 = _cap_airfield
      env.info(CAP_Airfield2.." has second CAP enabled")
      A2ADispatcher:SetSquadron( CAP_Airfield2,CAP_Airfield2, ("Cap_"..CAP_Airfield2))
      A2ADispatcher:SetSquadronGrouping(CAP_Airfield2,pickNumber())
      A2ADispatcher:SetSquadronTakeoffFromParkingHot( CAP_Airfield2 )
      A2ADispatcher:SetSquadronLandingAtEngineShutdown( CAP_Airfield2 )
      A2ADispatcher:SetSquadronCap( CAP_Airfield2, ZONE:New( "Cap_"..CAP_Airfield2  ), 5000, 20000, 400, 700, 400, 1000, "BARO") --start disabled
      A2ADispatcher:SetSquadronCapInterval( CAP_Airfield2, 1, 900, 1200 ) -- only one CAP ever, between 15mins and 20mins
      A2ADispatcher:SetSquadronCapRacetrack(CAP_Airfield2, UTILS.NMToMeters(20), UTILS.NMToMeters(20), 180, 180, nil, nil, {ZONE:New("Cap_"..CAP_Airfield2):GetCoordinate()})
      A2ADispatcher:SchedulerCAP(CAP_Airfield2)
    end
  end
end

--- CAP


--- QRA
for i,_gci_airfield in ipairs(airfield_GCI_table) do
  A2ADispatcher:SetSquadron( _gci_airfield,_gci_airfield,("Cap_".._gci_airfield),2)
  A2ADispatcher:SetSquadronGrouping(_gci_airfield,pickNumber())
  A2ADispatcher:SetSquadronTakeoffFromParkingHot( _gci_airfield )
  A2ADispatcher:SetSquadronLandingAtEngineShutdown( _gci_airfield )
  A2ADispatcher:SetSquadronGci(_gci_airfield,600,1200)
  env.info(_gci_airfield.." has QRF enabled")
end
