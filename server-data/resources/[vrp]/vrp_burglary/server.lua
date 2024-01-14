-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_burglary",src)
vCLIENT = Tunnel.getInterface("vrp_burglary")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timers = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------

--WEBHOOK
local webhookalertoupolicia = "https://discordapp.com/api/webhooks/726081183284199515/cJz2emBfqe3JzrnKlARTTHIe3TZd4uWuz1055bGK6A7-kT3PODwnHtcNrMdJHDi3qW0p"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	[1] = { ['index'] = "carteiraroubada", ['qtd'] = 1, ['name'] = "Carteiras" },
	[2] = { ['index'] = "tabletroubado", ['qtd'] = 1, ['name'] = "Tablets" },
	[3] = { ['index'] = "sapatosroubado", ['qtd'] = 3, ['name'] = "Sapatos" },
	[4] = { ['index'] = "carregadorroubado", ['qtd'] = 2, ['name'] = "Carregador" },
	[5] = { ['index'] = "vibradorroubado", ['qtd'] = 2, ['name'] = "Vibradores" },
	[6] = { ['index'] = "perfumeroubado", ['qtd'] = 2, ['name'] = "Perfumes" },
	[7] = { ['index'] = "maquiagemroubada", ['qtd'] = 2, ['name'] = "Maquiagens" },
	[8] = { ['index'] = "algemas", ['qtd'] = 1, ['name'] = "Algema" },
	[9] = { ['index'] = "corda", ['qtd'] = 1, ['name'] = "Corda" },
	[10] = { ['index'] = "capuz", ['qtd'] = 1, ['name'] = "Capuz" },
	[11] = { ['index'] = "placa", ['qtd'] = 1, ['name'] = "Placa" },
	[12] = { ['index'] = "pendrive", ['qtd'] = 1, ['name'] = "Pendrive" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return not (vRP.hasPermission(user_id,"mecanico.permissao"))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkTimers(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = vRP.getUsersByPermission("policia.permissao")
	local identity = vRP.getUserIdentity(user_id)
	if homeName then
		if not vRP.searchReturn(source,user_id) and not vRPclient.changingClothes(source) then
			if #policia <= 0 then
				TriggerClientEvent("Notify",source,"aviso","Número insuficientes de policiais no momento.",8000)
				return false
			elseif timers[homeName] == 0 or not timers[homeName] then
				if vRP.tryGetInventoryItem(user_id,"lockpick",1) then
					timers[homeName] = 1800
					SendWebhookMessage(webhookalertoupolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n[CASA]: "..homeName..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					return true
				else
					TriggerClientEvent("Notify",source,"aviso","Você não possui um <b>Lockpick</b>.",8000)
				end
			else
				TriggerClientEvent("Notify",source,"aviso","A casa foi invadida recentemente, aguarde <b>"..timers[homeName].."</b> segundos.",8000)
				return false
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.paymentRobbery(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		local porcentagem = math.random(100)		
		if porcentagem <= 29 then
			TriggerClientEvent("Notify",source,"negado","Compartimento vazio.",8000)
		elseif porcentagem >= 30 and porcentagem <= 49 then
			local randmoney = math.random(300,1000)
			vRP.giveMoney(user_id,randmoney)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>"..vRP.format(parseInt(randmoney)).." reais</b>.",8000)
		elseif porcentagem >= 50 then
			local randitem = math.random(#itemlist)
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(itemlist[randitem].index)*itemlist[randitem].qtd <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id,itemlist[randitem].index,itemlist[randitem].qtd)
				TriggerClientEvent("Notify",source,"sucesso","Você recebeu "..itemlist[randitem].qtd.."x <b>"..itemlist[randitem].name.."</b>.",8000)
			end
			if porcentagem >= 85 then 
				TriggerClientEvent("vrp_sound:fixed",-1,source,x,y,z,100,'alarm',0.6)
				vRP.searchTimer(user_id,120)
				for l,w in pairs(policia) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						async(function()
							local ids = idgens:gen()
							vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
							blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
							TriggerClientEvent('chatMessage',player,"Dispatch",{65,130,255},"O alarme da residência ^1"..tostring(homeName).."^0 disparou, verifique o ocorrido.")
							SetTimeout(25000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTVAULT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.paymentVault(homeName)
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		local random = math.random(100)
		if random <= 29 then 
			vRP.giveInventoryItem(user_id,"notebookprotegido",1)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu 1x<b> Notebook Protegido</b>.",8000)
		elseif random >= 30 and random <= 59 then			
			vRP.giveInventoryItem(user_id,"keycard",1)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu 1x<b> Keycard</b>.",8000)
		elseif random >= 60 and random <= 89 then			
			vRP.giveInventoryItem(user_id,"masterpick",1)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu 1x<b> Masterpick</b>.",8000)
		elseif random >= 90 then
			vRP.giveInventoryItem(user_id,"c4",1)			
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu 1x<b> C4</b>.",8000)
		end
		if random >= 25 then
			TriggerClientEvent("vrp_sound:fixed",-1,source,x,y,z,100,'alarm',0.6)
			vRP.searchTimer(user_id,360)
			for l,w in pairs(policia) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						local ids = idgens:gen()
						vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
						blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
						TriggerClientEvent('chatMessage',player,"Dispatch",{65,130,255},"Um cofre está sendo roubado na residência ^1"..tostring(homeName).."^0, verifique o ocorrido.")
						SetTimeout(25000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
					end)
				end
			end
		end
	end
end