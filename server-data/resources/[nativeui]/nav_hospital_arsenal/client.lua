local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

emS = Tunnel.getInterface("nav_hospital_arsenal")

local segundos = 0
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
	local vehicle = vRP.getNearestVehicle(7)
	if data == "Taser" and segundos == 0 then
		TriggerServerEvent('nav_hospital_arsenal:Taser', user_id)
		segundos = 0
	elseif data == "Extintor" and segundos == 0 then
		TriggerServerEvent('nav_hospital_arsenal:Extintor', user_id)
		segundos = 0
	elseif data == "Lanterna" and segundos == 0 then
		TriggerServerEvent('nav_hospital_arsenal:Lanterna', user_id)
		segundos = 0
	elseif data == "Limpar" then
		TriggerServerEvent('nav_hospital_arsenal:Limpar', user_id)
		segundos = 0
	elseif data == "Fechar" then
		ToggleActionMenu()
	end
end)


RegisterNetEvent('nav_hospital_arsenal:menu')
AddEventHandler('nav_hospital_arsenal:menu',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
local delegacias = {
	{1, 306.83535766602,-601.71655273438,43.284061431885},       
}

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		for _,func in pairs(delegacias) do
			local i,x,y,z = table.unpack(func)
			local ped = GetPlayerPed(-1)
			local playerPos = GetEntityCoords(ped, true)
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
		    DrawMarker(23,x-0.4,y+0.5,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,34,126,255,50,0,0,0,0) -- FIZ GAMBIARRA PRA FICAR UM BLIP EM CIMA DO OUTRO, AINDA NÃO ACHEI ONDE E O QUE É O BLIP ROXO QUE APARECE.
			if distancia <= 1 then
				if(IsControlJustPressed(1, 38)) and emS.permissao() then
					TriggerEvent('nav_hospital_arsenal:menu')
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
		end
	end
end)
