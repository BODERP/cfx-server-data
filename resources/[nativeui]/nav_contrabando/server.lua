local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "projetoassaultrifle", quantidade = 1, compra = 25000, venda = 0 },  -- 80k
	{ item = "projetoassaultsmg", 	quantidade = 1, compra = 20000, venda = 0 },  -- 60k
	{ item = "projetopistol", 		quantidade = 1, compra = 5000, venda = 0 },  -- 10k
	--{ item = "projetosawnoffshotgun", quantidade = 1, compra = 45000, venda = 0 }, -- 27k

	{ item = "algemas", 	quantidade = 1, 	compra = 5000, venda = 0 },
	{ item = "capuz", 		quantidade = 1, 	compra = 4000, venda = 0 },
	{ item = "c4", 			quantidade = 1, 	compra = 3500, venda = 0 },
	{ item = "serra", 		quantidade = 1, 	compra = 11000, venda = 0 },
	{ item = "furadeira", 	quantidade = 1, 	compra = 8000, venda = 0 },
	{ item = "pipe", 		quantidade = 10, 	compra = 120, venda = 0 },
	{ item = "glicerina", 	quantidade = 10, 	compra = 120, venda = 0 },
	{ item = "ziplock", 	quantidade = 10, 	compra = 120, venda = 0 },
	{ item = "seda", 		quantidade = 10, 	compra = 120, venda = 0 },
	{ item = "pendrive",	quantidade = 1, 	compra = 2500, venda = 0 },
	{ item = "capsula",		quantidade = 10, 	compra = 120, venda = 0 },

	{ item = "wbody|WEAPON_SNSPISTOL", 		quantidade = 1, 	compra = 37000, venda = 0 },
}


-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR  SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("contrabando-comprar")
AddEventHandler("contrabando-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"dinheirosujo",v.compra) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> por <b>$"..vRP.format(parseInt(v.compra)).." reais sujos</b>.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("contrabando-vender")
AddEventHandler("contrabando-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.tryGetInventoryItem(user_id,v.item,parseInt(v.quantidade)) then
					vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(v.venda))
					TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> por <b>$"..vRP.format(parseInt(v.venda)).." reais sujos</b>.")
				else
					TriggerClientEvent("Notify",source,"negado","Não possui <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> em sua mochila.")
				end
			end
		end
	end
end)