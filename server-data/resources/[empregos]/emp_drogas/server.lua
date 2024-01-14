local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_drogas",emP)
local idgens = Tools.newIDGenerator()
local blips = {}
local quantidade = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdrugs = "https://discordapp.com/api/webhooks/687300885688483939/SoM40auhQpUfbgzQyFohUhXzOQ0VqUvUmMvQnirXclcYzyWbvaMfumKFsNlRApmviKa_"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
	   quantidade[source] = math.random(5,5)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkItens()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"campinho.permissao") and not vRP.hasPermission(user_id,"ada.permissao") and not vRP.hasPermission(user_id,"tcp.permissao") and not vRP.hasPermission(user_id,"cv.permissao") and not vRP.hasPermission(user_id,"policia.permissao") then --if not vRP.hasPermission(user_id,"policia.permissao") then
            return vRP.getInventoryItemAmount(user_id,"baseado") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"metanfetamina") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"cocaina") >= quantidade[source] or vRP.getInventoryItemAmount(user_id,"ecstasy") >= quantidade[source]
		else 
			--print(user_id .. " tem alguma permissão informada.")
		end

		return
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
--function emP.checkPayment()
    --local source = source
    --local user_id = vRP.getUserId(source)
    --if user_id then
        --local policia = vRP.getUsersByPermission("policia.permissao")
        --local amount_drugs = quantidade[source]
        --local policia_multiplicador = 130
        --[[if vRP.hasPermission(user_id,"ilegal.permissao") then
        	policia_multiplicador = 70
        end]]

        --local policia_multi_valor = ((#policia * policia_multiplicador) * amount_drugs)
        --print("policia calculo sem estar limitado: " .. policia_multi_valor)
        -- limita um bonus maximo de policia até 1,5k sujo
        --if policia_multi_valor > 1500 then
        --	policia_multi_valor = 1500
        --end

        --print("quant policia * policia_multiplicador: " .. #policia * policia_multiplicador)
        --print("policia calculo limitado: " .. policia_multi_valor)
       
        --[[local value = math.random(33,35) --Valor das Drogas
        if vRP.tryGetInventoryItem(user_id,"baseado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"metanfetamina",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"cocaina",quantidade[source]) then
            vRP.giveInventoryItem(user_id,"dinheirosujo", value * amount_drugs + (policia_multi_valor))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
			TriggerClientEvent("Notify",source,"sucesso","Você vendou "..quantidade[source].." drogas.")
            quantidade[source] = nil
        end
    end
end]]

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = vRP.getUsersByPermission("policia.permissao")
	local bonus = 0

	if #policia >= 0 and #policia <= 0 then
        bonus = 0
    elseif #policia >= 1 and #policia <= 2 then
        bonus = 15
    elseif #policia >= 3 and #policia <= 4 then
		bonus = 30
	elseif #policia >= 5 and #policia <= 6 then
		bonus = 55
	elseif #policia >= 7 and #policia <= 8 then
        bonus = 85
    elseif #policia > 9 then
        bonus = 115
    end

	if user_id then
        if vRP.tryGetInventoryItem(user_id,"baseado",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"metanfetamina",quantidade[source]) or vRP.tryGetInventoryItem(user_id,"cocaina",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(103) + bonus) * quantidade[source])
			TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
			TriggerClientEvent("Notify",source,"sucesso","Você vendeu "..quantidade[source].." drogas.") 
		end
		quantidade[source] = nil
		return true
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
--POLICIA
--------------------------------------------------------------------------------------------------------------------------------------------
function emP.OcorrenciaDrogas()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,10,84,"Ocorrência",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"190",{64,64,255},"Recebemos uma denuncia de tráfico, verifique o ocorrido.")
					SetTimeout(50000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
		SendWebhookMessage(webhookdrugs,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." \n[DENUNCIA]: Drogas para NPC "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
	end
end