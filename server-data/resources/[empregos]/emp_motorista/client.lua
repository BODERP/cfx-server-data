local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_motorista")
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
	{ ['id'] = 1, ['x'] = 454.62, ['y'] = -603.68, ['z'] = 28.56 } 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
[1] = { ['x'] = 395.06, ['y'] = -988.9, ['z'] = 28.84 }, -- Ponto DP (ida)
[2] = { ['x'] = 159.39, ['y'] = -1011.11, ['z'] = 28.97 }, -- Ponto Praça 1 (ida)
[3] = { ['x'] = -46.53, ['y'] = -1129.41, ['z'] = 25.58 }, -- Ponto Concessionária
[4] = { ['x'] = -209.15, ['y'] = -1410.8, ['z'] = 30.77 }, -- Ponto Benny's
[5] = { ['x'] = -393.79, ['y'] = -1698.17, ['z'] = 18.3 }, -- Ponto Reciclagem 1 (ida)
[6] = { ['x'] = -145.57, ['y'] = -2046.12, ['z'] = 22.54 }, -- Ponto Estádio
[7] = { ['x'] = -989.07, ['y'] = -2734.83, ['z'] = 13.4 }, -- Ponto Aeroporto
[8] = { ['x'] = -756.19, ['y'] = -2448.41, ['z'] = 13.95 }, -- Ponto Aeroporto (Galpões)
[9] = { ['x'] = -784.6, ['y'] = -2318.47, ['z'] = 14.2 }, -- Ponto Aeroporto (Prédios)
[10] = { ['x'] = -1090.1, ['y'] = -1991.39, ['z'] = 12.62 }, -- Ponto Desmanche
[11] = { ['x'] = -680.17, ['y'] = -1669.48, ['z'] = 24.63 }, -- Ponto Reciclagem 2 (volta)
[12] = { ['x'] = -587.7, ['y'] = -1823.91, ['z'] = 22.78 }, -- Aleatório
[13] = { ['x'] = -45.71, ['y'] = -1650.8, ['z'] = 28.78 }, -- Ponto Grove
[14] = { ['x'] = -139.27, ['y'] = -1495.28, ['z'] = 33.37 }, -- Ponto Prédios
[15] = { ['x'] = -60.27, ['y'] = -1377.01, ['z'] = 28.82 }, -- Ponto Lavacar
[16] = { ['x'] = 82.43, ['y'] = -1302.48, ['z'] = 28.76 }, -- Ponto Vanilla
[17] = { ['x'] = 177.33, ['y'] = -1037.43, ['z'] = 28.79 }, -- Ponto Praça 2 (volta)
[18] = { ['x'] = 355.93, ['y'] = -1064.45, ['z'] = 28.98 }, -- Ponto DP (volta)
[19] = { ['x'] = 794.54, ['y'] = -955.53, ['z'] = 25.39 }, -- Ponto Alfaiataria
[20] = { ['x'] = 786.11, ['y'] = -776.37, ['z'] = 25.9 }, -- Aleatório
[21] = { ['x'] = 799.39, ['y'] = -345.46, ['z'] = 51.49 }, -- Ponto Favela do Campinho
[22] = { ['x'] = 920.48, ['y'] = -201.67, ['z'] = 72.0 }, -- Ponto Central dos Taxistas
[23] = { ['x'] = 847.95, ['y'] = -78.77, ['z'] = 80.04 }, -- Ponto do Cassino
[24] = { ['x'] = 600.17, ['y'] = -59.62, ['z'] = 73.38 }, -- Aleatório
[25] = { ['x'] = 482.4, ['y'] = -283.42, ['z'] = 46.73 }, -- Aleatório
[26] = { ['x'] = 246.22, ['y'] = -586.28, ['z'] = 42.61 }, -- Ponto do Hospital
[27] = { ['x'] = 224.75, ['y'] = -854.05, ['z'] = 29.58 } -- Ponto da Praça (final)
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
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA  ~r~URBANA~w~",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 1 then
								destino = 1
							--else
							--	destino = 1
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
-----------------------------------------------------------------------------------------------------------------------------------------
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
								TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							processo = true
							segundos = 3
							if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("bus")) then
								RemoveBlip(blip)
								if destino == 27 then
									emP.checkPayment(50)
									local vehicle = vRP.getNearestVehicle(7)
									if IsEntityAVehicle(vehicle) then
									TriggerServerEvent("trydoors",VehToNet(vehicle))
									end
									FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
									TriggerEvent("progress",3000,"Embarcando e desembarcando passageiros")
									destino = 1
								else
									emP.checkPayment(50)
									local vehicle = vRP.getNearestVehicle(7)
									if IsEntityAVehicle(vehicle) then
									TriggerServerEvent("trydoors",VehToNet(vehicle))
									end
									FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
									TriggerEvent("progress",3000,"Embarcando e desembarcando passageiros")
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
						TriggerServerEvent("trydoors",VehToNet(vehicle))
					end
				ClearPedTasks(PlayerPedId())
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