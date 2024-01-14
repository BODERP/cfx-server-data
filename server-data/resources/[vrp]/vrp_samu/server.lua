local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("vrp_samu",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkServices()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local paramedico = vRP.getUsersByPermission("paramedico.permissao")
		if parseInt(#paramedico) == 0 then
			return true
		end
	end
end

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryFullPayment(user_id, 1500) then
			return true
		end
	end
end
