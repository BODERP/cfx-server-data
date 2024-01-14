local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

emS = Tunnel.getInterface("nav_policia_arsenal")

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
	if data == "glock" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:glock', user_id)
		segundos = 0
	elseif data == "Taser" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Taser', user_id)
		segundos = 0
	elseif data == "Extintor" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Extintor', user_id)
		segundos = 0
	elseif data == "Colete" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Colete', user_id)
		segundos = 0
	elseif data == "Cacetete" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Cacetete', user_id)
		segundos = 0
	elseif data == "Lanterna" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Lanterna', user_id)
		segundos = 0
	elseif data == "SigSauer" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:SigSauer', user_id)
		segundos = 0
	elseif data == "Parafal" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:Parafal', user_id)
		segundos = 0
	elseif data == "M16" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:M16', user_id)
		segundos = 0
	elseif data == "APPistol" and segundos == 0 then
		TriggerServerEvent('nav_policia_arsenal:APPistol', user_id)
		segundos = 0
	elseif data == "Limpar" then
		TriggerServerEvent('nav_policia_arsenal:Limpar', user_id)
		segundos = 0
	elseif data == "Fechar" then
		ToggleActionMenu()
	end
end)


RegisterNetEvent('nav_policia_arsenal:menu')
AddEventHandler('nav_policia_arsenal:menu',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
local delegacias = {
	{1, 451.79,-980.24,30.68},         -- ANTIGA DELEGACIA
	{2, -1098.80,-826.01,14.28},       -- NOVA DELEGACIA
	{3, 825.66,163.92,86.39},        -- SHERIFF
	--{4, -2355.0549316406,3254.1306152344,32.810722351074},	   -- EXERCITO
	--{5, -575.99743652344,-201.93130493164,42.704376220703},    -- SEI LÁ
	-- {6, -255.02780151367,6311.7568359375,32.427165985107},  -- SAMU COLOMBIA
	-- {7, 307.41314697266,-599.45880126953,43.283988952637},  -- SAMU

}

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		for _,func in pairs(delegacias) do
			local i,x,y,z = table.unpack(func)
			local ped = GetPlayerPed(-1)
			local playerPos = GetEntityCoords(ped, true)
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
		    DrawMarker(23,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,34,126,255,50,0,0,0,0)
			if distancia <= 1 then
				if(IsControlJustPressed(1, 38)) and emS.permissao() then
					TriggerEvent('nav_policia_arsenal:menu')
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
