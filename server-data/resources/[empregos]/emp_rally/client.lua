local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_rally")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local bonus = 0

local coordenadas = {
	{ ['id'] = 1, ['x'] = -1819.22, ['y'] = 4814.54, ['z'] = 6.0 } 
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregas = {
	[1] = { ['x'] = -1836.42, ['y'] = 4804.56, ['z'] = 6.2},
	[2] = { ['x'] =-1797.18, ['y'] = 4662.97, ['z'] = 9.61},
	[3] = { ['x'] =-1698.66, ['y'] = 4661.16, ['z'] = 24.56},
	[4] = { ['x'] =-1604.94, ['y'] = 4714.14, ['z'] = 44.5},
	[5] = { ['x'] =-1542.02, ['y'] = 4709.83, ['z'] = 47.07},
	[6] = { ['x'] =-1529.94, ['y'] = 4639.94, ['z'] = 28.78},
	[7] = { ['x'] =-1564.9, ['y'] = 4503.86, ['z'] = 22.49},
	[8] = { ['x'] =-1407.83, ['y'] = 4484.79, ['z'] = 25.02},
	[9] = { ['x'] =-1276.22, ['y'] = 4500.61, ['z'] = 21.51},
	[10] = { ['x'] =-1141.21, ['y'] = 4432.33, ['z'] = 16.39},
	[11] = { ['x'] =-1026.33, ['y'] = 4422.27, ['z'] = 27.46},
	[12] = { ['x'] =-851.2, ['y'] = 4404.41, ['z'] = 22.49},
	[13] = { ['x'] =-728.29, ['y'] = 4410.21, ['z'] = 23.19},
	[14] = { ['x'] =-556.06, ['y'] = 4356.06, ['z'] = 63.87},
	[15] = { ['x'] =-443.54, ['y'] = 4311.53, ['z'] = 62.21},
	[16] = { ['x'] =-286.76, ['y'] = 4224.97, ['z'] = 44.37},
	[17] = { ['x'] =-115.23, ['y'] = 4284.88, ['z'] = 47.02},
	[18] = { ['x'] =-5.47, ['y'] = 4446.72, ['z'] = 60.06},
	[19] = { ['x'] =145.59, ['y'] = 4439.08, ['z'] = 79.99},
	[20] = { ['x'] =5.31, ['y'] = 4525.74, ['z'] = 108.71},
	[21] = { ['x'] =-120.42, ['y'] = 4604.33, ['z'] = 125.42},
	[22] = { ['x'] =-524.13, ['y'] = 4926.5, ['z'] = 152.65},
	[23] = { ['x'] =-569.47, ['y'] = 4871.91, ['z'] = 172.01},
	[24] = { ['x'] =-550.42, ['y'] = 4804.79, ['z'] = 197.63},
	[25] = { ['x'] =-574.9, ['y'] = 4748.29, ['z'] = 215.51},
	[26] = { ['x'] =-425.01, ['y'] = 4732.17, ['z'] = 255.7},
	[27] = { ['x'] =-395.3, ['y'] = 4913.5, ['z'] = 190.37},
	[28] = { ['x'] =-447.94, ['y'] = 4943.0, ['z'] = 165.01},
	[29] = { ['x'] =-534.72, ['y'] = 5036.08, ['z'] = 130.91},
	[30] = { ['x'] =-668.69, ['y'] = 5098.08, ['z'] = 136.86},
	[31] = { ['x'] =-791.48, ['y'] = 5122.0, ['z'] = 144.46},
	[32] = { ['x'] =-941.09, ['y'] = 5153.29, ['z'] = 159.88},
	[33] = { ['x'] =-966.48, ['y'] = 4995.39, ['z'] = 185.47},
	[34] = { ['x'] =-1029.5, ['y'] = 4961.88, ['z'] = 201.93},
	[35] = { ['x'] =-1089.63, ['y'] = 5065.78, ['z'] = 163.03},
	[36] = { ['x'] =-1219.18, ['y'] = 5015.27, ['z'] = 157.79},
	[37] = { ['x'] =-1305.27, ['y'] = 4927.85, ['z'] = 155.93},
	[38] = { ['x'] =-1327.63, ['y'] = 4844.03, ['z'] = 142.39},
	[39] = { ['x'] =-1436.88, ['y'] = 4800.83, ['z'] = 100.27},
	[40] = { ['x'] =-1498.26, ['y'] = 4751.57, ['z'] = 57.81},
	[41] = { ['x'] =-1550.12, ['y'] = 4738.76, ['z'] = 53.52},
	[42] = { ['x'] =-1632.52, ['y'] = 4739.74, ['z'] = 54.62},
	[43] = { ['x'] =-1632.52, ['y'] = 4739.74, ['z'] = 54.62}
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
					DrawMarker(36,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,3.5,0.5,3.5,255,230,100,100,0,0,0,1)
					if distance <= 3.0 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR O RALLY  ~r~SLAVIEIRO~w~",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							emservico = true
							if v.id == 1 then
								destino = 1
							--else
							--	destino = 1
							end
							CriandoBlip(entregas,destino)
							TriggerEvent("Notify","sucesso","Começou o Rally!")
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
				if distance <= 100 then
					DrawMarker(1,entregas[destino].x,entregas[destino].y,entregas[destino].z+0.20,0,0,0,0,180.0,130.0,5.0,5.0,3.0,250,250,50,150,1,0,0,1)
					if distance <= 20 then
						--drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,200)
						if GetPedInVehicleSeat(vehicle,-1) == ped then
							if IsControlJustPressed(0,32) then
								--if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("sugoi")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("bus")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("coach")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("airbus")) then
									RemoveBlip(blip)
									if destino == 43 then
										emP.checkPayment(50)
										emservico = false
										RemoveBlip(blip)
										TriggerEvent("Notify","sucesso","Você chegou ao final do Rally, parabéns!")
									else
										emP.checkPayment(50)
										destino = destino + 1
									end
									CriandoBlip(entregas,destino)
								--end
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
				TriggerEvent("Notify","aviso","Você cancelou o Rally!")
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
	AddTextComponentString("Comece o Rally!")
	EndTextCommandSetBlipName(blip)
end
