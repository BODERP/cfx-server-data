-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_robberys",src)
vCLIENT = Tunnel.getInterface("vrp_robberys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdepartamento = "https://discord.com/api/webhooks/767949514061250591/NJYfE-1w95dRl_8SgGfxWrAUG5Jv0G_kcxBthJNvfZgk1ZuUtqQDyO98gizmPeVlpoRE"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] =  { ['place'] = "Loja de Departamento", ['seconds'] = 30, ['rewmin'] = 55000, ['rewmax'] = 65000 },
	[2] =  { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 45000, ['rewmax'] = 55000 },
	[3] =  { ['place'] = "Loja de Departamento", ['seconds'] = 45, ['rewmin'] = 45000, ['rewmax'] = 55000 },
	[4] =  { ['place'] = "Loja de Departamento", ['seconds'] = 120, ['rewmin'] = 55000, ['rewmax'] = 65000 },
	[5] =  { ['place'] = "Loja de Departamento", ['seconds'] = 120, ['rewmin'] = 55000, ['rewmax'] = 55000 },
	[6] =  { ['place'] = "Loja de Departamento", ['seconds'] = 90, ['rewmin'] = 35000, ['rewmax'] = 45000 },
	[7] =  { ['place'] = "Loja de Departamento", ['seconds'] = 90, ['rewmin'] = 25000, ['rewmax'] = 35000 },
	--[8] =  { ['place'] = "Loja de Departamento", ['seconds'] = 45, ['rewmin'] = 35000, ['rewmax'] = 45000 },
	--[9] =  { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 55000, ['rewmax'] = 65000 },
	--[10] = { ['place'] = "Loja de Departamento", ['seconds'] = 120, ['rewmin'] = 65000, ['rewmax'] = 75000 },
	--[11] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 45000, ['rewmax'] = 75000 },
	--[12] = { ['place'] = "Loja de Departamento", ['seconds'] = 60, ['rewmin'] = 45000, ['rewmax'] = 75000 },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("pgeral.permissao")
		if #policia < 2 then --2 Número mínimo de policiais em serviço
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return false
		elseif (os.time()-timedown) <= 30 then
			TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((5400-(os.time()-timedown)))).." segundos</b>.",8000)
			return false
		end
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		robbery = true
		timedown = os.time()
		vCLIENT.startRobbery(source,robbers[id].seconds,x,y,z)
		vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
		TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
		vRPclient.setStandBY(source,parseInt(600))

		local policia = vRP.getUsersByPermission("pgeral.permissao")
		for k,v in pairs(policia) do
			local policial = vRP.getUserSource(v)
			if policial then
				async(function()
					vCLIENT.startRobberyPolice(policial,x,y,z,robbers[id].place)
					vRPclient.playSound(policial,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O roubo começou no ^1"..robbers[id].place.."^0, dirija-se até o local e intercepte os assaltantes.")
				end)
			end
		end
		SendWebhookMessage(webhookdepartamento,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \n[Roubo]: Lojinha \r```")
		SetTimeout(robbers[id].seconds*1000,function()
			if robbery then
				robbery = false
				vRP.searchTimer(user_id,300)
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(robbers[id].rewmin,robbers[id].rewmax)))
				TriggerClientEvent("Notify",source,"sucesso","Você pegou o dinheiro! Fuja!",25000)
				for k,v in pairs(policia) do
					local policial = vRP.getUserSource(v)
					if policial then
						async(function()
							vCLIENT.stopRobberyPolice(policial)
							TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
						end)
					end
				end
			end
		end)

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobbery()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robbery then
			robbery = false
			local policia = vRP.getUsersByPermission("pgeral.permissao")
			for k,v in pairs(policia) do
				local policial = vRP.getUserSource(v)
				if policial then
					async(function()
						vCLIENT.stopRobberyPolice(policial)
						TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O assaltante saiu correndo e deixou tudo para trás.")
					end)
				end
			end
		end
	end
end