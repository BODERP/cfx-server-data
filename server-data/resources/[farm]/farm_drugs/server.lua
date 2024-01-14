local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emP = {}
Tunnel.bindInterface("farm_drugs",emP)
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdrugs = "https://discordapp.com/api/webhooks/762379900824190996/zs0z9lghYHigjM8pYSpHp4l9eotDC455Q1xA3EuU2NF4PvxjJpmkcoZSe6FFUoZzOmjQ"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
function emP.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local soldado = vRP.getUsersByPermission("pgeral.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,10,84,"Ocorrência",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"190",{64,64,255},"Recebemos uma denuncia de tráfico, verifique o ocorrido.")
					SetTimeout(20000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
		SendWebhookMessage(webhookdrugs,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." \n[DENUNCIA]: Iniciou entrega de drogas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
	end
end

RegisterServerEvent('payment:drugs')
AddEventHandler('payment:drugs',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local drugs = {"baseado","cocaina","ecstasy","metanfetamina","lsd"}
	for k,v in pairs(drugs) do
		if vRP.getInventoryItemAmount(user_id,v) >= 1 then
			vRP.tryGetInventoryItem(user_id,v,1)
			vRP.giveInventoryItem(user_id,"dinheirosujo",20)
			TriggerClientEvent("Notify",source,"sucesso","Você entregou 1x "..v)
		end
	end
end)