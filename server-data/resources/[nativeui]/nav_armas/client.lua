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
	if data == "fabricar-arma-pistola" then
		TriggerServerEvent("fabricar-arma","wbody|WEAPON_PISTOL")
		ToggleActionMenu()
	elseif data == "fabricar-arma-mag" then
		TriggerServerEvent("fabricar-arma","wbody|WEAPON_ASSAULTSMG")
		ToggleActionMenu()
	--[[elseif data == "fabricar-arma-escopeta" then
		TriggerServerEvent("fabricar-arma","wbody|WEAPON_SAWNOFFSHOTGUN")
		ToggleActionMenu()]]
	elseif data == "fabricar-arma-ak" then
		TriggerServerEvent("fabricar-arma","wbody|WEAPON_ASSAULTRIFLE")
		ToggleActionMenu()
	elseif data == "fabricar-munic-pistola" then
		TriggerServerEvent("fabricar-munic","wammo|WEAPON_PISTOL")
		ToggleActionMenu()
	elseif data == "fabricar-munic-mag" then
		TriggerServerEvent("fabricar-munic","wammo|WEAPON_ASSAULTSMG")
		ToggleActionMenu()
	--[[elseif data == "fabricar-munic-escopeta" then
		TriggerServerEvent("fabricar-munic","wammo|WEAPON_SAWNOFFSHOTGUN")
		ToggleActionMenu()]]
	elseif data == "fabricar-munic-ak" then
		TriggerServerEvent("fabricar-munic","wammo|WEAPON_ASSAULTRIFLE")
		ToggleActionMenu()
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)

RegisterNetEvent('nav_armas:menu')
AddEventHandler('nav_armas:menu',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local fabricas = {
	--{1, -809.13,190.35,72.48}
	{1, 565.89,-3117.69,18.77}
}

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		for _,func in pairs(fabricas) do
			local i,x,y,z = table.unpack(func)
			local ped = GetPlayerPed(-1)
			local playerPos = GetEntityCoords(ped, true)
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
		    DrawMarker(23,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,34,126,255,50,0,0,0,0)
			if distancia <= 1 then
				if IsControlJustPressed(0, 38) then
					TriggerEvent('nav_armas:menu')
				end
			end
		end
	end
end)