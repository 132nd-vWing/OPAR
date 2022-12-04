AIRBOSS.MenuF10Root=MENU_MISSION:New("Carrier Control").MenuPath

-- S-3B Recovery Tanker spawning in air.
tanker=RECOVERYTANKER:New("CVN_72_ABRAHAM_LINCOLN", "CVN72_Tanker#IFF:5327FR")
tanker:SetTakeoffAir()
tanker:SetRadio(143.5)
tanker:SetModex(511)
tanker:SetTACAN(64, "T72")
tanker:SetRespawnInAir()



-- Rescue Helo ((needs to be global))
rescuehelo=RESCUEHELO:New("CVN_72_ABRAHAM_LINCOLN", "CVN72_Rescue #IFF:5326FR")
rescuehelo:SetTakeoffAir()
rescuehelo:SetModex(42)
rescuehelo:SetRespawnInAir()


-- Create AIRBOSS object.
Lincoln=AIRBOSS:New("CVN_72_ABRAHAM_LINCOLN")
Lincoln:_InitNimitz() -- configures for Supercarrier
Lincoln:SetLSORadio(309.1)
Lincoln:SetMarshalRadio(309.9)
Lincoln:SetTACAN(72,X,"C72")
Lincoln:SetICLS(12,"C72")
Lincoln:SetMaxMarshalStacks(6)
Lincoln:SetWelcomePlayers(false)
Lincoln:SetDefaultPlayerSkill(AIRBOSS.Difficulty.Hard)
Lincoln:SetPatrolAdInfinitum(true)
Lincoln:SetMaxSectionSize(4)
Lincoln:SetMaxFlightsPerStack(1)
Lincoln:SetRadioRelayLSO("Helo_Relay")
Lincoln:SetRadioRelayMarshal("Tanker_Relay")
Lincoln:SetMPWireCorrection(15)




-- Recovery Cycles
-- start time, stop time, case X , heading offset (for case 3), u-turn, wind over deck
local window3=Lincoln:AddRecoveryWindow( "00:30", "00:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "01:30", "01:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "02:30", "02:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "03:30", "03:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "04:30", "04:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "05:30", "05:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "06:30", "06:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "07:30", "07:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "08:30", "08:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "09:30", "09:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "10:30", "10:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "11:30", "11:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "12:30", "12:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "13:30", "13:59", 1, nil, true, 25)
local window1=Lincoln:AddRecoveryWindow( "14:30", "14:59", 1, nil, true, 25)
local window1=Lincoln:AddRecoveryWindow( "15:30", "15:59", 1, nil, true, 25)
local window1=Lincoln:AddRecoveryWindow( "16:30", "16:59", 1, nil, true, 25)
local window2=Lincoln:AddRecoveryWindow( "17:30", "17:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "18:30", "18:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "19:30", "19:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "20:30", "20:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "21:30", "21:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "22:30", "22:59", 1, nil, true, 25)
local window3=Lincoln:AddRecoveryWindow( "23:30", "23:59", 1, nil, true, 25)

-- Set folder of airboss sound files within miz file.
Lincoln:SetSoundfilesFolder("Airboss Soundfiles/")



-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
Lincoln:Load("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")


Lincoln:SetAutoSave("C:\\Users\\132nd\\Saved Games\\DCS.openbeta_server","132nd_Carrier_Landing_Stats.csv")


Lincoln:SetDespawnOnEngineShutdown()



-- Skipper menu.
--Lincoln:SetMenuRecovery(90,25)


function Lincoln:OnAfterRecoveryStart(From,Event,To,Case,Offset)
tanker:__Start(3)
rescuehelo:__Start(4)
end



function Lincoln:OnAfterRecoveryStop(From,Event,To)
tanker:__Stop(3)
rescuehelo:__Stop(4)
end



-- Start airboss class.
Lincoln:Start()




--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)
  Lincoln:SetRecoveryTanker(tanker)
  --Lincoln:SetRadioRelayLSO(self:GetUnitName())
end



----- Function called when rescue helo is started.
function rescuehelo:OnAfterStart(From,Event,To)
  --Lincoln:SetRadioRelayMarshal(self:GetUnitName())
  --env.info("Marshal Radio Relay set")
end










