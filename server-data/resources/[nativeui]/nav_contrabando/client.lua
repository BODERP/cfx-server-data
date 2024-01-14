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
	if data == "projetos-comprar-projetoassaultrifle" then
		TriggerServerEvent("contrabando-comprar","projetoassaultrifle")
	elseif data == "projetos-comprar-projetoassaultsmg" then
		TriggerServerEvent("contrabando-comprar","projetoassaultsmg")
	elseif data == "projetos-comprar-projetopistol" then
		TriggerServerEvent("contrabando-comprar","projetopistol")
	elseif data == "projetos-comprar-projetosawnoffshotgun" then
		TriggerServerEvent("contrabando-comprar","projetosawnoffshotgun")
	elseif data == "utilidades-comprar-algemas" then
	    TriggerServerEvent("contrabando-comprar","algemas")
	elseif data == "utilidades-comprar-capuz" then
		TriggerServerEvent("contrabando-comprar","capuz")
	elseif data == "utilidades-comprar-c4" then
		TriggerServerEvent("contrabando-comprar","c4")
	elseif data == "utilidades-comprar-serra" then
		TriggerServerEvent("contrabando-comprar","serra")
	elseif data == "utilidades-comprar-furadeira" then
		TriggerServerEvent("contrabando-comprar","furadeira")
	--elseif data == "utilidades-comprar-capsula" then
	--	TriggerServerEvent("contrabando-comprar","capsula")
	elseif data == "subprodutos-comprar-pipe" then
		TriggerServerEvent("contrabando-comprar","pipe")
	elseif data == "subprodutos-comprar-glicerina" then
		TriggerServerEvent("contrabando-comprar","glicerina")
	elseif data == "subprodutos-comprar-ziplock" then
		TriggerServerEvent("contrabando-comprar","ziplock")
	elseif data == "subprodutos-comprar-capsula" then
		TriggerServerEvent("contrabando-comprar","capsula")
	elseif data == "utilidades-comprar-pendrive" then
		TriggerServerEvent("contrabando-comprar","pendrive")
	elseif data == "subprodutos-comprar-seda" then
		TriggerServerEvent("contrabando-comprar","seda")
	--elseif data == "pistolas-comprar-hk" then
	--	TriggerServerEvent("pistolas-comprar","wbody|WEAPON_SNSPISTOL")
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
		local sleep = 1000
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),12.49,-1105.42,29.8,true)
		if distance <= 3 then
			sleep = 4
			DrawMarker(21,12.49,-1105.42,29.8-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
			if distance <= 1.1 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
--[[Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1239.14,-2940.48,9.31,true)
		if distance <= 3 then
			DrawMarker(21,1239.14,-2940.48,9.31-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
			if distance <= 1.1 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
	end
end)]]