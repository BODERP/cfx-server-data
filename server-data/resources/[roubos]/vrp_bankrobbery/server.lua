-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
func = {}
Tunnel.bindInterface("vrp_bankrobbery",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbankrobbery = "https://discordapp.com/api/webhooks/762487776443891744/VSWCqwytHIM_DHQRi28siMJ-e1RMWppjKzCZ1xeCbzm8RMpgmdpWQim8U6Og-T8hRima"

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
local blips = {}
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTIONS
-----------------------------------------------------------------------------------------------------------------------------------------   
local moneyHeist = {}

BankHeists = {
    ["Fleeca Bank Highway"] = {
        ["Money"] = 900000,
    },
    ["Fleeca Bank Center"] = {
        ["Money"] = 900000,
    },
    ["Fleeca Bank Top"] = {
        ["Money"] = 900000,
    },
    --[[["Fleeca Bank Invader"] = {
        ["Money"] = 750000,
    },]]
    ["Fleeca Bank Paleto"] = {
        ["Money"] = 900000,
    },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function func.StartBankRobbery(bankId)
    TriggerClientEvent("bankrobbery:openDoor",-1,bankId)
    TriggerClientEvent("bankrobbery:startRobbery",-1,bankId)
    TriggerClientEvent("vrp_sound:source",source,'bankdoor',0.5)
end

function func.EndBankRobbery(bankId)
    TriggerClientEvent("bankrobbery:endRobbery",-1,bankId)
end

function func.ResetMoney(bankId)
    moneyHeist[bankId] = nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function func.CheckPayment(bankId)
	local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if parseInt(moneyHeist[bankId]) <= parseInt(BankHeists[bankId]["Money"]) then
            local cashRecieved = math.random(200000,300000)
            moneyHeist[bankId] = parseInt(moneyHeist[bankId]) + cashRecieved
            vRP.giveInventoryItem(user_id,"dinheirosujo",cashRecieved)
            TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>$"..vRP.format(parseInt(cashRecieved)).." reais</b>.")
        else
            TriggerClientEvent("bankrobbery:deleteEntity",source)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function func.CheckPolice()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local policia = vRP.getUsersByPermission("policia.permissao")
        if #policia < 0 then --<= 0 then --3 then
            TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
            return false
        elseif (os.time()-timedown) <= 28800 then
            TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((28800-(os.time()-timedown)))).." segundos</b> até que os civis efetuem depositos.",8000)
            return false
        end
    end
    return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.CheckRobbery(bankId)
    local source = source
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if user_id then
        timedown = os.time()
        vRP.searchTimer(user_id,parseInt(600))
        TriggerClientEvent("vrp_sound:source",source,'alarm',0.2)
        local policia = vRP.getUsersByPermission("policia.permissao")
        for l,w in pairs(policia) do
            local player = vRP.getUserSource(parseInt(w))
            if player then
                async(function()
                    local id = idgens:gen()
                    TriggerClientEvent('blip:criar:banco',player,x,y,z,bankId)
                    vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                    TriggerClientEvent('chatMessage',player,"911",{64,64,255},"O roubo começou no ^1"..bankId.."^0, dirija-se até o local e intercepte os assaltantes.")
                    SetTimeout(200000,function() TriggerClientEvent('blip:remover:banco',player) end)
                end)
             end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKKEYCARD
-----------------------------------------------------------------------------------------------------------------------------------------
function func.KeyCard()
	local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if user_id then
        if vRP.getInventoryItemAmount(user_id,"keycard") >= 1 then
            vRP.tryGetInventoryItem(user_id,"keycard",1)
			SendWebhookMessage(webhookbankrobbery,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \n[Roubo]: Banquinho \r```")
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui o item <b>KeyCard</b>.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN ITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local selecionado = 0
local spawns = {
    [1] = { ['x'] = 265.11, ['y'] = 210.85, ['z'] = 110.29 },
    [2] = { ['x'] = 259.54, ['y'] = 205.54, ['z'] = 110.29 },
    [3] = { ['x'] = 1063.35, ['y'] = -199.83, ['z'] = 71.76 },
    [4] = { ['x'] = -733.81, ['y'] = -2527.97, ['z'] = 13.95 },
    [5] = { ['x'] = -1109.53, ['y'] = -1690.99, ['z'] = 4.38 },
    [6] = { ['x'] = -3109.03, ['y'] = 752.01, ['z'] = 24.71 },
    [7] = { ['x'] = -687.62, ['y'] = 5758.55, ['z'] = 17.52 },
    [8] = { ['x'] = -104.39, ['y'] = 6482.47, ['z'] = 32.89 },
    [9] = { ['x'] = -177.65, ['y'] = 6419.44, ['z'] = 30.71 },
    [10] = { ['x'] = 1450.78, ['y'] = 6338.5, ['z'] = 24.42 },
    [11] = { ['x'] = 288.72, ['y'] = -1282.45, ['z'] = 29.67 },
    [12] = { ['x'] = -256.21, ['y'] = -716.24, ['z'] = 33.52 },
    [13] = { ['x'] = -537.69, ['y'] = -854.41, ['z'] = 29.31 },
    [14] = { ['x'] = -165.06, ['y'] = 234.73, ['z'] = 94.93 },
    [15] = { ['x'] = -660.59, ['y'] = -854.06, ['z'] = 24.49 },
    [16] = { ['x'] = -712.99, ['y'] = -818.91, ['z'] = 23.73 },
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if os.date("%H:%M:%S") == "20:30:00" or os.date("%H:%M:%S") == "02:00:00" or os.date("%H:%M:%S") == "16:30:00" then
            selecionado = math.random(16)
            TriggerEvent("DropSystem:create","keycard",1,spawns[selecionado].x,spawns[selecionado].y,spawns[selecionado].z,3600)
        end
    end
end)