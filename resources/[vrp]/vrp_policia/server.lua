local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookarmaadm = "https://discordapp.com/api/webhooks/762355196042018817/7GHnKEXcyGhTxO6CXwh0v6A2wEoMSDLMk9vZ0WyZL5RAIVYvCJ581UT-I88eMOGanibC"
local webhookprender = "https://discordapp.com/api/webhooks/764907654551306250/E-CqmP908CLOv-OJ3vhXyfwLr8EGIzcrovgohGvF9gko01b0pg9Sp_vS2N1Ze51SgaCK"
local webhookmultas = "https://discordapp.com/api/webhooks/764908033422655548/DyltYYuxpgVm4rFYiFfED13LJhlvcMIP-XCwcztJKNeosFkNdWTXvmRWcyDVTwbgtcls"
--local webhookocorrencias = "https://discordapp.com/api/webhooks/744707429039734815/l0KgvajmoETplIRnupGqPe5Dsgoo8agN0lp1fCn0Wfr7pmqd9rhyCXdlZ1no0D6Veab9"
local webhookdetido = "https://discordapp.com/api/webhooks/762355587404660736/YZETZf1LIwozssNf74UEj6R04fELa5u0p5g5VKLixiph2EbjZWb9npwSsS5WG3m21G31"
local webhookponto = "https://discordapp.com/api/webhooks/762527021913079808/tYMODW3zHWiwOJ1NISVjGWgITrOzoa2Kf6F1XhtcJ1w-hAwXvnTvAPvJtS1tlUgqmjd_"
local webhookparamedico = "https://discordapp.com/api/webhooks/762527511098687508/R7ue_-ml4XnInxTGKPTU5xbyaxSjOPDEI1eXliywVdsGodp5qt6lzz7_Gm8g8oGhEChK"
local webhookmecanico = "https://discordapp.com/api/webhooks/762525870769963008/kcYvIOOK4MeMCK7iXkmzmtefKaUdJfuucNieONQRM70hJVDvm7gpjSBLNHcdP9RhrdZ5"
local webhookre = "https://discordapp.com/api/webhooks/762355988589445141/323dbnnnCK0jarbWI_0Y4LZRpScGQjrJvBlOaByKuelI1Eu9ZS-uoL92MYVU43IjMSSC"
local webhookpoliciaapreendidos = "https://discordapp.com/api/webhooks/764908227988946964/zTIlRXnPRCHv2ExWTomCUGKs3i9bDwdvKRJNG2hgfwQivD9XiTkLtXQg8nhP0vbt8h_x"
local paytow = "https://discordapp.com/api/webhooks/762356656688201758/SlS725k4jW_Ct36V1RmysK3zN5EqEQ3HJ5T5JEAlbKgKxsOk5DDpIh9pXv0BHECth0QU"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"desmanche.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"190",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
			end
		else
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			local placa_user = vRP.getUserByRegistration(placa)
			if placa then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						local vehicleName = vRP.vehicleName(vname)
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"190",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Modelo: ^0"..vehicleName.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- bvida
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('bvida',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
		vRPclient._setCustomization(source,vRPclient.getCustomization(source))
		vRP.removeCloak(source)			
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
 ----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('ptr', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("policia.permissao") or vRP.getUsersByPermission("pcivil.permissao") or vRP.getUsersByPermission("mecanico.permissao") or vRP.getUsersByPermission("paramedico.permissao")
 	local paramedicos = 0
 	local oficiais_nomes = ""
 	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
		 TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Oficiais</b> em serviço.")
 		if parseInt(paramedicos) > 0 then
 			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
 		end
 	end
end)


--RegisterCommand('ptr',function(source,args,rawCommand)
--   local source = source
--    local user_id = vRP.getUserId(source)
--    if user_id then
--        local policiaMilitar = vRP.getUsersByPermission("policia.permissao")
--        local policiaCivil = vRP.getUsersByPermission("pcivil.permissao")
        --local policiaBope = vRP.getUsersByPermission("bope.permissao")
--        local samu = vRP.getUsersByPermission("paramedico.permissao")
--        local admin = vRP.getUsersByPermission("admin.permissao")
--        if args[1] == "pm" then
--            TriggerClientEvent("Notify",source,"PTR","PMs em Serviço: "..#policiaMilitar)
        --elseif args[1] == "pc" then
        --    TriggerClientEvent("Notify",source,"PTR","Policia Civil em Serviço: "..#policiaCivil)
        --elseif args[1] == "bope" then
        --    TriggerClientEvent("Notify",source,"PTR","Bope em Serviço: "..#policiaBope)
 --       elseif args[1] == "samu" then
 --           TriggerClientEvent("Notify",source,"PTR","SAMU em Serviço: "..#samu)
        --elseif args[1] == "admin" then
         --   TriggerClientEvent("Notify",source,"PTR","Admins Online: "..#admin)
 --       end
 --   end
--end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
 ----------------------------------------------------------------------------------------------------------------------------------------
 --[[RegisterCommand('ptr', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("policia.permissao")
	local paramedicos = 0
	local oficiais_nomes = ""
	--if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
		for k,v in ipairs(oficiais) do
			--local identity = vRP.getUserIdentity(parseInt(v))
			--oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
			paramedicos = paramedicos + 1
		end
		vRP.tryFullPayment(user_id, 150)
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Oficiais</b> em serviço.")
		TriggerClientEvent("Notify",source,"negado","Você gastou <b>150$</b>.",5000)
		TriggerClientEvent("vrp_sound:source",source,'message',0.5)
		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMS
 ----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ems', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("paramedico.permissao")
 	local paramedicos = 0
 	local paramedicos_nomes = ""
 	--if vRP.hasPermission(user_id,"paramedico.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			paramedicos_nomes = paramedicos_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Paramédicos</b> em serviço.")
		TriggerClientEvent("vrp_sound:source",source,'message',0.5)
 		if parseInt(paramedicos) > 0 then
	 		TriggerClientEvent("Notify",source,"importante", paramedicos_nomes)
	 	end
 	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MECANICOS
 ----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mecs', function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local player = vRP.getUserSource(user_id)
 	local oficiais = vRP.getUsersByPermission("callmec.permissao")
 	local paramedicos = 0
 	local oficiais_nomes = ""
 	--if vRP.hasPermission(user_id,"mecanicolider.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
 		for k,v in ipairs(oficiais) do
 			local identity = vRP.getUserIdentity(parseInt(v))
 			oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.name .. " " .. identity.firstname .. "<br>"
 			paramedicos = paramedicos + 1
 		end
 		TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..paramedicos.." Mecânicos</b> em serviço.")
 		if parseInt(paramedicos) > 0 then
			TriggerClientEvent("Notify",source,"importante", oficiais_nomes)
			TriggerClientEvent("vrp_sound:source",source,'message',0.5)
 		end
 	--end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
--QTH GERAL
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('qthpm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"pgeral.permissao") then
			local soldado = vRP.getUsersByPermission("pgeral.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.")
						vRPclient._playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QTH CIVIL
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('qthc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"pcivil.permissao") then
			local soldado = vRP.getUsersByPermission("pcivil.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.")
						vRPclient._playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QTH GERAL
-----------------------------------------------------------------------------------------------------------------------------------------
local policia = {}
RegisterCommand('qth',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.")
						vRPclient._playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 911
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('911',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"juiz.permissao") or vRP.hasPermission(user_id,"advogado.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{64,64,255},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pd',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,179,255},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 112
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('112',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"paramedico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{255,70,135},rawCommand:sub(4))
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calladm',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.name.." "..identity.firstname,{255,70,135},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pagar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") and vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				vRP.giveMoney(nuser_id,1000)
				vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
				vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
				TriggerClientEvent("Notify",source,"sucesso","Efetuou o pagamento pelo serviço do mecânico.")
				TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>R$ 1.000,00</b> pelo serviço de mecânico.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('toggle',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	  -- RECRUTA --------------------------------------------------------------------------------------------------------------------------
	if vRP.hasPermission(user_id,"recruta.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaRecruta")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[RECRUTA]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"recruta.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Recruta")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[RECRUTA]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- SOLDADO --------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"soldado.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSoldado")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SOLDADO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"soldado.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Soldado")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SOLDADO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- SARGENTO -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"sargento.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaSargento")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SARGENTO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"sargento.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Sargento")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[SARGENTO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- TENENTE -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"tenente.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaTenente")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TENENTE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"tenente.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Tenente")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TENENTE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CAPITÃO -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"capitao.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaCapitao")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CAPITAO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"capitao.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Capitao")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CAPITAO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- TENENTE CORONEL -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"tencoronel.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaTenCoronel")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TEN. CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"tencoronel.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"TenCoronel")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[TEN. CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CORONEL -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"coronel.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaCoronel")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"coronel.folga") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"Coronel")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CORONEL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- POLICIAL FEDERAL --------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"federal.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaFederal")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL FEDERAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanafederal.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"PolicialFederal")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL FEDERAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- DELEGADO  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"del.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"delgeralfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"delp.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"delgeral")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- DELEGADO2  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"delesp.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"delespfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"delp2.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"delesp")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- INVESTIGADOR  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"invchf.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"invfolga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"invchfolga.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"invchf")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- AGENTE3  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"ag3.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"agente3folga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"ag3f.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"agente3")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- AGENTE2  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"ag2.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"agente2folga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"ag2f.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"agente2")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- POLICIAL CIVIL -- AGENTE1  -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"ag1.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"agente1folga")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"ag1f.permissao") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"agente1")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[POLICIAL CIVIL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE CEL-----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"cb1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"pcelbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"cb0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"celbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE TCEL -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"tcb1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"ptcelbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"tcb0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"tcelbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE MAJ -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"mj1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"pmjbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"mj0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"pmjbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE CAP -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"cap1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"pcpbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"cap0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"cpbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE TEN -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"tn1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"ptnbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"tn0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"tnbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE 1 SGT -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sg11.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"psg1bope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"sg10.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"sg1bope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE 2 SGT -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sg21.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"psg2bope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"sg20.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"sg2bope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE 3 SGT -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sg31.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"psg3bope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"sg30.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"sg3bope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE CABO -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"cab1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"pcbbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"cab0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"cbbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE SOLD -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"sd1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"psdbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"sd0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"sdbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				------------------------------------------------------------------------------------------------------------------------------------- 
	  -- BOPE REC -----------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"rc1.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"prcbope")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"rc0.servico") then
		TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 47 })
		vRP.addUserGroup(user_id,"rcbope")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[BOPE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------- 
	  -- Enfermeiro -----------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"enfermeiro.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaEnfermeiro")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[ENFERMEIRO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanaenfermeiro.permissao") then
		TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Enfermeiro")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[ENFERMEIRO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- Paramédico -----------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"paramedico.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaParamedico")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PARAMEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"paisanaparamedico.permissao") then
		TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Paramedico")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[PARAMEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- Médico -----------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"medico.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaMedico")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"medico.folga") then
		TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Medico")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MEDICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- Diretor -----------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"diretor.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaDiretor")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"diretor.folga") then
		TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Diretor")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[DIRETOR]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

	-------------------------------------------------------------------------------------------------------------------------------------
	-- Chefe Mecânica -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"chefe.servico") then
	--	TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaChefe")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookmecanico,"```prolog\n[CHEFE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
--		TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"chefe.folga") then
	--	TriggerEvent('eblips:add',{ name = "Mecanico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Chefe")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookmecanico,"```prolog\n[CHEFE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  
	-------------------------------------------------------------------------------------------------------------------------------------
	-- Mecânico -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"mecanico.servico") then
	--	TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaMecanico")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--	TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"mecanico.folga") then
	--	TriggerEvent('eblips:add',{ name = "Mecanico", src = source, color = 61 })
		vRP.addUserGroup(user_id,"Mecanico")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookparamedico,"```prolog\n[MECANICO]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	-------------------------------------------------------------------------------------------------------------------------------------
	-- Ajudante Mecânica -------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"ajudante.servico") then
	--TriggerEvent('eblips:remove',source)
	vRP.addUserGroup(user_id,"PaisanaAjudante")
	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	SendWebhookMessage(webhookmecanico,"```prolog\n[AJUDANTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--TriggerClientEvent('desligarRadios',source)
	elseif vRP.hasPermission(user_id,"ajudante.folga") then
	--TriggerEvent('eblips:add',{ name = "Mecanico", src = source, color = 61 })
	vRP.addUserGroup(user_id,"Ajudante")
	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	SendWebhookMessage(webhookmecanico,"```prolog\n[AJUDANTE]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[==========ENTROU EM SERVICO=========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	
		------------------------------------------------------------------------------------------------------------------------------------
	--elseif vRP.hasPermission(user_id,"mecanico.permissao") then
	--	vRP.addUserGroup(user_id,"PaisanaMecanico")
	--	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	--	SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--	TriggerClientEvent('desligarRadios',source)
	--elseif vRP.hasPermission(user_id,"chefe.permissao") then
	--	vRP.addUserGroup(user_id,"PaisanaMecanico")
	--	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	--	SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--	TriggerClientEvent('desligarRadios',source)
	--elseif vRP.hasPermission(user_id,"ajudante.permissao") then
	--	vRP.addUserGroup(user_id,"PaisanaMecanico")
	--	TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	--	SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	--	TriggerClientEvent('desligarRadios',source)
	--elseif vRP.hasPermission(user_id,"paisanamecanico.permissao") then
	--	vRP.addUserGroup(user_id,"Mecanico")
	--	TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
	--	SendWebhookMessage(webhookmecanico,"```prolog\n[MECANICO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	
	--[[elseif vRP.hasPermission(user_id,"taxista.permissao") then
		vRP.addUserGroup(user_id,"PaisanaTaxista")
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
	elseif vRP.hasPermission(user_id,"paisanataxista.permissao") then
		vRP.addUserGroup(user_id,"Taxista")
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")]]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ REANIMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reanimar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"paramedico.permissao") then
		TriggerClientEvent('reanimar',source)
	end
end)

RegisterServerEvent("reanimar:pagamento2409")
AddEventHandler("reanimar:pagamento2409",function()
	local user_id = vRP.getUserId(source)
	if user_id then
		pagamento = math.random(50,80)
		vRP.giveMoney(user_id,pagamento)
		TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>$"..pagamento.." dólares</b> de gorjeta do americano.")
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- MULTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		local motivo = vRP.prompt(source,"Motivo:","")
		if id == "" or valor == "" or motivo == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))
		SendWebhookMessage(webhookmultas,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============MULTOU==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(valor)).." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		randmoney = math.random(0,0)
		vRP.giveMoney(user_id,parseInt(randmoney))
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		--TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." reais</b> de bonificação.")
		TriggerClientEvent("Notify",nplayer,"importante","Você foi multado em <b>$"..vRP.format(parseInt(valor)).." reais</b>.<br><b>Motivo:</b> "..motivo..".")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OCORRENCIA
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('ocorrencia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Ocorrência:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))
		SendWebhookMessage(webhookocorrencias,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============OCORRENCIA==============] \n[PASSAPORTE]: "..id.." "..identity.name.." "..identity.firstname.."\n[IDENTIDADE]: "..identity.registration.." \n[TELEFONE]: "..identity.phone.." \n[OCORRENCIA]: "..ocorrencia.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		TriggerClientEvent("Notify",source,"sucesso","Ocorrência registrada com sucesso.")
		TriggerClientEvent("Notify",nplayer,"importante","Sua <b>Ocorrência</b> foi registrada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- DETIDO
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("creative/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
            if rows[1] then
                if parseInt(rows[1].detido) == 1 then
                    TriggerClientEvent("Notify",source,"importante","Este veículo já se encontra detido.",8000)
                else
                	local identity = vRP.getUserIdentity(puser_id)
                	local nplayer = vRP.getUserSource(parseInt(puser_id))
                	SendWebhookMessage(webhookdetido,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[CARRO]: "..vname.." \n[PASSAPORTE]: "..puser_id.." "..identity.name.." "..identity.firstname.." \n[MOTIVO]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					--TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify",nplayer,"importante","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end
    end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRENDER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		local crimes = vRP.prompt(source,"Crimes:","")
		if crimes == "" then
			return
		end

		local player = vRP.getUserSource(parseInt(args[1]))
		if player then
			vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			prison_lock(parseInt(args[1]))
			TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)

			
			local oficialid = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(args[1]).." "..identity.name.." "..identity.firstname.." \n[TEMPO]: "..vRP.format(parseInt(args[2])).." Meses \n[CRIMES]: "..crimes.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			
			randmoney = math.random(90,150)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("Notify",source,"sucesso","Prisão efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
			TriggerClientEvent("Notify",nplayer,"importante","Você foi preso por <b>"..vRP.format(parseInt(args[2])).." meses</b>.<br><b>Motivo:</b> "..crimes..".")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
		end 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") or vRP.hasPermission(user_id,"conce.permissao") or vRP.hasPermission(user_id,"juiz.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer == nil then
				TriggerClientEvent("Notify",source,"aviso","Passaporte <b>"..vRP.format(args[1]).."</b> indisponível no momento.")
				return
			end
			nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		else
			local nplayer = vRPclient.getNearestPlayer(source,2)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local value = vRP.getUData(nuser_id,"vRP:multas")
				local valormultas = json.decode(value) or 0
				local identityv = vRP.getUserIdentity(user_id)
				local identity = vRP.getUserIdentity(nuser_id)
				local carteira = vRP.getMoney(nuser_id)
				local banco = vRP.getBankMoney(nuser_id)
				--[[TriggerClientEvent("Notify",nplayer,"importante","Seu documento está sendo verificado por <b>"..identityv.name.." "..identityv.firstname.."</b>.")]]--
				vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Nome:</b> "..identity.name.." "..identity.firstname.." ( "..vRP.format(identity.user_id).." )</div><div class=\"local2\"><b>Identidade:</b> "..identity.registration.."</div><div class=\"local\"><b>Idade:</b> "..identity.age.." Anos</div><div class=\"local2\"><b>Telefone:</b> "..identity.phone.."</div><div class=\"local\"><b>Multas pendentes:</b> "..vRP.format(parseInt(valormultas)).."</div><div class=\"local2\"><b>Carteira:</b> "..vRP.format(parseInt(carteira)).."</div>")
				vRP.request(source,"Você deseja fechar o registro geral?",1000)
				vRPclient.removeDiv(source,"completerg")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('algemar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
					SetTimeout(5000,function()
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(5000,function()
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						TriggerClientEvent('carregar',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
						SetTimeout(3500,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('algemar2',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar',nplayer,source)
					--[[vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)]]--
					SetTimeout(0,function()
						vRPclient.toggleHandcuff(nplayer)
						--TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					--TriggerClientEvent('carregar',nplayer,source)
					--[[vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)]]--
					SetTimeout(0,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						--TriggerClientEvent('carregar',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						--TriggerClientEvent('carregar',nplayer,source)
						--vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(0,function()
							vRPclient.toggleHandcuff(nplayer)
							--TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						--TriggerClientEvent('carregar',nplayer,source)
						--[[vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)]]--
						SetTimeout(0,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							--TriggerClientEvent('carregar',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then	
		if nplayer then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent('carregar',nplayer,source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RMASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rmascara',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rchapeu',nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RCAPUZ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isCapuz(nplayer) then
				vRPclient.setCapuz(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa não está com o capuz na cabeça.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('re',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"paramedico.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isInComa(nplayer) then
				local identity_user = vRP.getUserIdentity(user_id)
				local nuser_id = vRP.getUserId(nplayer)
				local identity_coma = vRP.getUserIdentity(nuser_id)
				local set_user = "Policia"
				if vRP.hasPermission(user_id,"paramedico.permissao") then
					set_user = "Paramedico"
				end
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("progress",source,30000,"reanimando")
				SetTimeout(30000,function()
					SendWebhookMessage(webhookre,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.." \n[REVIVEU]: "..nuser_id.." "..identity_coma.name.." "..identity_coma.firstname .. "\n[SET]: "..set_user..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					vRP.giveMoney(user_id,200)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent('cancelando',source,false)
				end)
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- APREENDER
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	"dinheirosujo",
	"capsula",
	"algemas",
	"capuz",
	"lockpick",
	"masterpick",
	"orgao",
	"orgaos",
	"tartaruga",
	"carnedetartaruga",
	"etiqueta",
	"pendrive",
	"relogioroubado",
	"pulseiraroubada",
	"anelroubado",
	"colarroubado",
	"vibradorroubado",
	"perfumeroubado",
	"brincoroubado",
	"carteiraroubada",
	"tabletroubado",
	"sapatosroubado",
	"armacaodearma",
	"pecadeferro",
	-- YAKUZA  ------------------
	"celularroubado",
	-- Maconha ------------------
	"maconha",
	"ramosdemaconha",
	"maconhanaoprocessada",
	"maconhamisturada",
	"baseado",
	"seda",
	"receita1",
	"receita2",
	-----------------------------
	-- Ecstasy ------------------
	"ecstasy",
	"ociacido",
	"ocitocina",
	"primaecstasy",
	-----------------------------
	-- Cocaína ------------------
	"folhadecoca",
	"pastadecoca",
	"cocamisturada",
	"cocaina",
	"impostoderendafalso",
	-----------------------------
	"metanfetamina",
	"anfetamina",
	"cristal",
	"lsd",
	"logsinvasao",
	"acessodeepweb",
	"keysinvasao",
	"pendriveinformacoes",
	"keycard",
	"c4",
	"serra",
	"furadeira",
	"wbody|WEAPON_DAGGER",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_BOTTLE",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_HAMMER",
	"wbody|WEAPON_HATCHET",
	"wbody|WEAPON_KNUCKLE",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_MACHETE",
	"wbody|WEAPON_SWITCHBLADE",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_WRENCH",
	"wbody|WEAPON_BATTLEAXE",
	"wbody|WEAPON_POOLCUE",
	"wbody|WEAPON_STONE_HATCHET",
	"wbody|WEAPON_PISTOL",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_PUMPSHOTGUN_MK2",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_SNSPISTOL",
	"wbody|WEAPON_MICROSMG",
	"wbody|WEAPON_ASSAULTRIFLE",
	"wbody|WEAPON_FIREEXTINGUISHER",
	"wbody|WEAPON_FLARE",
	"wbody|WEAPON_REVOLVER",
	"wbody|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_VINTAGEPISTOL",
	"wbody|WEAPON_MUSKET",
	"wbody|WEAPON_GUSENBERG",
	"wbody|WEAPON_ASSAULTSMG",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_COMPACTRIFLE",
	"wbody|WEAPON_CARBINERIFLE_MK2",
 	"wbody|WEAPON_MACHINEPISTOL",
	"wbody|WEAPON_PUMPSHOTGUN",
	"wbody|WEAPON_SAWNOFFSHOTGUN",
	"wbody|WEAPON_BULLPUPRIFLE",
	"wammo|WEAPON_SAWNOFFSHOTGUN",
	"wammo|WEAPON_BULLPUPRIFLE",
	"wammo|WEAPON_DAGGER",
	"wammo|WEAPON_BAT",
	"wammo|WEAPON_BOTTLE",
	"wammo|WEAPON_CROWBAR",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_GOLFCLUB",
	"wammo|WEAPON_HAMMER",
	"wammo|WEAPON_HATCHET",
	"wammo|WEAPON_KNUCKLE",
	"wammo|WEAPON_KNIFE",
	"wammo|WEAPON_MACHETE",
	"wammo|WEAPON_SWITCHBLADE",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_WRENCH",
	"wammo|WEAPON_BATTLEAXE",
	"wammo|WEAPON_POOLCUE",
	"wammo|WEAPON_STONE_HATCHET",
	"wammo|WEAPON_PISTOL",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_PUMPSHOTGUN",
	"wammo|WEAPON_PUMPSHOTGUN_MK2",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_SNSPISTOL",
	"wammo|WEAPON_MICROSMG",
	"wammo|WEAPON_ASSAULTRIFLE",
	"wammo|WEAPON_FIREEXTINGUISHER",
	"wammo|WEAPON_FLARE",
	"wammo|WEAPON_REVOLVER",
	"wammo|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_VINTAGEPISTOL",
	"wammo|WEAPON_MUSKET",
	"wammo|WEAPON_GUSENBERG",
	"wammo|WEAPON_ASSAULTSMG",
	"wammo|WEAPON_COMBATPDW",
	"wammo|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_CARBINERIFLE_MK2",
	"wammo|WEAPON_COMPACTRIFLE",
	"projetoassaultrifle",
	"projetoassaultsmg",
	"projetobullpuprifle",
	"projetocarbinerifle",
	"projetocombatpdw",
	"projetocombatpistol",
	"projetogusenberg",
	"projetopistol",
	"projetopumpshotgun",
	"projetosawnoffshotgun",
	"projetosmg",
	"ferramentas",
	"detonador"
}

RegisterCommand('apreender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local user_id = vRP.getUserId(source)

		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local nidentity = vRP.getUserIdentity(nuser_id)
				local itens_apreendidos = {}
				local weapons = vRPclient.replaceWeapons(nplayer,{})
				for k,v in pairs(weapons) do
					vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
					if v.ammo > 0 then
						vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
					end
				end

				local inv = vRP.getInventory(nuser_id)
				for k,v in pairs(itemlist) do
					local sub_items = { v }
					if string.sub(v,1,1) == "*" then
						local idname = string.sub(v,2)
						sub_items = {}
						for fidname,_ in pairs(inv) do
							if splitString(fidname,"|")[1] == idname then
								table.insert(sub_items,fidname)

							end
						end
					end

					for _,idname in pairs(sub_items) do
						local amount = vRP.getInventoryItemAmount(nuser_id,idname)
						if amount > 0 then
							local item_name,item_weight = vRP.getItemDefinition(idname)
							if item_name then
								if vRP.tryGetInventoryItem(nuser_id,idname,amount,true) then
									vRP.giveInventoryItem(user_id,idname,amount)
									table.insert(itens_apreendidos, "[ITEM]: "..vRP.itemNameList(idname).." [QUANTIDADE]: "..amount)
								end
							end
						end
					end
				end
				local apreendidos = table.concat(itens_apreendidos, "\n")
				SendWebhookMessage(webhookpoliciaapreendidos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APREENDEU DE]:  "..nuser_id.." "..nidentity.name.." "..nidentity.firstname.."\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
				TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARSENAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('arsenal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('arsenal',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('extras',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        if vRPclient.isInVehicle(source) then
            TriggerClientEvent('extras',source)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYEXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryextras")
AddEventHandler("tryextras",function(index,extra)
    TriggerClientEvent("syncextras",-1,index,parseInt(extra))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") or vRP.hasPermission(user_id,"mecanico.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") or vRP.hasPermission(user_id,"mecanico.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- DISPAROS
--------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"policia.permissao") then
			local policiais = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(policiais) do
				local player = vRP.getUserSource(w)
				if player then
					TriggerClientEvent('notificacao',player,x,y,z,user_id)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANUNCIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('anuncio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"conce.permissao") or vRP.hasPermission(user_id,"vanilla.permissao") then
		local identity = vRP.getUserIdentity(user_id)
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(0,128,192,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 7%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 15px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: "..identity.name.." "..identity.firstname)
		SetTimeout(30000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente!")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUIR PENA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("diminuirpena5054")
AddEventHandler("diminuirpena5054",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 15 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify",source,"importante","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify",source,"importante","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--ARSENAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('armas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
    	SendWebhookMessage(webhookarmaadm,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		if args[1] == "adm" and vRP.hasPermission(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_RAYPISTOL"] = { ammo = 0 }})	
			vRPclient.giveWeapons(source,{["WEAPON_FIREWORK"] = { ammo = 20 }})				
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_PISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_REVOLVER_MK2"] = { ammo = 250 }})		
			vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN_MK2"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_APPISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_SPECIALCARBINE"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_HEAVYSNIPER_MK2"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_BZGAS"] = { ammo = 25 }})	
			vRPclient.setArmour(source,100)
		elseif args[1] == "policia" and vRP.hasPermission(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			--vRPclient.giveWeapons(source,{["WEAPON_RAYPISTOL"] = { ammo = 0 }})	
			--vRPclient.giveWeapons(source,{["WEAPON_FIREWORK"] = { ammo = 20 }})				
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 0 }})
			--vRPclient.giveWeapons(source,{["WEAPON_PISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_REVOLVER_MK2"] = { ammo = 250 }})		
			vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_PUMPSHOTGUN"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_APPISTOL"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_SPECIALCARBINE"] = { ammo = 250 }})
			--vRPclient.giveWeapons(source,{["WEAPON_HEAVYSNIPER_MK2"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_BZGAS"] = { ammo = 25 }})	
			vRPclient.setArmour(source,100)
		elseif args[1] == "limpar" and vRP.hasPermission(user_id,"admin.permissao") then
			vRPclient.giveWeapons(source,{},true)
			vRPclient.setArmour(source,0)
		elseif vRP.hasPermission(user_id,"polpar.permissao") then
			TriggerClientEvent("Notify",source,"negado","Armamento não encontrado.")
		end
	end
end)

RegisterCommand('preset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"polpar.permissao") then
		if args[1] then
			local custom = presets[tostring(args[1])]
			if custom then
				local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
				vRPclient._setCustomization(source,idle_copy)
			end
		else
			vRP.removeCloak(source)
		end
	end
end)