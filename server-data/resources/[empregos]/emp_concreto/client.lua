local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_concreto")
vRP = Proxy.getInterface("vRP")
local vehicle = vRP.getNearestVehicle(7)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local processo = false
local segundos = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = 582.35, ['y'] = -2723.48, ['z'] = 7.19 },
		}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PONTOS DE ENTREGA DE CONCRETO
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = -133.94, ['y'] = -1018.66, ['z'] = 27.28 },
	[2] = { ['x'] = 136.95, ['y'] = -373.27, ['z'] = 43.26 },
	[3] = { ['x'] = -1111.61, ['y'] = -967.03, ['z'] = 2.27 },
	[4] = { ['x'] = -1022.86, ['y'] = 647.72, ['z'] = 141.48},
	[5] = { ['x'] = -569.78, ['y'] = 777.22, ['z'] = 186.35},
	[6] = { ['x'] = -388.81, ['y'] = 393.73, ['z'] = 108.32},
	[7] = { ['x'] = -661.15, ['y'] = 402.2, ['z'] = 101.25},
	[8] = { ['x'] = -917.04, ['y'] = 398.35, ['z'] = 79.39},
	[9] = { ['x'] = -936.69, ['y'] = 163.27, ['z'] = 66.09},
	[10] = { ['x'] = 1386.2, ['y'] = -762.17, ['z'] = 66.75},

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not emservico then
			for _,v in pairs(coordenadas) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
				local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)

				if distance <= 10 then
					DrawMarker(21,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
					if distance <= 1.2 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INCIAR A ENTREGA DE CONCRETO ~w~",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 2 then
								destino = 6
							else
								destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Você entrou em serviço.")
						end
					end
				end
			end
		end
	end
end)
--[[-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if emservico then
			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
				if distance <= 50 then
					DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.5,250,100,50,150,1,0,0,1)
					if distance <= 4 then
						--drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,200)
						if GetPedInVehicleSeat(vehicle,-1) == ped then
							if IsControlJustPressed(0,38) then
								if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("mixer"))  then
									RemoveBlip(blip)
									if destino == 10 then
										emP.checkPayment(50)
										FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
										TriggerEvent("progress",300,"Descarregando concreto! Aguarde.")
										destino = destino + 1
									elseif destino == 10 then
										destino = 1
									else
										emP.checkPayment(50)
										FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
										TriggerEvent("progress",300,"Descarregando concreto! Aguarde.")
										destino = destino + 1
									end
									CriandoBlip(entregas,destino)
								end
							end
						end
					end
				end
			end
		end
	end
end)
--]]

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if emservico then
			if IsPedInAnyVehicle(ped) then
				local vehicle = GetVehiclePedIsIn(ped)
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),entregas[destino].x,entregas[destino].y,entregas[destino].z,true)
				if distance <= 50 then
					DrawMarker(21,entregas[destino].x,entregas[destino].y,entregas[destino].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.5,250,100,50,150,1,0,0,1)
					if distance <= 4 then
						--drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,200)
						if GetPedInVehicleSeat(vehicle,-1) == ped then
							if IsControlJustPressed(0,38) then
								TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							processo = true
							segundos = 30
							if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("mixer")) then
								RemoveBlip(blip)
								if destino == 10 then
									emP.checkPayment(50)
									local vehicle = vRP.getNearestVehicle(7)
									if IsEntityAVehicle(vehicle) then
									end
									FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
									TriggerEvent("progress",30000,"Descarregando concreto! Aguarde.")
									destino = 1
								else
									emP.checkPayment(50)
									local vehicle = vRP.getNearestVehicle(7)
									if IsEntityAVehicle(vehicle) then
									end
									FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
									TriggerEvent("progress",30000,"Descarregando concreto! Aguarde.")
									destino = destino + 1
								end
								CriandoBlip(entregas,destino)
							end
							end
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
					if processo == false then
						FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- Freeze Entity
					end
				ClearPedTasks(PlayerPedId())
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if emservico then
			if IsControlJustPressed(0,168) then
				emservico = false
				RemoveBlip(blip)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
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

function CriandoBlip(entregas,destino)
	blip = AddBlipForCoord(entregas[destino].x,entregas[destino].y,entregas[destino].z)
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
end