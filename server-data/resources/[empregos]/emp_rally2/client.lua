local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")
emP = Tunnel.getInterface("emp_rally2")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local inrace = false
local timerace = 0
local racepoint = 1
local racepos = 0
local CoordenadaX = 385.29
local CoordenadaY = -1657.45
local CoordenadaZ = 27.30
local PlateIndex = nil
local bomba = nil
local explosive = 0
-- 385.29,-1657.45,27.30
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local races = {
	[1] = {
		--['time'] = 275,
		[1] = { ['x'] = -1836.42, ['y'] = 4804.56, ['z'] = 4.2},
		[2] = { ['x'] =-1797.18, ['y'] = 4662.97, ['z'] = 7.61},
		[3] = { ['x'] =-1698.66, ['y'] = 4661.16, ['z'] = 22.56},
		[4] = { ['x'] =-1604.94, ['y'] = 4714.14, ['z'] = 42.5},
		[5] = { ['x'] =-1542.02, ['y'] = 4709.83, ['z'] = 45.07},
		[6] = { ['x'] =-1529.94, ['y'] = 4639.94, ['z'] = 26.78},
		[7] = { ['x'] =-1564.9, ['y'] = 4503.86, ['z'] = 20.49},
		[8] = { ['x'] =-1407.83, ['y'] = 4484.79, ['z'] = 23.02},
		[9] = { ['x'] =-1276.22, ['y'] = 4500.61, ['z'] = 19.51},
		[10] = { ['x'] =-1141.21, ['y'] = 4432.33, ['z'] = 14.39},
		[11] = { ['x'] =-1026.33, ['y'] = 4422.27, ['z'] = 25.46},
		[12] = { ['x'] =-851.2, ['y'] = 4404.41, ['z'] = 20.49},
		[13] = { ['x'] =-728.29, ['y'] = 4410.21, ['z'] = 21.19},
		[14] = { ['x'] =-556.06, ['y'] = 4356.06, ['z'] = 61.87},
		[15] = { ['x'] =-443.54, ['y'] = 4311.53, ['z'] = 60.21},
		[16] = { ['x'] =-286.76, ['y'] = 4224.97, ['z'] = 42.37},
		[17] = { ['x'] =-115.23, ['y'] = 4284.88, ['z'] = 45.02},
		[18] = { ['x'] =-5.47, ['y'] = 4446.72, ['z'] = 58.06},
		[19] = { ['x'] =145.59, ['y'] = 4439.08, ['z'] = 77.99},
		[20] = { ['x'] =5.31, ['y'] = 4525.74, ['z'] = 106.71},
		[21] = { ['x'] =-120.42, ['y'] = 4604.33, ['z'] = 123.42},
		[22] = { ['x'] =-524.13, ['y'] = 4926.5, ['z'] = 150.65},
		[23] = { ['x'] =-569.47, ['y'] = 4871.91, ['z'] = 170.01},
		[24] = { ['x'] =-550.42, ['y'] = 4804.79, ['z'] = 195.63},
		[25] = { ['x'] =-574.9, ['y'] = 4748.29, ['z'] = 213.51},
		[26] = { ['x'] =-425.01, ['y'] = 4732.17, ['z'] = 253.7},
		[27] = { ['x'] =-395.3, ['y'] = 4913.5, ['z'] = 188.37},
		[28] = { ['x'] =-447.94, ['y'] = 4943.0, ['z'] = 163.01},
		[29] = { ['x'] =-534.72, ['y'] = 5036.08, ['z'] = 128.91},
		[30] = { ['x'] =-668.69, ['y'] = 5098.08, ['z'] = 134.86},
		[31] = { ['x'] =-791.48, ['y'] = 5122.0, ['z'] = 142.46},
		[32] = { ['x'] =-941.09, ['y'] = 5153.29, ['z'] = 157.88},
		[33] = { ['x'] =-966.48, ['y'] = 4995.39, ['z'] = 183.47},
		[34] = { ['x'] =-1029.5, ['y'] = 4961.88, ['z'] = 199.93},
		[35] = { ['x'] =-1089.63, ['y'] = 5065.78, ['z'] = 161.03},
		[36] = { ['x'] =-1219.18, ['y'] = 5015.27, ['z'] = 155.79},
		[37] = { ['x'] =-1305.27, ['y'] = 4927.85, ['z'] = 153.93},
		[38] = { ['x'] =-1327.63, ['y'] = 4844.03, ['z'] = 140.39},
		[39] = { ['x'] =-1436.88, ['y'] = 4800.83, ['z'] = 98.27},
		[40] = { ['x'] =-1498.26, ['y'] = 4751.57, ['z'] = 55.81},
		[41] = { ['x'] =-1550.12, ['y'] = 4738.76, ['z'] = 51.52},
		[42] = { ['x'] =-1632.52, ['y'] = 4739.74, ['z'] = 52.62}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not inrace then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 8 and GetPedInVehicleSeat(vehicle,-1) == ped then
					DrawMarker(23,CoordenadaX,CoordenadaY,CoordenadaZ-0.96,0,0,0,0,0,0,10.0,10.0,1.0,255,230,100,50,0,0,0,0)
					if distance <= 5.9 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR O RALLY SLAVIEIRO",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) and emP.checkPermission()	then
							emP.setSearchTimer()
							inrace = true
							racepos = 1
							racepoint = emP.getRacepoint()
							timerace = races[racepoint].time
							PlateIndex = GetVehicleNumberPlateText(vehicle)
							--SetVehicleNumberPlateText(vehicle,"CORREDOR")
							CriandoBlip(races,racepoint,racepos)
							--explosive = math.random(100)
							--[[if explosive >= 70 then
								emP.startBombRace()
								bomba = CreateObject(GetHashKey("prop_c4_final_green"),x,y,z,true,true,true)
								AttachEntityToEntity(bomba,vehicle,GetEntityBoneIndexByName(vehicle,"exhaust"),0.0,0.0,0.0,180.0,-90.0,180.0,false,false,false,true,2,true)
								PlaySoundFrontend(-1,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET",false)
								TriggerEvent("Notify","importante","Você começou uma corrida <b>Explosiva</b>, não saia do veículo e termine no tempo estimado, ou então seu veículo vai explodir com você dentro.",8000)
								end]]
							end
						end
					end
				end
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOINTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if inrace then
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
			local distance = GetDistanceBetweenCoords(races[racepoint][racepos].x,races[racepoint][racepos].y,cdz,x,y,z,true)

			if distance <= 100.0 then
				if IsEntityAVehicle(vehicle) and GetVehicleClass(vehicle) ~= 8 then
					DrawMarker(1,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z-3,0,0,0,0,0,0,12.0,12.0,8.0,255,255,255,25,0,0,0,0)
					DrawMarker(21,races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z+1,0,0,0,0,180.0,130.0,3.0,3.0,2.0,255,0,0,50,1,0,0,1)
					if distance <= 15.1 then
						RemoveBlip(blips)
						if racepos == #races[racepoint] then
							inrace = false
							SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
							PlateIndex = nil
							PlaySoundFrontend(-1,"RACE_PLACED","HUD_AWARDS",false)
							if explosive >= 70 then
								explosive = 0
								DeleteObject(bomba)
								emP.removeBombRace()
								emP.paymentCheck(racepoint,2)
							else
								emP.paymentCheck(racepoint,1)
							end
						else
							racepos = racepos + 1
							CriandoBlip(races,racepoint,racepos)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDRAWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if inrace and timerace > 0 and GetVehiclePedIsUsing(PlayerPedId()) then
			drawTxt("RESTAM ~g~"..timerace.." SEGUNDOS ~w~PARA CHEGAR AO DESTINO FINAL DA CORRIDA",4,0.5,0.905,0.45,255,255,255,100)
			drawTxt("VENÇA A CORRIDA E SUPERE SEUS PROPRIOS RECORDES ANTES DO TEMPO ACABAR",4,0.5,0.93,0.38,255,255,255,50)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERACE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if inrace and timerace > 0 then
			timerace = timerace - 1
			if timerace <= 0 or not IsPedInAnyVehicle(PlayerPedId()) then
				inrace = false
				RemoveBlip(blips)
				SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
				PlateIndex = nil
				if explosive >= 70 then
					SetTimeout(3000,function()
						explosive = 0
						DeleteObject(bomba)
						emP.removeBombRace()
						AddExplosion(GetEntityCoords(GetPlayersLastVehicle()),1,1.0,true,true,true)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEBOMB
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("emp_race:unbomb")
AddEventHandler("emp_race:unbomb",function()
	inrace = false
	SetVehicleNumberPlateText(GetPlayersLastVehicle(),PlateIndex)
	PlateIndex = nil
	RemoveBlip(blips)
	if explosive >= 70 then
		explosive = 0
		DeleteObject(bomba)
		emP.removeBombRace()
		TriggerEvent("Notify","importante","A <b>Bomba</b> foi desarmada com sucesso.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(races,racepoint,racepos)
	blips = AddBlipForCoord(races[racepoint][racepos].x,races[racepoint][racepos].y,races[racepoint][racepos].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Corrida Clandestina")
	EndTextCommandSetBlipName(blips)
end