local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "cacao", venda = 270 },
	{ item = "arraia", venda = 260 },
	{ item = "cherne", venda = 260 },
	{ item = "caranha", venda = 250 },
	{ item = "pargo", venda = 250 },
	{ item = "badejo", venda = 265 },
	{ item = "viola", venda = 250 },
	{ item = "budiao", venda = 240 },
	{ item = "piava", venda = 260 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("pescador-vender")
AddEventHandler("pescador-vender",function(item)
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
						--vRP.giveMoney(user_id,parseInt(v.venda*quantidade))
						vRP.giveInventoryItem(user_id,"dinheirosujo",v.venda*quantidade)
						TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>"..quantidade.."x "..vRP.itemNameList(v.item).."</b> por <b>R$"..vRP.format(parseInt(v.venda*quantidade)).." reais</b>.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Não possui <b>"..vRP.itemNameList(v.item).."s</b> em sua mochila.")
				end
			end
		end
	end
end)