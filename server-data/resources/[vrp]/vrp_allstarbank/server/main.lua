local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_allstarbank")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbanco = "https://discordapp.com/api/webhooks/763455792203431957/0pZqvpB893mkATx7wZ7Fmaf7Ll_MGFq3HkEDi3lw4IVwwV53VXx1NENDgHR63Od4nOOd"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANCO
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('vrp_allstarbank:depositMoney1461')
AddEventHandler('vrp_allstarbank:depositMoney1461', function(amount)
    local user_id = vRP.getUserId(source)
    local _source = source
    if vRP.tryDeposit(user_id,tonumber(amount)) then
        local identity = vRP.getUserIdentity(user_id)
        TriggerClientEvent("vrp_allstarbank:depositResponse1461", source, true)
        SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEPOSITOU]: $"..vRP.format(parseInt(amount)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent("vrp_allstarbank:depositResponse1461", source, false)
    end
end)

RegisterServerEvent('vrp_allstarbank:withdrawMoney1461')
AddEventHandler('vrp_allstarbank:withdrawMoney1461', function(amount)
    local user_id = vRP.getUserId(source)
    local _source = source
    if vRP.tryWithdraw(user_id,tonumber(amount)) then
        TriggerClientEvent("vrp_allstarbank:withdrawResponse1461", _source, true)
        local identity = vRP.getUserIdentity(user_id)
        SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SACOU]: $"..vRP.format(parseInt(amount)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent("vrp_allstarbank:withdrawResponse1461", _source, false)
    end
end)

RegisterServerEvent('vrp_allstarbank:showName1461')
AddEventHandler('vrp_allstarbank:showName1461', function()
    local _source = source
    local user_id = vRP.getUserId(source)
    vRP.getUserIdentity(user_id, function(identity)
        if identity then
            TriggerClientEvent("vrp_allstarbank:showName1461", _source, identity.firstname, identity.name)
        end
    end)
end)

RegisterServerEvent('vrp_allstarbank:openBalance1461')
AddEventHandler('vrp_allstarbank:openBalance1461', function()
    local _source = source
    local user_id = vRP.getUserId(source)
    local money = vRP.getBankMoney(user_id)
    TriggerClientEvent("vrp_allstarbank:openBalance1461", _source, money)
end)

RegisterServerEvent('vrp_allstarbank:transferMoney1461')
AddEventHandler('vrp_allstarbank:transferMoney1461', function(userid, amount)
    local _source = source
    local user_id = vRP.getUserId(source)
    local targetPlayer = vRP.getUserSource(tonumber(userid))
    local identity = vRP.getUserIdentity(user_id)
    local identityT = vRP.getUserIdentity(userid)
    if targetPlayer == nil then
        return TriggerClientEvent("vrp_allstarbank:notification1461", _source, "Transfer Falhou", "Usuario não encontrado", "error", true)
    end
    local myBank = vRP.getBankMoney(user_id)
    if myBank >= amount then
        vRP.setBankMoney(user_id, myBank - amount)
        vRP.giveBankMoney(userid,amount)
        TriggerClientEvent("Notify",targetPlayer,"sucesso","Você rebeu $" .. amount .." de "  ..identity.name.. " ID: " .. tostring(user_id))
        TriggerClientEvent("vrp_allstarbank:transferResponse1461", _source, true)       
        SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(amount)).."\n[PARA]:"..userid.." "..identityT.name.." "..identityT.firstname.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    else
        TriggerClientEvent("vrp_allstarbank:transferResponse1461", source, false)
    end
end)