-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_ammunation",src)
vCLIENT = Tunnel.getInterface("vrp_ammunation")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookammunation = "https://discordapp.com/api/webhooks/750448975340896347/hhLf4V-1vONy8vT6-VqzCJRolJhTUwPr9DCDjx_utxzOsJtFVaA0lTfr7_fFew1pCz3A"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] = { ['place'] = "Ammunation da Praça", ['seconds'] = 10, ['rewmin'] = 30000, ['rewmax'] = 65000 },
	[2] = { ['place'] = "Ammunation do Porto", ['seconds'] = 10, ['rewmin'] = 30000, ['rewmax'] = 65000 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("pgeral.permissao")
		if #policia < 0 then --2 then
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return false
		elseif (os.time()-timedown) <= 7200 then
			TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((7200-(os.time()-timedown)))).." segundos</b>.",8000)
			return false
		end
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		robbery = true
		timedown = os.time()
		vCLIENT.startRobbery(source,robbers[id].seconds,x,y,z)
		TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
		vRPclient.setStandBY(source,parseInt(600))

		local policia = vRP.getUsersByPermission("pgeral.permissao")
		for k,v in pairs(policia) do
			local policial = vRP.getUserSource(v)
			if policial then
				async(function()
					vCLIENT.startRobberyPolice(policial,x,y,z,robbers[id].place)
					vRPclient.playSound(policial,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O roubo começou na ^1"..robbers[id].place.."^0, dirija-se até o local e intercepte os assaltantes.")
				end)
			end
		end
		SendWebhookMessage(webhookammunation,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \n[Roubo]: Ammunation \r```")
		SetTimeout(robbers[id].seconds*10,function() -- Aqui diminui o tempo?
			if robbery then
				robbery = false
				vRP.searchTimer(user_id,10)
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(robbers[id].rewmin,robbers[id].rewmax)))
				for k,v in pairs(policia) do
					local policial = vRP.getUserSource(v)
					if policial then
						async(function()
							vCLIENT.stopRobberyPolice(policial)
							TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
						end)
					end
				end
			end
		end)

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobbery()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robbery then
			robbery = false
			local policia = vRP.getUsersByPermission("pgeral.permissao")
			for k,v in pairs(policia) do
				local policial = vRP.getUserSource(v)
				if policial then
					async(function()
						vCLIENT.stopRobberyPolice(policial)
						TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O assaltante saiu correndo e deixou tudo para trás.")
					end)
				end
			end
		end
	end
end