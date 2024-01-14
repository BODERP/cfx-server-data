local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP")
kinG = Tunnel.getInterface("vrp_maquininha")

local display = false


-------------------------------------------------------------------------------------------------------
-- ==================================================================================================--
-- ======================================= FORMAS DE ACESSAR ========================================--
-- ==================================================================================================--
-------------------------------------------------------------------------------------------------------


-- Comando
RegisterCommand("maquininha", function(source, args)
	if kinG.checkMaquininha() then
		vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,28422)
		SetDisplay(not display)
	end
end)


-- Botao [INSERT]
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,11) then -- 121 = Insert  11 = pgdn
			if kinG.checkMaquininha() then
				vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,28422)
				SetDisplay(not display)
			end
		end
	end
end)



RegisterCommand("debugs", function(source, args)
	vRP._stopAnim(false)
	vRP._DeletarObjeto()
end)




-------------------------------------------------------------------------------------------------------
-- ==================================================================================================--
-- ================================= NÃO MECHER AQUI PRA BAIXO ======================================--
-- ==================================================================================================--
-------------------------------------------------------------------------------------------------------

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
	vRP._stopAnim(false)
	vRP._DeletarObjeto()
	print("Feito por KingBR#5133 se gosto me chame no discord")
end)

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("trans", function(data)
	SetDisplay(false)
	vRP._stopAnim(false)
	vRP._DeletarObjeto()
	kinG.transBanco(data.text,data.text2)
	print("Feito por KingBR#5133 se gosto me chame no discord")
end)

RegisterNUICallback("cobre", function(data)
	SetDisplay(false)
	vRP._stopAnim(false)
	vRP._DeletarObjeto()
	kinG.pagarConserto(data.text,data.text2)
	print("Feito por KingBR#5133 se gosto me chame no discord")
end)

RegisterNUICallback("error", function(data)
	SetDisplay(false)
	vRP._stopAnim(false)
	vRP._DeletarObjeto()
	TriggerEvent("Notify","negado","Algo deu errado")
	print("Feito por KingBR#5133 se gosto me chame no discord")
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

