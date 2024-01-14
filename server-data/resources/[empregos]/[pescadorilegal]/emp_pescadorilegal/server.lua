local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_pescadorilegal",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local peixesilegais = {
	[1] = { x = "cacao" },
	[2] = { x = "arraia" },
	[3] = { x = "cherne" },
	[4] = { x = "caranha" },
	[5] = { x = "pargo" },
	[6] = { x = "badejo" },
	[7] = { x = "viola" },
	[8] = { x = "budiao" }
}

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("cacao") <= vRP.getInventoryMaxWeight(user_id) then
			if vRP.tryGetInventoryItem(user_id,"isca",1) then
				if math.random(100) >= 98 then
					vRP.giveInventoryItem(user_id,"piava",1)
				else
					vRP.giveInventoryItem(user_id,peixesilegais[math.random(8)].x,1)
				end
				return true
			end
		end
	end
end