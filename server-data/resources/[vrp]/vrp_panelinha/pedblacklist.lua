-- CONFIG --

-- Blacklisted ped models
pedblacklist = {
	"S_M_M_MovAlien_01",
	"Lost01GFY",
	"Lost01GMY",
	"Lost02GMY",
	"Lost03GMY",
	"S_M_M_MovSpace_01",
	"U_M_Y_RSRanger_01",
	"U_M_Y_Zombie_01",
    "CSB_Cop",
	"s_m_m_prisguard_01",
    "S_M_Y_HwayCop_01",
    "S_M_Y_HwayCop_01_p",
    "S_M_Y_Cop_01",
    "S_M_Y_Cop_01_p",
    "S_M_M_SnowCop_01",
    "S_M_M_SnowCop_01_p",
    "S_M_O_Snowcop_01",
    "S_M_M_Paramedic_01",
    "S_M_M_Paramedic_01_p",
    "S_F_Y_Cop_01",
    "S_F_Y_Cop_01_p",
    "MP_M_Cop_01",
	"MP_F_Cop_01", 
	"S_F_Y_Sheriff_01_p",
	"S_F_Y_Sheriff_01",
	"CSB_BallasOG", 
    "MP_S_ARMOURED_01",
	"S_F_Y_Cop_01",
	"S_F_Y_Cop_02",
	"S_F_Y_Cop_03",
	"S_M_Y_Cop_01", 
	"S_M_Y_Cop_02", 
	"S_M_Y_Cop_03", 
	"S_F_Y_Sheriff_02", 
	"S_F_Y_Sheriff_03", 
	"S_M_Y_Marine_01", 
	"S_M_Y_Marine_02", 
	"S_M_Y_Marine_03", 
	"S_M_SECURITY_01", 
	"S_M_SECURITY_02 ", 
	"S_M_SECURITY_03 ", 
	"S_M_Y_ARMYMECH_01", 
	"S_M_Y_ARMYMECH_02", 
	"S_M_Y_ARMYMECH_03", 
	"S_M_Y_BLACKOPS_01",
	"S_M_Y_BLACKOPS_02",
	"S_M_Y_BLACKOPS_03",
	"IG_BallasOG",
	"G_F_Y_ballas_01",
	"G_M_Y_BallaEast_01",
	"G_M_Y_BallaOrig_01",
}
pedblacklistHash = {
	3139074,
	-681004504,
	1581098148,
	-1865950624,
	-1286380898,
	1456041926,
	-183807561,
	2047212121,
	-347613984,
	1456041926,
}

-- Defaults to this ped model if an error happened
defaultpedmodel = "a_m_y_skater_01"

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			playerModel = GetEntityModel(playerPed)

			if not prevPlayerModel then
				if isPedBlacklisted(prevPlayerModel) and isPedBlacklisted2(prevPlayerModel) then
					SetPlayerModel(PlayerId(), GetHashKey(defaultpedmodel))
				else
					prevPlayerModel = playerModel
				end
			else
				if isPedBlacklisted(playerModel) and isPedBlacklisted2(prevPlayerModel) then
					SetPlayerModel(PlayerId(), prevPlayerModel)
					--sendForbiddenMessage("This ped model is blacklisted!")
				end

				prevPlayerModel = playerModel
			end
		end
	end
end)

function isPedBlacklisted2(model)
	for _, blacklistedPed in pairs(pedblacklistHash) do
		if model == blacklistedPed then
			return true
		end
	end

	return false
end

function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(pedblacklist) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end

	return false
end