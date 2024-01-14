local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_contrabando")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 698.76
local CoordenadaY = -977.94
local CoordenadaZ = 24.11
local processo = false
local segundos = 0
--161.12, ['y'] = -1002.63, ['z'] = 29.36
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS DE COLETA
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 165.07, ['y'] = -1013.09, ['z'] = 29.39 }, 
	[2] = { ['x'] = 158.72, ['y'] = -1023.89, ['z'] = 29.39 }, 
	[3] = { ['x'] = 143.97, ['y'] = -1017.64, ['z'] = 29.41 }, 
	[4] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[5] = { ['x'] = 349.39, ['y'] = -1099.02, ['z'] = 29.42 }, -- 349.39,-1099.02,29.42
	[6] = { ['x'] = 296.36, ['y'] = -994.43, ['z'] = 29.3 }, -- 296.36,-994.43,29.3
	[7] = { ['x'] = 350.75, ['y'] = -1247.94, ['z'] = 32.51 },-- 350.75,-1247.94,32.51
	[8] = { ['x'] = 420.0, ['y'] = -2063.79, ['z'] = 22.13 }, -- 420.0,-2063.79,22.13
	[9] = { ['x'] = 511.44, ['y'] = -1951.07, ['z'] = 24.99 }, -- 511.44,-1951.07,24.99
	[10] = { ['x'] = 1059.63, ['y'] = -2407.56, ['z'] = 29.97 }, -- 1059.63,-2407.56,29.97
	[11] = { ['x'] = 1075.67, ['y'] = -2330.4, ['z'] = 30.3 }, -- 1075.67,-2330.4,30.3
	[12] = { ['x'] = 1002.99, ['y'] = -2158.77, ['z'] = 30.56 }, -- 1002.99,-2158.77,30.56
	[13] = { ['x'] = 830.67, ['y'] = -2171.97, ['z'] = 30.28 }, -- 830.67,-2171.97,30.28
	[14] = { ['x'] = 820.02, ['y'] = -2349.09, ['z'] = 30.34 }, -- 820.02,-2349.09,30.34
	[15] = { ['x'] = 702.25, ['y'] = -2194.9, ['z'] = 29.34 },-- 702.25,-2194.9,29.34
	[16] = { ['x'] = 485.03, ['y'] = -1528.72, ['z'] = 29.31 }, -- 485.03,-1528.72,29.31
	[17] = { ['x'] = 457.09, ['y'] = -1498.24, ['z'] = 28.19 }, -- 457.09,-1498.24,28.19
	[18] = { ['x'] = 487.06, ['y'] = -1295.48, ['z'] = 29.54 }, -- 487.06,-1295.48,29.54
	[19] = { ['x'] = 706.99, ['y'] = -1142.66, ['z'] = 23.52 }, -- 706.99,-1142.66,23.52
	[20] = { ['x'] = 845.08, ['y'] = -1059.37, ['z'] = 28.32 }, -- 845.08,-1059.37,28.32
	[21] = { ['x'] = 889.73, ['y'] = -1046.27, ['z'] = 35.18 }, -- 889.73,-1046.27,35.18
	[22] = { ['x'] = 1129.7, ['y'] = -989.29, ['z'] = 45.97 }, -- 1129.7,-989.29,45.97
	[23] = { ['x'] = -449.94, ['y'] = -52.15, ['z'] = 44.52 }, -- -449.94,-52.15,44.52
	[24] = { ['x'] = 1082.6, ['y'] = -788.38, ['z'] = 58.27 }, -- 1082.6,-788.38,58.27
	[25] = { ['x'] = 580.97, ['y'] = 138.59, ['z'] = 99.48 }, -- 580.97, 138.59,99.48
	[26] = { ['x'] = -1162.08, ['y'] = -1567.11, ['z'] = 4.4 }, -- -1162.08,-1567.11,4.4
	[27] = { ['x'] = -1467.37, ['y'] = -387.78, ['z'] = 38.75 }, -- -1467.37,-387.78,38.75
	[28] = { ['x'] = -674.92, ['y'] = -881.12, ['z'] = 24.49 }, -- -674.92,-881.12,24.49
	[29] = { ['x'] = -683.81, ['y'] = -1170.78, ['z'] = 10.62 }, -- -683.81,-1170.78,10.62
	[30] = { ['x'] = -689.63, ['y'] = -912.66, ['z'] = 23.68 }, -- -689.63,-912.66,23.68
	[31] = { ['x'] = -560.17, ['y'] = -872.83, ['z'] = 27.05 }, -- -560.17,-872.83,27.05
	[32] = { ['x'] = -1291.71, ['y'] = -280.1, ['z'] = 38.69 }, -- -1291.71,-280.1,38.69
	[33] = { ['x'] = 105.48, ['y'] = 151.16, ['z'] = 104.75 }, -- 105.48,151.16,104.75
	[34] = { ['x'] = -1235.51, ['y'] = -1191.81, ['z'] = 7.68 }, -- -1235.51,-1191.81,7.68
	[35] = { ['x'] = -1171.16, ['y'] = -1380.71, ['z'] = 4.97 } -- -1171.16,-1380.71,4.97
	--[[[36] = { ['x'] = -1809.56, ['y'] = -123.47, ['z'] = 78.79 }, -- -1809.56,-123.47,78.79 -- no
	[37] = { ['x'] = -1762.83, ['y'] = -262.19, ['z'] = 48.27 }, -- -1762.83,-262.19,48.27 -- no
	[38] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[39] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[40] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[41] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[42] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[43] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[44] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[45] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[46] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[47] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[48] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[49] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 },
	[50] = { ['x'] = 135.77, ['y'] = -1005.9, ['z'] = 29.41 }
	--[5] = { ['x'] = 840.96, ['y'] = -1035.98, ['z'] = 28.2 }, 
	--[6] = { ['x'] = -1303.91, ['y'] = -396.23, ['z'] = 36.7 }, 
	--[7] = { ['x'] = -1118.25, ['y'] = 2701.21, ['z'] = 18.56 }, 
	--[8] = { ['x'] = 2566.49, ['y'] = 292.01, ['z'] = 108.74 }, 
	--[9] = { ['x'] = 808.81, ['y'] = -2159.71, ['z'] = 29.62 }, 
	--[10] = { ['x'] = 24.24, ['y'] = -1105.48, ['z'] = 29.8 }]]
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
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
			
			if distance <= 3 then
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 1.5 then
					drawTxt("PRESSIONE ~r~E~w~ PARA ~y~INCIAR A COLETA",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) --[[and emP.checkPermission()]] then
						servico = true
						selecionado = math.random(35)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Vá em busca de materiais!")
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
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~COLETAR AS PEÇAS",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) --[[and emP.checkPermission()]] --[[and not IsPedInAnyVehicle(ped)]] then
						if emP.checkPayment() then
							TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 10
							vRP._playAnim(false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
							--vRP._playAnim(false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
							TriggerEvent("progress",9000,"Coletando Peças")
							while true do
								if backentrega == selecionado then
									selecionado = math.random(4)
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
				TriggerEvent("Notify","aviso","Você desligou as rotas de coleta!")
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
	AddTextComponentString("Coletar as peças")
	EndTextCommandSetBlipName(blips)
end