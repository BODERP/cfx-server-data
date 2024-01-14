local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_trafico2",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

local src = {
	-- LAVAGEM
	[1] = { ['re'] = "notarecebimento", ['reqtd'] = 1, ['item'] = "notarecebimentofalso", ['itemqtd'] = 1 },
	--COCAINA
	[2] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "pastadecoca", ['itemqtd'] = 16 },
	[3] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "folhadecoca", ['itemqtd'] = 16 },
	-- CONTRABANDO
	[4] = { ['re'] = "tecido", ['reqtd'] = 8, ['item'] = "capuz", ['itemqtd'] = 1 },
	[5] = { ['re'] = "chave", ['reqtd'] = 1, ['item'] = "masterpick", ['itemqtd'] = 1 },
	[6] = { ['re'] = "pecadeferro", ['reqtd'] = 15, ['item'] = "algemas", ['itemqtd'] = 1 }
	--[[MACONHA
	[1] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "ramosdemaconha", ['itemqtd'] = 16 },
	[3] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "ramosdemaconha", ['itemqtd'] = 16 },
	[2] = { ['re'] = "ramosdemaconha", ['reqtd'] = 16, ['item'] = "maconhanaoprocessada", ['itemqtd'] = 16 },
	[6] = { ['re'] = "ramosdemaconha", ['reqtd'] = 16, ['item'] = "maconhanaoprocessada", ['itemqtd'] = 16 },
	--[5] = { ['re'] = "folhadecoca", ['reqtd'] = 16, ['item'] = "pastadecoca", ['itemqtd'] = 16 },
	--ECSTASY	
	[7] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "ocitocina", ['itemqtd'] = 16 },
	[8] = { ['re'] = "ocitocina", ['reqtd'] = 16, 	['item'] = "ociacido", ['itemqtd'] = 16 },
	-- METANFETAMINA
	[10] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "acidobateria", ['itemqtd'] = 16 },
	[11] = { ['re'] = "acidobateria", ['reqtd'] = 16, ['item'] = "anfetamina", ['itemqtd'] = 16 },
	-- LSD
	[40] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "fungo", ['itemqtd'] = 8 },
	[41] = { ['re'] = "fungo", ['reqtd'] = 8, ['item'] = "dietilamina", ['itemqtd'] = 8 },
	-- DRIFT KING
	[15] = { ['re'] = "dinheirosujo", ['reqtd'] = 3000, ['item'] = "lockpick", ['itemqtd'] = 1 },
	[13] = { ['re'] = "dinheirosujo", ['reqtd'] = 3000, ['item'] = "nitro", ['itemqtd'] = 1 },
	[14] = { ['re'] = "dinheirosujo", ['reqtd'] = 4000, ['item'] = "placa", ['itemqtd'] = 1 },
	-- MECANICO
	-- COLETE CONTRABANDO
	--[32] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "tecido", ['itemqtd'] = 16 },
	--[33] = { ['re'] = "tecido", ['reqtd'] = 8, ['item'] = "colete", ['itemqtd'] = 1 },
	-- CAPUZ CONTRABANDO
	--[34] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "tecido", ['itemqtd'] = 16 },
	--[36] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "militec", ['itemqtd'] = 1 },
	[36] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "ferramenta", ['itemqtd'] = 1 },
	-- ARMAS MAFIA	
	[37] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "pecadeferro", ['itemqtd'] = 36 },
	[38] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "pecadeferro", ['itemqtd'] = 36 },]]
}

---------------------------------------------------------   
-- LÓGICA PARA APENAS [ 1 ] ITEM
---------------------------------------------------------
function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					vRP.giveInventoryItem(user_id,src[id].item2,src[id].itemqtd2,false)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
					return true
				end
			end
		else
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				vRP.giveInventoryItem(user_id,src[id].item2,src[id].itemqtd2,false)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
				return true
			end
		end
	end
end