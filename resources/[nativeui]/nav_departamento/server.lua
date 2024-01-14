local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "isca", quantidade = 10, compra = 280, venda = 100 },
	--{ item = "aco", quantidade = 1, compra = 1000, venda = 500 },
	--{ item = "garrafavazia", quantidade = 5, compra = 15, venda = 7 },
	--{ item = "repairkit", quantidade = 1, compra = 3000, venda = 500 },
	--{ item = "bandagem", quantidade = 3, compra = 3000, venda = 1500 },
	{ item = "serra", quantidade = 1, compra = 10000, venda = 5000 },
	{ item = "furadeira", quantidade = 1, compra = 10000, venda = 5000 },
	--{ item = "radio", quantidade = 1, compra = 1000, venda = 500 },
	{ item = "seda", quantidade = 10, compra = 60, venda = 1 },

	{ item = "celular", quantidade = 1, compra = 10000, venda = 2000 },
	{ item = "mochila", quantidade = 1, compra = 8000, venda = 2000 },
	{ item = "roupas", quantidade = 1, compra = 5000, venda = 500 },
	{ item = "alianca", quantidade = 1, compra = 1000, venda = 150 },

	{ item = "cerveja", quantidade = 3, compra = 80, venda = 9 },
	{ item = "tequila", quantidade = 3, compra = 150, venda = 15 },
	{ item = "vodka", quantidade = 3, compra = 170, venda = 24 },
	{ item = "whisky", quantidade = 3, compra = 250, venda = 30 },
	--{ item = "conhaque", quantidade = 3, compra = 72, venda = 36 },
	{ item = "absinto", quantidade = 3, compra = 500, venda = 45 },
	{ item = "energetico", quantidade = 1, compra = 2000, venda = 100 },
	{ item = "agua", quantidade = 3, compra = 30, venda = 100 },
	{ item = "refrigerante", quantidade = 3, compra = 60, venda = 100 },
	{ item = "limonada", quantidade = 3, compra = 50, venda = 100 },
	
	{ item = "sanduiche", quantidade = 1, compra = 15, venda = 15 },
	{ item = "pao", quantidade = 1, compra = 5, venda = 5 },
	{ item = "chocolate", quantidade = 1, compra = 10, venda = 10 },
	{ item = "salgadinho", quantidade = 1, compra = 15, venda = 15 },
	{ item = "rosquinha", quantidade = 1, compra = 5, venda = 5 },
	{ item = "pizza", quantidade = 1, compra = 30, venda = 30 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("departamento-comprar")
AddEventHandler("departamento-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryPayment(user_id,parseInt(v.compra)) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..vRP.itemNameList(v.item).."</b> por <b>R$"..vRP.format(parseInt(v.compra)).." Reais</b>.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("departamento-vender")
AddEventHandler("departamento-vender",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.tryGetInventoryItem(user_id,v.item,parseInt(v.quantidade)) then
					vRP.giveMoney(user_id,parseInt(v.venda))
					TriggerClientEvent("Notify",source,"sucesso","Vendeu <b>"..parseInt(v.quantidade).."x "..vRP.getItemName(v.item).."</b> por <b>$"..vRP.format(parseInt(v.venda)).." dólares</b>.")
				else
					TriggerClientEvent("Notify",source,"negado","Não possui <b>"..parseInt(v.quantidade).."x "..vRP.getItemName(v.item).."</b> em sua mochila.")
				end
			end
		end
	end
end)