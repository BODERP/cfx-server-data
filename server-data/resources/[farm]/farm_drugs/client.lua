local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_drugs")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local coords = {
	--{x = 179.85, y = 647.31, z = 207.24},
	-- {x = 2167.56, y = -21.68, z = 233.69}, -- ex-helipa
	--{x = 1311.91, y = -278.11, z = 91.87}, --helipa alterado
	{x = 776.75,-299.41,59.96}, -- Campinho
	--{x = 346.86, y = -1865.65, z = 30.84}
}
local locs = {
	[1] = { ['x'] = -952.31, ['y'] = -1077.87, ['z'] = 2.48 }, -- -952.31,-1077.87,2.48
	[2] = { ['x'] = -978.23, ['y'] = -1108.09, ['z'] = 2.16 }, -- -978.23,-1108.09,2.16
	[3] = { ['x'] = -1024.49, ['y'] = -1139.6, ['z'] = 2.75 }, -- -1024.49,-1139.6,2.7
	[4] = { ['x'] = -1063.76, ['y'] = -1159.88, ['z'] = 2.56 }, -- -1063.76,-1159.88,2.56
	[5] = { ['x'] = -1001.68, ['y'] = -1218.78, ['z'] = 5.75 }, -- -1001.68,-1218.78,5.75
	[6] = { ['x'] = -1171.54, ['y'] = -1575.61, ['z'] = 4.51 }, -- -1171.54,-1575.61,4.51
	[7] = { ['x'] = -1097.94, ['y'] = -1673.36, ['z'] = 8.4 }, -- -1097.94,-1673.36,8.4
	[8] = { ['x'] = -1286.17, ['y'] = -1267.12, ['z'] = 4.52 }, -- -1286.17,-1267.12,4.52
	[9] = { ['x'] = -1335.75, ['y'] = -1146.55, ['z'] = 6.74 }, -- -1335.75,-1146.55,6.74
	[10] = { ['x'] = -1750.47, ['y'] = -697.09, ['z'] = 10.18 }, -- -1750.47,-697.09,10.18
	[11] = { ['x'] = -1876.84, ['y'] = -584.39, ['z'] = 11.86 }, -- -1876.84,-584.39,11.86
	[12] = { ['x'] = -1772.23, ['y'] = -378.12, ['z'] = 46.49 }, -- -1772.23,-378.12,46.49
	[13] = { ['x'] = -1821.38, ['y'] = -404.97, ['z'] = 46.65 }, -- -1821.38,-404.97,46.65
	[14] = { ['x'] = -1965.33, ['y'] = -296.96, ['z'] = 41.1 }, -- -1965.33,-296.96,41.1
	[15] = { ['x'] = -1109.1, ['y'] = -1963.76, ['z'] = 13.17 }, -- -1109.1,-1963.76,13.17
	[16] = { ['x'] = -232.73, ['y'] = -1311.32, ['z'] = 31.3 }, -- -232.73,-1311.32,31.3
	[17] = { ['x'] = -1462.47, ['y'] = -381.89, ['z'] = 38.83 }, -- -1462.47,-381.89,38.83
	[18] = { ['x'] = -766.66, ['y'] = -23.6, ['z'] = 41.09 }, -- -766.66,-23.6,41.09
	[19] = { ['x'] = 1230.8, ['y'] = -1590.97, ['z'] = 53.77 }, -- 1230.8,-1590.97,53.77
	[20] = { ['x'] = 1286.53, ['y'] = -1604.26, ['z'] = 54.83 }, -- 1286.53,-1604.26,54.83
	[21] = { ['x'] = 1379.38, ['y'] = -1515.23, ['z'] = 58.24 }, -- 1379.38,-1515.23,58.24
	[22] = { ['x'] = -1094.23, ['y'] = -508.25, ['z'] = 35.77 }, -- -1094.23,-508.25,35.77
	[23] = { ['x'] = 1437.37, ['y'] = -1492.53, ['z'] = 63.63 }, -- 1437.37,-1492.53,63.63
	[24] = { ['x'] = 450.04, ['y'] = -1863.49, ['z'] = 27.77 }, -- 450.04,-1863.49,27.77
	[25] = { ['x'] = 403.75, ['y'] = -1929.72, ['z'] = 24.75 }, -- 403.75,-1929.72,24.75
	[26] = { ['x'] = 430.16, ['y'] = -1559.31, ['z'] = 32.8 }, -- 430.16,-1559.31,32.8
	[27] = { ['x'] = 446.06, ['y'] = -1242.17, ['z'] = 30.29 }, -- 446.06,-1242.17,30.29
	[28] = { ['x'] = 322.39, ['y'] = -1284.7, ['z'] = 30.57 }, -- 322.39,-1284.7,30.57
	[29] = { ['x'] = 896.22, ['y'] = -144.46, ['z'] = 76.81 }, -- 896.22,-144.46,76.81
	[30] = { ['x'] = 474.27, ['y'] = -635.05, ['z'] = 25.65 }, -- 474.27,-635.05,25.65
	[31] = { ['x'] = 319.69, ['y'] = -559.85, ['z'] = 28.75 }, -- 319.69,-559.85,28.75
	[32] = { ['x'] = 154.68, ['y'] = -1335.62, ['z'] = 29.21 }, -- 154.68,-1335.62,29.21
	[33] = { ['x'] = 215.54, ['y'] = -1461.67, ['z'] = 29.19 }, -- 215.54,-1461.67,29.19
	[34] = { ['x'] = 167.46, ['y'] = -1709.3, ['z'] = 29.3 }, -- 167.46,-1709.3,29.3
	[35] = { ['x'] = -445.29, ['y'] = 288.99, ['z'] = 83.23 }, -- -445.29,288.99,83.23
	[36] = { ['x'] = -179.56, ['y'] = 314.25, ['z'] = 97.88 }, -- -179.56,314.25,97.88
	[37] = { ['x'] = -16.07, ['y'] = 216.7, ['z'] = 106.75 }, -- -16.07,216.7,106.75
	[38] = { ['x'] = 164.02, ['y'] = 151.87, ['z'] = 105.18 }, -- 164.02,151.87,105.18
	[39] = { ['x'] = 840.2, ['y'] = -181.93, ['z'] = 74.19 }, -- 840.2,-181.93,74.19
	[40] = { ['x'] = 952.27, ['y'] = -252.17, ['z'] = 67.77 }, -- 952.27,-252.17,67.77
	[41] = { ['x'] = 1105.27, ['y'] = -778.84, ['z'] = 58.27 }, -- 1105.27,-778.84,58.27
	[42] = { ['x'] = 1099.59, ['y'] = -345.68, ['z'] = 67.19 }, -- 1099.59,-345.68,67.19
	[43] = { ['x'] = -1211.12, ['y'] = -401.56, ['z'] = 38.1 }, -- -1211.12,-401.56,38.1
	[44] = { ['x'] = -1302.69, ['y'] = -271.32, ['z'] = 40.0 }, -- -1302.69,-271.32,40.0
	[45] = { ['x'] = -1468.65, ['y'] = -197.3, ['z'] = 48.84 }, -- -1468.65,-197.3,48.84
	[46] = { ['x'] = -1583.18, ['y'] = -265.78, ['z'] = 48.28 }, -- -1583.18,-265.78,48.28
	[47] = { ['x'] = -603.96, ['y'] = -774.54, ['z'] = 25.02 }, -- -603.96,-774.54,25.02
	[48] = { ['x'] = -805.14, ['y'] = -959.54, ['z'] = 18.13 }, -- -805.14,-959.54,18.13
	[49] = { ['x'] = -325.07, ['y'] = -1356.35, ['z'] = 31.3 }, -- -325.07,-1356.35,31.3
	[50] = { ['x'] = -321.94, ['y'] = -1545.74, ['z'] = 31.02 }, -- -321.94,-1545.74,31.02
	[51] = { ['x'] = -428.95, ['y'] = -1728.13, ['z'] = 19.79 }, -- -428.95,-1728.13,19.79
	[52] = { ['x'] = -582.38, ['y'] = -1743.65, ['z'] = 22.44 }, -- -582.38,-1743.65,22.44
	[53] = { ['x'] = -670.43, ['y'] = -889.09, ['z'] = 24.5 } -- -670.43,-889.09,24.5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(coords) do
				local distance = GetDistanceBetweenCoords(v.x,v.y,v.z,x,y,z,true)
				if distance <= 3 then
					DrawMarker(21,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,50,0,0,0,1)
					if distance <= 1.2 then
						drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INICIAR A ROTA DE ENTREGAS",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,38) then
							servico = true
							selecionado = math.random(53)
							CriandoBlip(locs,selecionado)
							TriggerEvent("Notify","sucesso","Entregue as Drogas nos locais marcados no seu GPS!")
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,50,0,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ENTREGAR AS DROGAS",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						TriggerServerEvent('payment:drugs')
						droga = CreateObject(GetHashKey("prop_meth_bag_01"),locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-1,true,true,true)

						local random = math.random(100)
						if random >= 80 then
							emP.MarcarOcorrencia()
						end

						TriggerEvent('cancelando',true)
						RemoveBlip(blips)
						backentrega = selecionado
						processo = true
						segundos = 5

						vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
						vRP._CarregarObjeto("pickup_object","pickup_low","hei_prop_heist_cash_pile",49,28422)

						SetTimeout(9000,function()
							DeleteObject(droga)
						end)

						while true do
							if backentrega == selecionado then
								selecionado = math.random(53)
							else
								break
							end
							Citizen.Wait(1)
						end
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você cancelou sua rota de entregas!")
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
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
			end
		end
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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar Metanfetamina")
	EndTextCommandSetBlipName(blips)
end