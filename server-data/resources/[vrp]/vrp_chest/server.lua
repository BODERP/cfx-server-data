-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_chest",src)
vCLIENT = Tunnel.getInterface("vrp_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaupolicia = "https://discordapp.com/api/webhooks/763397931104862269/hCvq1NmEIXuIlnz3yfvwrKj1fZYzvv2O1_REqp5Jr_lQOKaNJTDtf8WJN4S0sJMFTETS"
local webhookbaugangues = "https://discordapp.com/api/webhooks/763398015050186812/ScNPXS2HOB-xa0zJH8yKOTCCUlChWR26tJFwMbaEftKhAy-JOrCvLzYYjMB1ZoRZBIx7"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
local chest = {
	["Policia"]   = { 5000,"policia.permissao"   },
	["Comandante"]   = { 5000,"comandante.permissao"   },
	["TaxistasLavagem"]       = { 5000,"lavagem.permissao" 	 },
	["Mecanico"]  = { 5000,"mecanico.permissao"  },
	["Italianos"] = { 5000,"milicia.permissao" 	 },
	["Desmanche"] = { 5000,"desmanche.permissao" },
	["Campinho"] = { 5000,"campinho.permissao" },
	["Contrabandista"] = { 5000,"contrabandista.permissao" }
	--["Motoclub"]   = { 5000,"motoclub.permissao"   }, 
	-- ACIMA TODOS VERIFICADOS	
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDOWNTIME
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		for k,v in pairs(actived) do
			if v > 0 then
				actived[k] = v - 2
				if v == 0 then
					actived[k] = nil
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINTPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkIntPermissions(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			if vRP.hasPermission(user_id,chest[chestName][2]) then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function src.openChest(chestName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local hsinventory = {}
		local myinventory = {}
		local data = vRP.getSData("chest:"..tostring(chestName))
		local result = json.decode(data) or {}
		if result then
			for k,v in pairs(result) do
				table.insert(hsinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end

			local inv = vRP.getInventory(parseInt(user_id))
			for k,v in pairs(inv) do
				table.insert(myinventory,{ amount = parseInt(v.amount), name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, peso = vRP.getItemWeight(k) })
			end
		end
		return hsinventory,myinventory,vRP.getInventoryWeight(user_id),vRP.getInventoryMaxWeight(user_id),vRP.computeItemsWeight(result),parseInt(chest[tostring(chestName)][1])
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.storeItem(chestName,itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
			if string.match(itemName,"identidade") then
				TriggerClientEvent("Notify",source,"importante","Não pode guardar este item.",8000)
				return
			end

			local data = vRP.getSData("chest:"..tostring(chestName))
			local items = json.decode(data) or {}
			if items then
				if parseInt(amount) > 0 then
					local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(amount)
					if new_weight <= parseInt(chest[tostring(chestName)][1]) then
						if vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(amount)) then

							if chestName == "Policia" or chestName == "Sheriff" then
								SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif chestName == "Ballas" or chestName == "CV" or chestName == "helipa" or chestName == "zeronze" or chestName == "Vidigal" or chestName == "Serpentes" or chestName == "Motoclub" or chestName == "Cosanostra" or chestName == "Yakuza" or chestName == "Corleone" or chestName == "Transportadora" or chestName == "Concessionaria" or chestName == "Corredores" then
								SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							if items[itemName] ~= nil then
								items[itemName].amount = parseInt(items[itemName].amount) + parseInt(amount)
							else
								items[itemName] = { amount = parseInt(amount) }
							end
							actived[parseInt(user_id)] = 2
						end
					else
						TriggerClientEvent("Notify",source,"negado","<b>Vault</b> cheio.",8000)
					end
				else
					local inv = vRP.getInventory(parseInt(user_id))
					for k,v in pairs(inv) do
						if itemName == k then
							local new_weight = vRP.computeItemsWeight(items)+vRP.getItemWeight(itemName)*parseInt(v.amount)
							if new_weight <= parseInt(chest[tostring(chestName)][1]) then
								if vRP.tryGetInventoryItem(parseInt(user_id),itemName,parseInt(v.amount)) then

									if items[itemName] ~= nil then
										items[itemName].amount = parseInt(items[itemName].amount) + parseInt(v.amount)
									else
										items[itemName] = { amount = parseInt(v.amount) }
									end

									if chestName == "Policia" or chestName == "Sheriff" then
										SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(v.amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									elseif chestName == "Ballas" or chestName == "CV" or chestName == "helipa" or chestName == "zeronze" or chestName == "Vidigal" or chestName == "Serpentes" or chestName == "Motoclub" or chestName == "Cosanostra" or chestName == "Yakuza" or chestName == "Corleone" or chestName == "Transportadora" or chestName == "Concessionaria" or chestName == "Corredores" then
										SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.format(parseInt(v.amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									end

									actived[parseInt(user_id)] = 2
								end
							else
								TriggerClientEvent("Notify",source,"negado","<b>Vault</b> cheio.",8000)
							end
						end
					end
				end
				vRP.setSData("chest:"..tostring(chestName),json.encode(items))
				TriggerClientEvent('Creative:UpdateChest',source,'updateChest')
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function src.takeItem(chestName,itemName,amount)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if user_id and actived[parseInt(user_id)] == 0 or not actived[parseInt(user_id)] then
			local data = vRP.getSData("chest:"..tostring(chestName))
			local items = json.decode(data) or {}
			if items then
				if parseInt(amount) > 0 then
					if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
						if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then

							if chestName == "Policia" or chestName == "Sheriff" then
								SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&584135183213527050>")
							elseif chestName == "Ballas" or chestName == "CV" or chestName == "helipa" or chestName == "zeronze" or chestName == "Vidigal" or chestName == "Serpentes" or chestName == "Motoclub" or chestName == "Cosanostra" or chestName == "Yakuza" or chestName == "Corleone" or chestName == "Transportadora" or chestName == "Concessionaria" or chestName == "Corredores" then
								SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(amount))
							items[itemName].amount = parseInt(items[itemName].amount) - parseInt(amount)

							if parseInt(items[itemName].amount) <= 0 then
								items[itemName] = nil
							end
							actived[parseInt(user_id)] = 2
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
						end
					end
				else
					if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
						if vRP.getInventoryWeight(parseInt(user_id))+vRP.getItemWeight(itemName)*parseInt(items[itemName].amount) <= vRP.getInventoryMaxWeight(parseInt(user_id)) then

							if chestName == "Policia" or chestName == "Sheriff" then
								SendWebhookMessage(webhookbaupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(items[itemName].amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&584135183213527050>")
							elseif chestName == "Ballas" or chestName == "CV" or chestName == "helipa" or chestName == "zeronze" or chestName == "Vidigal" or chestName == "Serpentes" or chestName == "Motoclub" or chestName == "Cosanostra" or chestName == "Yakuza" or chestName == "Corleone" or chestName == "Transportadora" or chestName == "Concessionaria" or chestName == "Corredores" then
								SendWebhookMessage(webhookbaugangues,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.format(parseInt(items[itemName].amount)).." "..vRP.itemNameList(itemName).." \n[BAU]: "..chestName.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							vRP.giveInventoryItem(parseInt(user_id),itemName,parseInt(items[itemName].amount))
							items[itemName] = nil
							actived[parseInt(user_id)] = 2
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
						end
					end
				end
				TriggerClientEvent('Creative:UpdateChest',source,'updateChest')
				vRP.setSData("chest:"..tostring(chestName),json.encode(items))
			end
		end
	end
	return false
end