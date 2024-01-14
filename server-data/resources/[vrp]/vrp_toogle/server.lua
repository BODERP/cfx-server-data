local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
--[[local webhookarmaadm = "https://discordapp.com/api/webhooks/762355196042018817/7GHnKEXcyGhTxO6CXwh0v6A2wEoMSDLMk9vZ0WyZL5RAIVYvCJ581UT-I88eMOGanibC"
local webhookprender = "https://discordapp.com/api/webhooks/764907654551306250/E-CqmP908CLOv-OJ3vhXyfwLr8EGIzcrovgohGvF9gko01b0pg9Sp_vS2N1Ze51SgaCK"
local webhookmultas = "https://discordapp.com/api/webhooks/764908033422655548/DyltYYuxpgVm4rFYiFfED13LJhlvcMIP-XCwcztJKNeosFkNdWTXvmRWcyDVTwbgtcls"
local webhookocorrencias = "https://discordapp.com/api/webhooks/744707429039734815/l0KgvajmoETplIRnupGqPe5Dsgoo8agN0lp1fCn0Wfr7pmqd9rhyCXdlZ1no0D6Veab9"
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
end]]--

-----------------------------------------------------------------------------------------------------------------------------------------
-- TOOGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ponto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	------------------------------------------------------------------------------------------------------------------------------------------
	-- LIXEIRO --------------------------------------------------------------------------------------------------------------------------
	if vRP.hasPermission(user_id,"lixeiro.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaLixeiro")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[LIXEIRO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"lixeiro.folga") then
		TriggerEvent('eblips:add',{ name = "Lixeiro", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"Lixeiro")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[LIXEIRO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------------
	  -- LIXEIRO ILEGAL --------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"lixeiro.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaLixeiroIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"lixeiro.folga") then
		TriggerEvent('eblips:add',{ name = "LixeiroIlegal", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"LixeiroIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CHEFE LIXEIRO -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"chefelixeiro.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaChefeLixeiro")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CHEFE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"chefelixeiro.folga") then
		TriggerEvent('eblips:add',{ name = "ChefeLixeiro", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"ChefeLixeiro")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CHEFE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	------------------------------------------------------------------------------------------------------------------------------------------
	-- CONVENCIONAL --------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"convencional.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaConvencional")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"convencional.folga") then
		TriggerEvent('eblips:add',{ name = "TaxistaConvencional", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"TaxistaConvencional")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ------------------------------------------------------------------------------------------------------------------------------------------
	  -- CONVENCIONAL ILEGAL --------------------------------------------------------------------------------------------------------------------------
	elseif vRP.hasPermission(user_id,"convencional.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaConvencionalIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)

	elseif vRP.hasPermission(user_id,"convencional.folga") then
		TriggerEvent('eblips:add',{ name = "TaxistaConvencionalIlegal", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"TaxistaConvencionalIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CONVENCIONAL]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ---------------------------------------------------------------------------------------------------------------------------------------
	  -- EXECUTIVO --------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"executivo.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaExecutivo")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[EXECUTIVO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"executivo.folga") then
		TriggerEvent('eblips:add',{ name = "TaxistaExecutivo", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"TaxistaExecutivo")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[EXECUTIVO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  ---------------------------------------------------------------------------------------------------------------------------------------
	  -- EXECUTIVO ILEGAL --------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"executivoi.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaExecutivoIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[EXECUTIVO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"executivoi.folga") then
		TriggerEvent('eblips:add',{ name = "TaxistaExecutivoIlegal", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"TaxistaExecutivoIlegal")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[EXECUTIVO]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	  -------------------------------------------------------------------------------------------------------------------------------------
	  -- CHEFE TAXISTAS -------------------------------------------------------------------------------------------------------------------------
    elseif vRP.hasPermission(user_id,"chefetaxistas.servico") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"PaisanaChefeTaxista")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"aviso","Você saiu de serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CHEFE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → SAIU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent('desligarRadios',source)
	
	elseif vRP.hasPermission(user_id,"chefetaxistas.folga") then
		TriggerEvent('eblips:add',{ name = "ChefeTaxistas", src = source, color = 47 })-- Talvez dê problema nessa linha
		vRP.addUserGroup(user_id,"ChefeTaxistas")-- Talvez dê problema nessa linha
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.")
		SendWebhookMessage(webhookponto,"```prolog\n[CHEFE]: » "..user_id.." "..identity.name.." "..identity.firstname.." \n[PONTO]: → ENTROU "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
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
	end
end)