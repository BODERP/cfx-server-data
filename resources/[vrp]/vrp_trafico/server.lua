local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_trafico",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

local src = {
	-- COCAÍNA
	[1] = { ['re'] = "pastadecoca", ['reqtd'] = 16, ['re2'] = "quimico", ['reqtd2'] = 8, ['item'] = "cocamisturada", ['itemqtd'] = 8 },
	[2] = { ['re'] = "cocamisturada", ['reqtd'] = 16, ['re2'] = "ziplock", ['reqtd2'] = 8, ['item'] = "cocaina", ['itemqtd'] = 8 },
	-- MONTAR ARMAS 1
	[3] = { ['re'] = "pecadeferro", ['reqtd'] = 10,  ['re2'] = "projetopistol",   		['reqtd2'] = 1, ['item'] = "wbody|WEAPON_PISTOL", ['itemqtd'] = 1 },
	[4] = { ['re'] = "pecadeferro", ['reqtd'] = 450, ['re2'] = "projetoassaultsmg",     ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_ASSAULTSMG", ['itemqtd'] = 1 },
	[5] = { ['re'] = "pecadeferro", ['reqtd'] = 15, ['re2'] = "projetoassaultsmg", ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_MICROSMG", ['itemqtd'] = 1 },
	[6] = { ['re'] = "pecadeferro", ['reqtd'] = 25, ['re2'] = "projetoassaultrifle",   ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_ASSAULTRIFLE", ['itemqtd'] = 1 },
	-- MONTAR MUNIÇÃO 1
	[7] = { ['re'] = "polvora", ['reqtd'] = 20, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_PISTOL", ['itemqtd'] = 20 },
	[8] = { ['re'] = "polvora", ['reqtd'] = 120, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_ASSAULTSMG", ['itemqtd'] = 20 },
	[9] = { ['re'] = "polvora", ['reqtd'] = 60, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_MICROSMG", ['itemqtd'] = 20 },
	[10] = { ['re'] = "polvora", ['reqtd'] = 300, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_ASSAULTRIFLE", ['itemqtd'] = 20 },
	-- CONTRABANDO
	[11] = { ['re'] = "pecadeferro", ['reqtd'] = 20, ['re2'] = "tecido", ['reqtd2'] = 20, ['item'] = "colete", ['itemqtd'] = 1 },
	[12] = { ['re'] = "quimico", ['reqtd'] = 20, ['re2'] = "detonador", ['reqtd2'] = 20, ['item'] = "c4", ['itemqtd'] = 1 }
	--[[MACONHA
	--[3] = { ['re'] = "maconhanaoprocessada", ['reqtd'] = 16, ['re2'] = "seda", ['reqtd2'] = 8, ['item'] = "baseado", ['itemqtd'] = 8 },
	--ECSTASY
	[9] = { ['re'] = "ociacido", ['reqtd'] = 16, ['re2'] = "glicerina", ['reqtd2'] = 8, ['item'] = "ecstasy", ['itemqtd'] = 8 },
	-- METANFETAMINA
	[10] = { ['re'] = "anfetamina", ['reqtd'] = 16, ['re2'] = "pipe", ['reqtd2'] = 8, ['item'] = "metanfetamina", ['itemqtd'] = 8 },
	-- LSD
	[11] = { ['re'] = "dietilamina", ['reqtd'] = 16, ['re2'] = "ziplock", ['reqtd2'] = 8, ['item'] = "lsd", ['itemqtd'] = 8 },]]
	-- MONTAR ARMA 2
	--[24] = { ['re'] = "pecadeferro", ['reqtd'] = 30,  ['re2'] = "projetopistol",   		['reqtd2'] = 1, ['item'] = "wbody|WEAPON_PISTOL", ['itemqtd'] = 1 },
	--[25] = { ['re'] = "pecadeferro", ['reqtd'] = 45, ['re2'] = "projetoassaultsmg",     ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_ASSAULTSMG", ['itemqtd'] = 1 },
	--[26] = { ['re'] = "pecadeferro", ['reqtd'] = 45, ['re2'] = "projetosawnoffshotgun", ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_SAWNOFFSHOTGUN", ['itemqtd'] = 1 },
	--[27] = { ['re'] = "pecadeferro", ['reqtd'] = 750, ['re2'] = "projetoassaultrifle",   ['reqtd2'] = 1, ['item'] = "wbody|WEAPON_ASSAULTRIFLE", ['itemqtd'] = 1 },
	-- MONTAR MUNIÇÃO 2
	--[28] = { ['re'] = "polvora", ['reqtd'] = 20, ['re2'] = "capsula", ['reqtd2'] = 12, ['item'] = "wammo|WEAPON_PISTOL", ['itemqtd'] = 100 },
	--[29] = { ['re'] = "polvora", ['reqtd'] = 20, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_ASSAULTSMG", ['itemqtd'] = 150 },
	--[30] = { ['re'] = "polvora", ['reqtd'] = 20, ['re2'] = "capsula", ['reqtd2'] = 20, ['item'] = "wammo|WEAPON_SAWNOFFSHOTGUN", ['itemqtd'] = 40 },
	--[31] = { ['re'] = "polvora", ['reqtd'] = 20, ['re2'] = "capsula", ['reqtd2'] = 40, ['item'] = "wammo|WEAPON_ASSAULTRIFLE", ['itemqtd'] = 200 },]]
}

--FUNCIONANDO PARA 2 ITENS
function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
			  if vRP.getInventoryItemAmount(user_id, src[id].re) >= src[id].reqtd and vRP.getInventoryItemAmount(user_id, src[id].re2) >= src[id].reqtd2 then 
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) and vRP.tryGetInventoryItem(user_id,src[id].re2,src[id].reqtd2,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)  --testar  PROP_HUMAN_BUM_BIN
					return true
				end
			  end
			end
		else
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(src[id].item)*src[id].itemqtd <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_ped"}},true)
				return true
			end
		end
	end
end
