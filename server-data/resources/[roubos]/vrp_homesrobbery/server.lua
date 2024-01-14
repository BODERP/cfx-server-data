-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_homesrobbery",src)
vCLIENT = Tunnel.getInterface("vrp_homesrobbery")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookhomesrobbery = "" -- Não temos webhook

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local idgens = Tools.newIDGenerator()
local blips = {}
local timehouses = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timehouses) do
			if v > 0 then
				timehouses[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKLOCKPICK
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkLockpick(id,x,y,z,x2,y2,z2,h)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia < 0 then -- Número de policiais necessários
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return true
		elseif parseInt(timehouses[id]) > 0 then
			TriggerClientEvent("Notify",source,"importante","Casa foi invadida recentemente, aguarde "..vRPclient.getTimeFunction(source,parseInt(timehouses[id]))..".",8000)
			return true
		--elseif vRP.hasPermission(user_id,"polpar.permissao") or vRP.hasPermission(user_id,"paisanapolicia.permissao") or vRP.hasPermission(user_id,"paisanaparamedico.permissao") then
		--	return true
		end
		if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1 then
			timehouses[id] = 3600
			vCLIENT.checkStatus(source,true)
			vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
			TriggerClientEvent("progress",source,20000,"invadindo")
			SetTimeout(20000,function()
				if math.random(100) >= 85 and vRP.tryGetInventoryItem(user_id,"lockpick",1) then
					timehouses[id] = 0
					vCLIENT.checkStatus(source,false)
					vRPclient._stopAnim(source,false)
					TriggerClientEvent("Notify",source,"aviso","Fechadura emperrada.",8000)
				else
					if math.random(100) >= 90 then
						vCLIENT.createLocker(source,true,x2,y2,z2,h)
					else
						vCLIENT.createLocker(source,false,x2,y2,z2,h)
					end
					TriggerClientEvent("vrp_sound:source",source,"enterexithouse",0.5)
					vRPclient._stopAnim(source,false)
					vRPclient.teleport(source,x,y,z)
					SendWebhookMessage(webhookhomesrobbery,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CASA]: "..tostring(id).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			end)
		else
			TriggerClientEvent("Notify",source,"negado","<b>Lockpick</b> não encontrada.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["disneylandia01"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia02"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia03"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia04"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia05"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia06"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia07"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia08"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia09"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["disneylandia10"] = {
		[1] = { ['index'] = "bandagem", ['qtd'] = math.random(2) },
		[2] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(3000,6000) },
		[3] = { ['index'] = "repairkit", ['qtd'] = 1 },
		[4] = { ['index'] = "militec", ['qtd'] = 1 },
		[5] = { ['index'] = "energetico", ['qtd'] = 1 },
		[6] = { ['index'] = "mochila", ['qtd'] = 1 },
		[7] = { ['index'] = "roupas", ['qtd'] = 1 },
		[8] = { ['index'] = "cocaina", ['qtd'] = math.random(7,14) },
		[9] = { ['index'] = "maconha", ['qtd'] = math.random(7,14) },
		[10] = { ['index'] = "metanfetamina", ['qtd'] = math.random(7,14) },
		[11] = { ['index'] = "orgao", ['qtd'] = math.random(5) },
		[12] = { ['index'] = "etiqueta", ['qtd'] = math.random(3) },
		[13] = { ['index'] = "relogioroubado", ['qtd'] = 1 },
		[14] = { ['index'] = "pulseiraroubada", ['qtd'] = math.random(2) },
		[15] = { ['index'] = "anelroubado", ['qtd'] = math.random(4) },
		[16] = { ['index'] = "colarroubado", ['qtd'] = 1 },
		[17] = { ['index'] = "brincoroubado", ['qtd'] = math.random(4) },
		[18] = { ['index'] = "carteiraroubada", ['qtd'] = 1 },
		[19] = { ['index'] = "carregadorroubado", ['qtd'] = 1 },
		[20] = { ['index'] = "tabletroubado", ['qtd'] = 1 },
		[21] = { ['index'] = "sapatosroubado", ['qtd'] = math.random(6) },
		[22] = { ['index'] = "vibradorroubado", ['qtd'] = math.random(3) },
		[23] = { ['index'] = "perfumeroubado", ['qtd'] = math.random(3) },
		[24] = { ['index'] = "maquiagemroubada", ['qtd'] = math.random(3) }
	},
	["locker"] = {
		[1] = { ['index'] = "dinheirosujo", ['qtd'] = math.random(10000,20000) },
		[2] = { ['index'] = "keycard", ['qtd'] = 1 },
		[3] = { ['index'] = "wbody|WEAPON_PISTOL_MK2", ['qtd'] = 1 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPayment(house,mod,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getAgachar(source) then
			randlist = math.random(100)
		else
			randlist = math.random(130)
		end
		if randlist <= 80 then
			local randitem = math.random(#itemlist[mod])
			vRP.giveInventoryItem(user_id,itemlist[mod][randitem].index,itemlist[mod][randitem].qtd)
			TriggerClientEvent("Notify",source,"sucesso","Você encontrou <b>"..itemlist[mod][randitem].qtd.."x "..vRP.itemNameList(itemlist[mod][randitem].index).."</b>.",8000)
		elseif randlist >= 81 and randlist <= 93 then
			TriggerClientEvent("Notify",source,"importante","Compartimento vazio.",8000)
		elseif randlist >= 94 then
			vRP.searchTimer(user_id,parseInt(600))
			TriggerClientEvent("vrp_sound:source",source,"alarm",0.2)
			local policia = vRP.getUsersByPermission("policia.permissao")
			for k,v in pairs(policia) do
				local player = vRP.getUserSource(parseInt(v))
				if player then
					async(function()
						local ids = idgens:gen()
						vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
						blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
						TriggerClientEvent('chatMessage',player,"911",{64,64,255},"O alarme da residência ^1"..tostring(house).."^0 disparou, verifique o ocorrido.")
						SetTimeout(45000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
					end)
				end
			end
		end
	end
end