local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "reciclaveis", venda = 10 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("minerador-crafting")
AddEventHandler("minerador-crafting",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,item,5) then -- QUANTIDADE DE ITEM QUE VAI CONSUMIR
			vRP.giveInventoryItem(user_id,"pecadeferro",1) -- QUANTIDADE DE ITEM QUE VAI ENTREGAR
			TriggerClientEvent("Notify",source,"sucesso","Reciclou <b>5x "..vRP.itemNameList(item).."</b> em <b>1x "..vRP.itemNameList("pecadeferro").."</b>.") -- O 2 É A GAMBIARRA QUE FIZERAM PRA REFERENCIAR O ITEM
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterServerEvent("minerador-vender")
AddEventHandler("minerador-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,item,1) then
			TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>1x "..vRP.itemNameList(item).."</b> por <b>R$"..parseInt(valores[item].venda).."</b>.")
			vRP.giveMoney(user_id,valores[item].venda)
		end
	end
end)]]

RegisterServerEvent("minerador-vender")
AddEventHandler("minerador-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	local data = vRP.getUserDataTable(user_id)
	local quantidade = 0
	if data and data.inventory then
		for k,v in pairs(valores) do
			if item == v.item then
				for i,o in pairs(data.inventory) do
					if i == item then
						quantidade = o.amount
					end
				end
				if parseInt(quantidade) > 0 then
					if vRP.tryGetInventoryItem(user_id,v.item,quantidade) then
						vRP.giveMoney(user_id,parseInt(v.venda*quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>"..quantidade.."x "..vRP.itemNameList(v.item).."</b> por <b>R$"..vRP.format(parseInt(v.venda*quantidade)).." reais</b>.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Não possui <b>"..vRP.itemNameList(v.item).."s</b> em sua mochila.")
				end
			end
		end
	end
end)