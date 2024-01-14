local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped)
		if vehicle then
			if data == "extra01" then
				TriggerServerEvent("tryextras",VehToNet(vehicle),1)
			elseif data == "extra02" then
				TriggerServerEvent("tryextras",VehToNet(vehicle),2)
			elseif data == "extra04" then
				TriggerServerEvent("tryextras",VehToNet(vehicle),4)
			elseif data == "extra11" then
				TriggerServerEvent("tryextras",VehToNet(vehicle),11)
			elseif data == "livery01" then
				SetVehicleLivery(vehicle,0)
			elseif data == "livery02" then
				SetVehicleLivery(vehicle,1)
			elseif data == "livery03" then
				SetVehicleLivery(vehicle,2)
			elseif data == "livery04" then
				SetVehicleLivery(vehicle,3)
			elseif data == "livery05" then
				SetVehicleLivery(vehicle,4)
			elseif data == "fechar" then
				ToggleActionMenu()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('extras')
AddEventHandler('extras',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCEXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncextras")
AddEventHandler("syncextras",function(index,extra)
	Citizen.CreateThread(function()
		if NetworkDoesNetworkIdExist(index) then
			local v = NetToVeh(index)
			if DoesExtraExist(v,extra) then
				local engine = GetVehicleEngineHealth(v)
				local body = GetVehicleBodyHealth(v)
				if IsVehicleExtraTurnedOn(v,extra) then
					SetVehicleExtra(v,extra,true)
				else
					SetVehicleExtra(v,extra,false)
				end
				SetVehicleEngineHealth(v,engine+-4000.-4000)
				SetVehicleBodyHealth(v,body+-4000.-4000)
			end
		end
	end)
end)