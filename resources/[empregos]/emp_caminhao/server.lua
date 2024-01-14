local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_caminhao",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local importados = 1
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local paylist = {
	["importados"] = {
		[1] = { pay = 1624 },
		[2] = { pay = 1144 },
		[3] = { pay = 1656 },
		[4] = { pay = 1640 },
		[5] = { pay = 1840 },
		[6] = { pay = 1896 },
		[7] = { pay = 2824 },
		[8] = { pay = 2984 },
		[9] = { pay = 2712 },
		[10] = { pay = 2144 },
		[11] = { pay = 1272 },
		[12] = { pay = 1240 },
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment(id,mod)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveMoney(user_id,parseInt(paylist[mod][id].pay))
		TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
		TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$"..vRP.format(parseInt(paylist[mod][id].pay)).." reais</b>.")
		if mod == "importados" then
			local value = vRP.getSData("meta:concessionaria")
			local metas = json.decode(value) or 0
			if metas then
				vRP.setSData("meta:concessionaria",json.encode(parseInt(metas+1)))
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300000)
		importados = math.random(#paylist["importados"])
		end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECA PERMISSAO FAC
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
    local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"admin.permissao")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETTRUCKPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.getTruckpoint(point)
	if point == "importados" then
		return parseInt(importados)
	end
end