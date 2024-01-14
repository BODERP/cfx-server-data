-----------------------------------------------------------------------------------------------------------------------------------------
-- NPC CONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
trafficDensity = 0
pedDensity = 0
Citizen.CreateThread(function()
	while true do
	    SetVehicleDensityMultiplierThisFrame(trafficDensity)
	    SetPedDensityMultiplierThisFrame(pedDensity)
	    SetRandomVehicleDensityMultiplierThisFrame(trafficDensity)
		--SetParkedVehicleDensityMultiplierThisFrame(trafficDensity)
		--SetSomeVehicleDensityMultiplierThisFrame(0.0)
		SetParkedVehicleDensityMultiplierThisFrame(0.05)
	    SetScenarioPedDensityMultiplierThisFrame(pedDensity, pedDensity)
	Citizen.Wait(0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
----- Trem do GTA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  SwitchTrainTrack(0, true)
  SwitchTrainTrack(3, true)
  N_0x21973bbf8d17edfa(0, 120000)
  SetRandomTrains(true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR A CORONHADA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedArmed(ped,6) then
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER ARMA ABAIXO DE 60KMH DENTRO DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(1000)
--		local ped = PlayerPedId()
--		if IsPedInAnyVehicle(ped) then
--			local vehicle = GetVehiclePedIsIn(PlayerPedId())
--			if GetPedInVehicleSeat(vehicle,-1) == ped then
--				--local speed = GetEntitySpeed(vehicle)*2.236936
--				local speed = GetEntitySpeed(vehicle)*3.605936
--				if speed >= 60 then
--					SetPlayerCanDoDriveBy(PlayerId(),false)
--				else
--					SetPlayerCanDoDriveBy(PlayerId(),true)
--				end
--			end
--		end
--	end
--end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVA O CONTROLE DO CARRO ENQUANTO ESTIVER NO AR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and not IsThisModelABicycle(model) and not IsThisModelABike(model) and not IsThisModelAQuadbike(model) and IsEntityInAir(veh) then
                DisableControlAction(0,59)
                DisableControlAction(0,60)
                --DisableControlAction(0,73)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
	--STATUS DO DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
        SetDiscordAppId(862419134734139423)
		SetDiscordRichPresenceAsset('logogoatrp')
		SetDiscordRichPresenceAsset('logogoatrpdiscord')
		SetDiscordRichPresenceAssetSmall('logogoatrpdiscord')
		SetDiscordRichPresenceAssetText('GOAT RP!')
		SetRichPresence("discord.gg/Ds44CmCeVx")
	   --SetRichPresence("Jogadores conectados: "..players.." de 256")
	   SetRichPresence("")
		Citizen.Wait(8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	--{ ['x'] = 265.64, ['y'] = -1261.30, ['z'] = 29.29, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 819.65, ['y'] = -1028.84, ['z'] = 26.40, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 1208.95, ['y'] = -1402.56, ['z'] = 35.22, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 1181.38, ['y'] = -330.84, ['z'] = 69.31, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 620.84, ['y'] = 269.10, ['z'] = 103.08, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 2581.32, ['y'] = 362.03, ['z'] = 108.46, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 176.63, ['y'] = -1562.02, ['z'] = 29.26, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 176.63, ['y'] = -1562.02, ['z'] = 29.26, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -319.29, ['y'] = -1471.71, ['z'] = 30.54, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 1784.32, ['y'] = 3330.55, ['z'] = 41.25, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 49.418, ['y'] = 2778.79, ['z'] = 58.04, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 263.89, ['y'] = 2606.46, ['z'] = 44.98, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 1039.95, ['y'] = 2671.13, ['z'] = 39.55, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 1207.26, ['y'] = 2660.17, ['z'] = 37.89, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	--{ ['x'] = 2539.68, ['y'] = 2594.19, ['z'] = 37.94, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 2679.85, ['y'] = 3263.94, ['z'] = 55.24, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 2005.05, ['y'] = 3773.88, ['z'] = 32.40, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 1687.15, ['y'] = 4929.39, ['z'] = 42.07, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 1701.31, ['y'] = 6416.02, ['z'] = 32.76, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = 179.85, ['y'] = 6602.83, ['z'] = 31.86, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -94.46, ['y'] = 6419.59, ['z'] = 31.48, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -2554.99, ['y'] = 2334.40, ['z'] = 33.07, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -1800.37, ['y'] = 803.66, ['z'] = 138.65, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -1437.62, ['y'] = -276.74, ['z'] = 46.20, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -2096.24, ['y'] = -320.28, ['z'] = 13.16, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -724.61, ['y'] = -935.16, ['z'] = 19.21, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -526.01, ['y'] = -1211.00, ['z'] = 18.18, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -70.21, ['y'] = -1761.79, ['z'] = 29.53, ['sprite'] = 361, ['color'] = 41, ['nome'] = "Posto de Gasolina", ['scale'] = 0.4 },
	{ ['x'] = -205.52, ['y'] = -1308.53, ['z'] = 31.22, ['sprite'] = 402, ['color'] = 4, ['nome'] = "Mecânica", ['scale'] = 0.6 },
	{ ['x'] = 723.53, ['y'] = -1086.98, ['z'] = 23.22, ['sprite'] = 402, ['color'] = 4, ['nome'] = "Tuning", ['scale'] = 0.6 },
	----------------------------------------------------------------------------------------------------------------------------------------
	-- Blips da Versão BR ------------------------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------------------------------------------
}

Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v.x,v.y,v.z)
		SetBlipSprite(blip,v.sprite)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v.color)
		SetBlipScale(blip,v.scale)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.nome)
		EndTextCommandSetBlipName(blip)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASERTIME
-----------------------------------------------------------------------------------------------------------------------------------------
local tasertime = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			SetTimeout(5000,function()
				SetTimecycleModifier("hud_def_desat_Trevor")
				SetTimeout(10000,function()
					SetTimecycleModifier("")
					SetTransitionTimecycleModifier("")
					StopGameplayCamShaking()
				end)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST WEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons = {
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_SMG_MK2",
	--"WEAPON_MACHINEPISTOL",
	"WEAPON_MINISMG",
	"WEAPON_RAYCARBINE",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE_MK2",
	--"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	--"WEAPON_COMPACTRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	--"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	--"WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	--"WEAPON_SNOWBALL",
	"WEAPON_BALL",
	"WEAPON_SMOKEGRENADE"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in ipairs(blackWeapons) do
			if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(v) then
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
				TriggerServerEvent("adminLogs:Armamentos", v)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVA O ROUBO DO VEÍCULO SEGURANDO F [ CAR JACKING ]
-----------------------------------------------------------------------------------------------------------------------------------------
--[[Citizen.CreateThread(function()
    while true do
    Citizen.Wait(5)
    local ped = PlayerPedId()
    if IsPedJacking(ped) then
      local veh = GetVehiclePedIsIn(ped)
      SetPedIntoVehicle(ped, veh, 0)
      ClearPedTasks(ped)
        end
    end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOME NO MAPA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	--AddTextEntry('FE_THDR_GTAO', 'PANELINHA ROLEPLAY') 
	AddTextEntry('FE_THDR_GTAO', '~r~~h~GOAT RP ~m~| ~b~ https://discord.gg/Ds44CmCeVx  ~m~')
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKOUT
-----------------------------------------------------------------------------------------------------------------------------------------
--[[local isBlackout = false
local oldSpeed = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local vehicle = GetVehiclePedIsIn(PlayerPedId())
		if IsEntityAVehicle(vehicle) and GetPedInVehicleSeat(vehicle,-1) == PlayerPedId() then
			local currentSpeed = GetEntitySpeed(vehicle)*2.236936
			if currentSpeed ~= oldSpeed then
				if not isBlackout and (currentSpeed < oldSpeed) and ((oldSpeed - currentSpeed) >= 50) then
					blackout()
				end
				oldSpeed = currentSpeed
			end
		else
			if oldSpeed ~= 0 then
				oldSpeed = 0
			end
		end

		if isBlackout then
			DisableControlAction(0,63,true)
			DisableControlAction(0,64,true)
			DisableControlAction(0,71,true)
			DisableControlAction(0,72,true)
			DisableControlAction(0,75,true)
		end
	end
end)

function blackout()
	TriggerEvent("vrp_sound:source",'heartbeat',0.5)
	if not isBlackout then
		isBlackout = true
		--sSetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())-200)
		Citizen.CreateThread(function()
			DoScreenFadeOut(500)
			while not IsScreenFadedOut() do
				Citizen.Wait(10)
			end
			Citizen.Wait(5000)
			DoScreenFadeIn(5000)
			isBlackout = false
		end)
	end
end]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- DAMAGE WALK MODE
-----------------------------------------------------------------------------------------------------------------------------------------
local hurt = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if not IsEntityInWater(ped) then
			if GetEntityHealth(ped) <= 199 then
			elseif hurt and GetEntityHealth(ped) > 200 then
			end
		end
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------
-- VOIP CIRCLE
---------------------------------------------------------------------------------------------------------------------------------------
--[[local playerNamesDist = 3
local key_holding = false
Citizen.CreateThread(function()
    while true do
        for id = 0, 255 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
				local takeaway = 0.95
                if ((distance < playerNamesDist) and IsEntityVisible(GetPlayerPed(id))) ~= PlayerPedId() then
					if NetworkIsPlayerTalking(id) then
						DrawMarker(25, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 10.3, 8, 102, 135, 13, 0, 0, 2, 0, 0, 0, 0)
                    end
                    if NetworkIsPlayerTalking(PlayerId()) then
						key_holding = true
						DrawMarker(25, x1,y1,z1 - takeaway, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 10.3, 8, 102, 135, 13, 0, 0, 2, 0, 0, 0, 0)
                    end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)  --0
        DisablePlayerVehicleRewards(PlayerId())
    end
end)]]