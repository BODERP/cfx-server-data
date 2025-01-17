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
	if data == "garagem01" then
		vRP.teleport(75.04,-871.57,31.51)
	elseif data == "garagem02" then
		vRP.teleport(-759.57,5584.03,36.71)
	--elseif data == "garagem03" then
	--	vRP.teleport(-772.81,5596.25,33.48)
	elseif data == "hospital01" then
		vRP.teleport(297.67,-586.82,43.27)
	--elseif data == "metro" then
	--	vRP.teleport(-206.11,-1013.50,30.13)
	elseif data == "dp" then
	vRP.teleport(431.05,-1001.17,30.72)
	--elseif data == "aeroporto" then
	--	vRP.teleport(274.2,-1203.64,29.36)
	end
	ToggleActionMenu()
	TriggerEvent("ToogleBackCharacter")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE LOGIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrp:ToogleLoginMenu')
AddEventHandler('vrp:ToogleLoginMenu',function()
	ToggleActionMenu()
end)