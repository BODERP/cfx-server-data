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
	if data == "cacao" then
		TriggerServerEvent("pescador-vender","cacao")
	elseif data == "arraia" then
		TriggerServerEvent("pescador-vender","arraia")
	elseif data == "cherne" then
		TriggerServerEvent("pescador-vender","cherne")
	elseif data == "caranha" then
		TriggerServerEvent("pescador-vender","caranha")
	elseif data == "pargo" then
		TriggerServerEvent("pescador-vender","pargo")
	elseif data == "badejo" then
		TriggerServerEvent("pescador-vender","badejo")
	elseif data == "viola" then
		TriggerServerEvent("pescador-vender","viola")
	elseif data == "budiao" then
		TriggerServerEvent("pescador-vender","budiao")
	elseif data == "piava" then
		TriggerServerEvent("pescador-vender","piava")


	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1321.23,-1322.09,4.77,true)
		if distance <= 3 then
			DrawMarker(21,-1321.23,-1322.09,4.77-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
			if distance <= 1.2 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)