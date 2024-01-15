-- CÓDIGO LEGADO - FAVOR APAGAR SE O NOVO NÃO DER CERTO
-- local Tunnel = module("vrp","lib/Tunnel")
-- local Proxy = module("vrp","lib/Proxy")
-- vRP = Proxy.getInterface("vRP")
-- emP = {}
-- Tunnel.bindInterface("emp_motorista",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
-- function emP.checkPayment(bonus)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
--         randmoney = (math.random(12,19)--[[+bonus]])
-- 	    vRP.giveMoney(user_id,parseInt(randmoney))
-- 		TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." reais</b>.")
-- 	end
-- end

local paradas =
{
	{ x = 395.06,  y = -988.9,   z = 28.84 },
	{ x = 159.39,  y = -1011.11, z = 28.97 },
	{ x = -46.53,  y = -1129.41, z = 25.58 },
	{ x = -209.15, y = -1410.8,  z = 30.77 },
	{ x = -393.79, y = -1698.17, z = 18.3 },
}

RegisterServerEvent('onBusStop')
AddEventHandler('onBusStop', function(currentStop)
	local _source = source
	local ped = GetPlayerPed(_source)

	local currentCoords = GetEntityCoords(ped)
	local distance = GetDistanceBetweenCoords(currentCoords, paradas[currentStop].x, paradas[currentStop].y,
		paradas[currentStop].z, true)

	if distance < 10.0 then
		TriggerClientEvent('busPickup', -1, _source, currentStop)
	else
		-- Mensagem caso o jogador não esteja próximo o suficiente
		TriggerClientEvent('chatMessage', _source, 'Sistema de ônibus', { 255, 0, 0 },
			'Você não está próximo o suficiente da parada!')
	end
end)

RegisterServerEvent('busNPCBoard')
AddEventHandler('busNPCBoard', function(currentStop)
	local _source = source
	local randomPassengers = math.random(1, 10) -- Ajuste o limite de NPCs conforme necessário

	TriggerClientEvent('busSpawnNPCs', -1, _source, currentStop, randomPassengers)
end)
