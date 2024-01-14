local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_mecanico",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"mecanico.permissao")
end

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,"ferramenta",1) then
			randmoney = math.random(100,250)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." reais</b>.")
		return true
		else
			TriggerClientEvent("Notify",source,"negado","Você precisa de <b>1 Ferramenta</b>.")
		end
	end
end
--