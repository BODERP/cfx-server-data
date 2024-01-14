local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('vrp_malote:permissao')
AddEventHandler('vrp_malote:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	TriggerClientEvent('vrp_malote:permissao',player)
end)

RegisterServerEvent('vrp_malote:receber')
AddEventHandler('vrp_malote:receber', function(pagamento)
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then -- PAGAMENTO POR ENTREGAR O MALOTE
		vRP.giveMoney(user_id,parseInt(pagamento))
		TriggerClientEvent("vrp_sound:source",source,'dinheiro',0.3)
	end
end)