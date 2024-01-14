local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
    { item = "wbody|WEAPON_PISTOL", 	        quantidade = 1, 	compra = 5000, venda = 0 },
    { item = "wbody|WEAPON_ASSAULTSMG", 	    quantidade = 1, 	compra = 10000, venda = 0 },
    --{ item = "wbody|WEAPON_SAWNOFFSHOTGUN", 	quantidade = 1, 	compra = 45000, venda = 0 },
    { item = "wbody|WEAPON_ASSAULTRIFLE",   	quantidade = 1, 	compra = 25000, venda = 0 },
    { item = "wammo|WEAPON_PISTOL",   	quantidade = 100, 	compra = 25, venda = 0 },
    { item = "wammo|WEAPON_ASSAULTSMG",   	quantidade = 100, 	compra = 75, venda = 0 },
    --{ item = "wammo|WEAPON_SAWNOFFSHOTGUN",   	quantidade = 100, 	compra = 50, venda = 0 },
    { item = "wammo|WEAPON_ASSAULTRIFLE",   	quantidade = 100, 	compra = 100, venda = 0 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PAGAMENTO PISTOL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("fabricar-arma")
AddEventHandler("fabricar-arma",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
                    if vRP.tryGetInventoryItem(user_id,"dinheirosujo",v.compra) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Fabricou <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item).."</b> por <b>$"..vRP.format(parseInt(v.compra))..".")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PAGAMENTO SMG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("fabricar-munic")
AddEventHandler("fabricar-munic",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryGetInventoryItem(user_id,"capsula",v.compra) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Fabricou <b>"..parseInt(v.quantidade).."x "..vRP.itemNameList(v.item)..".")
					else
						TriggerClientEvent("Notify",source,"negado","Cápsulas Insuficiente.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)