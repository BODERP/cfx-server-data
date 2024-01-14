local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
lav = {}
Tunnel.bindInterface("emp_lavardinheirosujo",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookmafia = "https://discordapp.com/api/webhooks/762721100760350721/u4FxHY4zXeIurErtz-pT2yWAOc0gHtYwHQik97bV8tvrPN7tfpwXICyscdn9IyF9p_k1"


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	local amount = vRP.prompt(source, "Valor que você quer lavar:", "")
    local amount = parseInt(amount)
	if user_id then
        if vRP.tryGetInventoryItem(user_id, "dinheirosujo", amount) and vRP.tryGetInventoryItem(user_id, "notarecebimentofalso",5) then
            vRP.giveMoney(user_id, amount*0.95) -- % descontada ao lavar dinheiro
			TriggerClientEvent("Notify", source, "importante", "Lavando <b>R$: " .. vRP.format(amount) .. ".00 Aguarde <b>20 segundos</b>, estamos declarando o seu dinheiro!")
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você precisa de uma Nota de Recebimento Falsa!</b>")
			return false
		end
	end
end

function emP.checkPermission()
	local source = source
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id,"lavagem.permissao")
end

function lav.webhookmafia ()
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	return SendWebhookMessage(webhookmafia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\nLAVOU:" .. vRP.format(amount) ..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
end