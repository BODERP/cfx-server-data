local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_pecasdearma")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 91.83
local CoordenadaY = 3756.29
local CoordenadaZ = 40.77
local processo = false
local segundos = 0
--  91.83, 3756.29, 40.77
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = -3173.53, ['y'] = 1090.02, ['z'] = 20.84 }, 
	[2] = { ['x'] = -331.01, ['y'] = 6086.46, ['z'] = 31.46 }, 
	[3] = { ['x'] = 1692.83, ['y'] = 3762.46, ['z'] = 34.71 }, 
	[4] = { ['x'] = 253.99, ['y'] = -52.11, ['z'] = 69.95 }, 
	[5] = { ['x'] = 840.96, ['y'] = -1035.98, ['z'] = 28.2 }, 
	[6] = { ['x'] = -1303.91, ['y'] = -396.23, ['z'] = 36.7 }, 
	[7] = { ['x'] = -1118.25, ['y'] = 2701.21, ['z'] = 18.56 }, 
	[8] = { ['x'] = 2566.49, ['y'] = 292.01, ['z'] = 108.74 }, 
	[9] = { ['x'] = 808.81, ['y'] = -2159.71, ['z'] = 29.62 }, 
	[10] = { ['x'] = 24.24, ['y'] = -1105.48, ['z'] = 29.8 }
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
					drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~INCIAR A COLETA",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) --[[and emP.checkPermission()]] then
						servico = true
						selecionado = math.random(10)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Vá coletar as Peças de Arma.")
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
					drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~COLETAR AS PEÇAS DE ARMAS",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) --[[and emP.checkPermission()]] and not IsPedInAnyVehicle(ped) then
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
									selecionado = math.random(5)
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
	AddTextComponentString("Coletar Peças de Armas")
	EndTextCommandSetBlipName(blips)
end