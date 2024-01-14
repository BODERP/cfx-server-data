local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_mit")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = -659.46
local CoordenadaY = -941.19
local CoordenadaZ = 21.83
--local CoordenadaX = 484.32
--local CoordenadaY = -3110.28
--local CoordenadaZ = 6.34
local processo = false
local segundos = 0

-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 280.49,  ['y'] = -43.2, ['z'] = 71.18  	}, 
	[2] = { ['x'] = 860.61,  ['y'] = -1028.52, ['z'] = 30.01},
	[3] = { ['x'] = -664.91, ['y'] = -953.33, ['z'] = 21.32 },
	[4] = { ['x'] = -330.9,  ['y'] = 6099.74, ['z'] = 31.46 }, 	
	[5] = { ['x'] = -1320.45,['y'] = -389.4, ['z'] = 36.47 	}, 
	[6] = { ['x'] = -1109.91,['y'] = 2686.94, ['z'] = 18.64 }, 
	[7] = { ['x'] = 2575.4,  ['y'] = 312.29, ['z'] = 108.46 }, 
	[8] = { ['x'] = -3183.85,['y'] = 1091.26, ['z'] = 20.85 }, 
	[9] = { ['x'] = -7.66,  ['y'] = -1112.03, ['z'] = 28.58}, 
	[10] = { ['x'] = 821.74, ['y'] = -2141.09, ['z'] = 28.97}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("global:loadJob")
AddEventHandler("global:loadJob",
                function() if emP.checkPermission() then init() end end)

Citizen.CreateThread(function() if emP.checkPermission() then init() end end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO 
-----------------------------------------------------------------------------------------------------------------------------------------
function init()
    local time = 1
    while true do
        Citizen.Wait(time)
        if not servico then
            local ped = PlayerPedId()
            local x,y,z = table.unpack(GetEntityCoords(ped))
            local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
            local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
            if distance <= 3 then
                DrawMarker(32,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
                if distance <= 1.5 then
                    drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~ PEGAR INFORMAÇÕES",4,0.5,0.90,0.50,255,255,255,200)
                    if IsControlJustPressed(0,38) then
                        servico = true 
                        selecionado = math.random(10)
                        CriandoBlip(locs,selecionado)
                        TriggerEvent("Notify","sucesso","Informações adquiridas, colete as pólvoras!")
                    end
                end
            end
        else
        time = 20000
        end
    end
end
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
			if distance <= 50 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
				if distance <= 5 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~COLETAR A POLVORA",4,0.5,0.90,0.50,255,255,255,200)
					--if GetPedInVehicleSeat(vehicle,-1) == ped then
					if IsControlJustPressed(0,38) then
						--and emP.checkPermission() and --[[not]] IsPedInAnyVehicle(ped) and IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("mule")) then
						if IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("mule")) or IsVehicleModel(GetVehiclePedIsUsing(ped),GetHashKey("benson")) then
							if emP.checkPayment() then
							FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- Freeze Entity
							TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 10
							--vRP._playAnim(false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
							--vRP._playAnim(false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
							TriggerEvent("progress",9000,"Coletando Pólvora")
							while true do
								if backentrega == selecionado then
									selecionado = math.random(10)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
			--	end
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
				TriggerEvent("Notify","aviso","Você encerrou a coleta de pólvora.")
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
	AddTextComponentString("Coletar Cápsulas")
	EndTextCommandSetBlipName(blips)
end