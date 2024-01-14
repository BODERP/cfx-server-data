local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://discordapp.com/api/webhooks/744711344388833381/f__TcvrB3U3auiUTIxBufCbLf_SGJN3MZDu28KzLUZt1QrEnXA25HVBDwps52vdoAX4d"
local webhookfac = "https://discordapp.com/api/webhooks/744711303419133982/eH6OW5w0khKRjJ_q_VZpckkdPu1egjqHThzuc2gQguo8ZTtIXSPhYXlYfDO6hMuH6Ajb"
local webhookkeys = "https://discordapp.com/api/webhooks/744711268816126082/oaTqRolKYWexBdRoTaShiWaob7NcZ-z7yYqioWTCbe38RYGX6djVsv41EDo_2FrpvWie"
local webhookcds = "https://discordapp.com/api/webhooks/744711216836116604/R3mcBFjfJLzpymASBQos5Bredo9-wAHZCmgsqZytjOn0XBoOHcXeQPOaCCrVWuGLwRZ4"
local webhookblacklist = "https://discordapp.com/api/webhooks/744711044336975913/E9F2JZ4fp6HoIpWKrcaTvOxsAK70xERMnbGa2_i0Pt52OsOrz8rd3oPEo2hBeTBtvcn2"
-----
-- LOG ADMINISTRACAO
-----
local webhookvroupas = "https://discordapp.com/api/webhooks/752349021091266560/5WraFvtsQafp1lbq4EwYl-PsZLMQVvoxSMV9zK64wTS-wb5C4bDk6WSVX_S-sBLoXpUF"
--local webhookestoque = "https://discordapp.com/api/webhooks/752349449505996800/3xHXwav3VvmBFQxOKCauTFDCtXjK1llA-IG1MajV7cw-UupF9rq9CA30M474fMW1yiSc"
local webhookaddcar = "https://discordapp.com/api/webhooks/762313378940059648/OUzb4rG5Wp5OECDLd0tnVXmbkSuJNABaGYLY47Dn2XRdG3TlL9PjMsSLuqB0FJpikXPg"
local webhookremcar = "https://discordapp.com/api/webhooks/762313378940059648/OUzb4rG5Wp5OECDLd0tnVXmbkSuJNABaGYLY47Dn2XRdG3TlL9PjMsSLuqB0FJpikXP"
--local webhookuncuff = ""
--local webhooksyncarea = ""
--local webhookapagao = ""
--local webhookraios = ""
--local webhookskin = ""
local webhookdebug = "https://discordapp.com/api/webhooks/763471057616764958/elCHWPfxxs-qveK8-NEIvXZGhrOQIO_3GzWY3zN5YDvgqsBTQTAu9p6n5Ze3LfOqNaLl"
local webhookdv = "https://discordapp.com/api/webhooks/762312874433052702/x6u8viLbSHvnXCWCOwLrYG2yEPIpGZEKRYFmy8EdcYeTUhYjMYQjldRVbzoSKN5Nmadz"
local webhookfix = "https://discordapp.com/api/webhooks/762313378940059648/OUzb4rG5Wp5OECDLd0tnVXmbkSuJNABaGYLY47Dn2XRdG3TlL9PjMsSLuqB0FJpikXP"
local webhookgod = "https://discordapp.com/api/webhooks/762313951517343767/z5iEdjuBc1wW-HzRCRS59MMzzq8Hs8edj7VeXyuqO3lF4oT7itAUQW7NY2ep9es3VnG3"
local webhookgodall = "https://discordapp.com/api/webhooks/752357798427230220/Na13bY5PLT_msNxjrt61tAFyA9xq1kHXM7yPDM7vLB8P3uBnVsQOlD4wpw_PS1ZmXKFV"
local webhookhash = "https://discordapp.com/api/webhooks/752357842501238864/A0TWLdOBWbSCvst-UZu0z3mu2V-SBOe9es5BFM6s7uae9qAaewn6_lNbwb9vPVG7A-iG"
local webhooktuning = "https://discordapp.com/api/webhooks/762314157843808326/O_IzF7LL0IYEzh4QBPYJ3lOrM7hg9MP-QX7LWeZbRGTPrpJGAt-RkVSYAEDSX41n50AI"
local webhookwl = "https://discordapp.com/api/webhooks/762352026516455454/zUoRtWMrnq6WfeN26GKC5ZVWHnw0PHC-OYJgQtvbGyPkYBHiHjZy1hoTt8eGVaOjl5MP"
local webhookunwl = "https://discordapp.com/api/webhooks/762352122356039710/cSeZZzTDg_93ZOUAjikPrzv5sFvjPW9e8rJW-spMwyufYIqgBEAocyD8lbcmKR2Dolc-"
local webhookkick = "https://discordapp.com/api/webhooks/762352459032166410/YGFTwifc3ExqMrI5CcSYGrDpejpgJZb36NBjdajkYwIe7ME1KiqRdTs_OBr-Yzmj4KsO"
local webhookkickall = "https://discordapp.com/api/webhooks/752360186504806572/FnnIce6EltW_f8Kra2M2bIxRAMZFNLdcKinMNwzWZaURmFQ7nXj_-4O6VQumEpWaXxAE"
local webhookban = "https://discordapp.com/api/webhooks/762352563303350282/jS0mzN_TfPvpTbj88adnCvrFeS8sHfxFptbsx9buvnDCQr8_dQjzLA2lY-2yP0ZfIJZB"
local webhookunban = "https://discordapp.com/api/webhooks/762352651274158122/sa1_ruMPryAnKwCt4JlRbPdNK6eserv4l-MFeQDMvUKqka4pmStpwbE9cSEwBtHO-icy"
local webhookmoney = "https://discordapp.com/api/webhooks/762352743364821043/cgQJhbbRXAMwpJlyTjaZDLQNSExMOJyh4d6y9ubnwf5pKhLh19335jB9GS_ijEIhlHxz"
local webhooknc = "https://discordapp.com/api/webhooks/762353086575411225/I8d1HavFqSuSmQj0lu38JxGHHKVnxEX0c64VJVadOONRa04pIIoKx1UycV6hiRFREsxF"
local webhooktpcds = "https://discordapp.com/api/webhooks/762353173838299167/arnTAKz7PRe644jao083nghliT_raf8B0HhNVUvLPt3gPIV4sKZtqiHhNl2AXe0zpJfM"
--local webhookcds = ""
local webhookgroup = "https://discordapp.com/api/webhooks/762353286794969159/wSZkTRYQBU0Pq1bC8u3M3hwcASUp2Z3fXVTOO4I4WNTTfliOpZ5klhUIEXSes2mPZdgx"
local webhookungroup = "https://discordapp.com/api/webhooks/762353286794969159/wSZkTRYQBU0Pq1bC8u3M3hwcASUp2Z3fXVTOO4I4WNTTfliOpZ5klhUIEXSes2mPZdgx"
local webhooktptome = "https://discordapp.com/api/webhooks/762353555750256671/QpKelMrm8hfTNrm1Y72_iVorsst8zeokPs_kY5SLho19VqHl9FIpV6CCcqVk5e6Ol0C5"
local webhooktpto = "https://discordapp.com/api/webhooks/762353555750256671/QpKelMrm8hfTNrm1Y72_iVorsst8zeokPs_kY5SLho19VqHl9FIpV6CCcqVk5e6Ol0C5"
local webhooktpway = "https://discordapp.com/api/webhooks/762353555750256671/QpKelMrm8hfTNrm1Y72_iVorsst8zeokPs_kY5SLho19VqHl9FIpV6CCcqVk5e6Ol0C5"
local webhookcar = "https://discordapp.com/api/webhooks/762353790954504213/TBBomZdhsIgRBL6aDDJ3Zv9RF0-7gbtmXfIL1cliTiGfBi4UsXuh_jN7C0iwuq4Ps5Sx"
--local webhookdelnpcs = ""
local webhookadm = "https://discordapp.com/api/webhooks/762353923658088468/nCESmKtFxj_jNvgLK07mk0laZLeKNlYFN049qn-7rDgO9ES_C8CiaU8wKafbLnGAAJ_Y"
local webhookplayers = "https://discordapp.com/api/webhooks/752359183185346603/FYEu4FX14Z2BrTfS_HWjMjTSIrvu4fwFadYiKbOBtFEPwsXZLwJUvFUBse9tKpG196w8"
local webhookkill = "https://discordapp.com/api/webhooks/762354125086130186/SNrI78t8iBSKg3bTZjX3EzfBxMEUYnEcNl74PnehT4_4a6gOFavqVwBsamKto9ep5MnL"
--local webhookfesta = "https://discordapp.com/api/webhooks/752359257567133696/yLU17brOlxa1_drvYg1RgxPllWVgzkd-TN8ABWrHzIgz03eIx6oC7UawYayCz8WinPO5"
--local webhookconvidar = "https://discordapp.com/api/webhooks/752356648101871663/5Xi9OU0WxkmVXFmg70xzr9x7HRDlKk69aBDnIPE9qqlE-WALXuCLoUCPjzbQDc3Vghpg"
--local webhookcarcolor = ""
--local webhookfestinha = "https://discordapp.com/api/webhooks/762353923658088468/nCESmKtFxj_jNvgLK07mk0laZLeKNlYFN049qn-7rDgO9ES_C8CiaU8wKafbLnGAAJ_Y"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent("adminLogs:Armamentos")
AddEventHandler("adminLogs:Armamentos",function(weapon)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
    	SendWebhookMessage(webhookblacklist,"```prolog\n[BLACKLIST ARMAS]: "..user_id.." " .. "\n[ARMA]: " .. weapon ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&641048265856647169>")  
    end
end)
----------------------------------------------------------------------------------------------------------------
-- RENAME
----------------------------------------------------------------------------------------------------------------
RegisterCommand('rename',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id, "admin.permissao") --[[or vRP.hasPermission(user_id, "mod.permissao")]] then
        local idjogador = vRP.prompt(source, "PASSAPORTE: ", "")
        local nome = vRP.prompt(source, "NOVO NOME: ", "")
        local firstname = vRP.prompt(source, "NOVO SOBRENOME: ", "")
        local idade = vRP.prompt(source, "NOVA IDADE: ", "")
        local nplayer = vRP.getUserSource(parseInt(idjogador))

        if nplayer then

            local identity = vRP.getUserIdentity(parseInt(idjogador))
            if idjogador == "" or nome == "" or firstname == "" or idade == "" then
                   return
               else
				vRP.execute("vRP/update_user_identity",{ user_id = idjogador, firstname = firstname, name = nome, age = idade, registration = identity.registration, phone = identity.phone })
				SendWebhookMessage(webhookhash,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RENOMEOU]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                TriggerClientEvent("Notify",nplayer,"sucesso","Identidade atualizada!")
                TriggerClientEvent("Notify",source,"sucesso","Identidade do ID: <b>"..parseInt(idjogador).."</b> alterada com sucesso!")
            end

        else
            TriggerClientEvent("Notify",source,"negado","O ID: <b>"..parseInt(idjogador).."</b> n�o est� na cidade!")
        end        
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local custom = vRPclient.getCustomization(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
			vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
			SendWebhookMessage(webhookvroupas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU /VROUPAS]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Blips
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        blips[source] = { source }
       TriggerClientEvent("blips:updateBlips",-1,blips)
        if vRP.hasPermission(user_id,"blips.permissao") then
            TriggerClientEvent("blips:adminStart",source)
        end
     end
 end)

AddEventHandler("playerDropped",function()
	if blips[source] then
		blips[source] = nil
		TriggerClientEvent("blips:updateBlips",-1,blips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('estoque',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
			vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
			SendWebhookMessage(webhookestoque,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[AUMENTOU ESTOQUE DO:]"..args[1].." \n[PARA:]"..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.")
        end
    end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------
-- ADD CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) }) 
            --vRP.execute("creative/set_ipva",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(webhookaddcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU]: "..args[1].." \n[PARA O ID]: "..(args[2]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.") 
			SendWebhookMessage(webhookremcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[DO ID]: "..(args[2]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('estoque',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
			vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
			SendWebhookMessage(webhookestoque,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[AUMENTOU ESTOQUE DO]: "..args[1].." \n[PARA]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o veículo <b>"..args[1].."</b>.") 
        end
    end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"limparinv.permissao") then
		vRP.clearInventory(user_id)
		SendWebhookMessage(webhookestoque,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[LIMPOU INVENTARIO] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        TriggerClientEvent("Notify",source,"importante","Seu <b>inventario</b> foi limpo!")
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UNCUFF
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("admcuff",source)
			SendWebhookMessage(webhookuncuff,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SE DESALGEMOU]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUEL
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('admfuel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("admfuel",source)
		end	
	end
end)]]
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SYNCAREA
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"polpar.permissao") then
		TriggerClientEvent("syncarea",-1,x,y,z)
		SendWebhookMessage(webhooksyncarea,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[LIMPOU A ÁREA]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APAGAO
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('apagao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"admin.permissao") and args[1] ~= nil then
            local cond = tonumber(args[1])
            --TriggerEvent("cloud:setApagao",cond)
			TriggerClientEvent("cloud:setApagao",-1,cond)    
			SendWebhookMessage(webhookapagao,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CAUSOU UM APAGÃO]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")                
        end
    end
end)]]
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RAIOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('raios', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"admin.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
			TriggerClientEvent("cloud:raios",-1,vezes)    
			SendWebhookMessage(webhookraios,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CAUSOU RAIOS "..vezes.."X VEZES]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR SEXO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id,"mod.permissao")]] then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
				TriggerClientEvent("skinmenu",nplayer,args[2])
				SendWebhookMessage(webhookskin,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TROCOU DE SKIN PARA]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
            end
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("ToggleDebug",player)
			SendWebhookMessage(webhookdebug,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU /DEBUG] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[Combustível
------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gas',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if (vRP.hasPermission(user_id,"admin.permissao")) then
			TriggerClientEvent("admfuel",player)
			TriggerClientEvent("Notify",source,"sucesso","Tanque cheio")
		end
	end
end)]]--
-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then 
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('deletarveiculo',source,vehicle)
			SendWebhookMessage(webhookdv,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU DV NO CARRO]: "..source.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id,"mod.permissao")]] then
			TriggerClientEvent('reparar',source)
			SendWebhookMessage(webhookfix,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FIXOU O CARRO]: "..vehicle.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id, "mod.permissao")]] then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,400)
				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookgod,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU GOD EM]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		else
			vRPclient.killGod(source)
			vRPclient.setHealth(source,400)
			vRPclient.setArmour(source,100)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
			local identity = vRP.getUserIdentity(user_id)
			SendWebhookMessage(webhookgod,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU GOD EM SÍ MESMO] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				print(id)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookgodall,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU GOD EM TODOS]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)--SendWebhookMessage(webhookhash,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU /HASH]"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id,"mod.permissao")]] then
		TriggerClientEvent('vehtuning',source)
		SendWebhookMessage(webhooktuning,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU TUNING]: "..source.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] or vRP.hasPermission(user_id,"mod.permissao") then
        if args[1] then
            vRP.setWhitelisted(parseInt(args[1]),true)
            TriggerClientEvent("Notify",source,"sucesso","Voce aprovou o passaporte <b>"..args[1].."</b> na whitelist.")
            SendWebhookMessage(webhookwl,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] or vRP.hasPermission(user_id,"mod.permissao")  then
		if args[1] then
			vRP.setWhitelisted(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce retirou o passaporte <b>"..args[1].."</b> da whitelist.")
			SendWebhookMessage(webhookunwl,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
				vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
				SendWebhookMessage(webhookkick,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[KICKOU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kickall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				vRP.kick(id,"Você foi vitima do terremoto.")
				SendWebhookMessage(webhookkick,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU KICK EM TODOS] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),true)
			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[BANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] then
		if args[1] then
			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
			SendWebhookMessage(webhookunban,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESBANIU]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))
			SendWebhookMessage(webhookmoney,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FEZ]: $"..vRP.format(parseInt(args[1])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		vRPclient.toggleNoclip(source)
		SendWebhookMessage(webhooknc,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU NC]" ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
		SendWebhookMessage(webhooktpcds,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU TELEPORT PARA]: "..coords[1].." "..coords[2].." "..coords[3].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS NA TELA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
		SendWebhookMessage(webhookcds,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MOSTROU A COORDENADA]: "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FESTINHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(1000,function()
			vRPclient.removeDiv(-1,"festinha")
			SendWebhookMessage(webhookfestinha,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MANDOU NO FESTINHA]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsh',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		local lugar = vRP.prompt(source,"Lugar:","")
		if lugar == "" then
			return
		end
	    SendWebhookMessage(webhookcds,"```prolog\n[PASSAPORTE]: "..user_id.." \n[LUGAR]: "..lugar.." \n[CDSH]: ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z)..", ['name'] = "..lugar..", \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS CORRIDAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("cds:corridas")
AddEventHandler("cds:corridas",function()
local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		SendWebhookMessage(webhookcds,"```prolog\n[] = { ['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z).." }, \r```")
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookgroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SETOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") --[[or vRP.hasPermission(user_id,"suporte.permissao")]] then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
			SendWebhookMessage(webhookungroup,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
				SendWebhookMessage(webhooktptome,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TELEPORTOU PARA SÍ]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
				SendWebhookMessage(webhooktpto,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TELEPORTOU PARA O ID]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		TriggerClientEvent('tptoway',source)
		SendWebhookMessage(webhooktpway,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TELEPORTOU PARA SUA MARCAÇÃO] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
			SendWebhookMessage(webhookcar,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[SPAWNOU]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
---------------------------------------------------------------------------------------------
-- RESET
---------------------------------------------------------------------------------------------
RegisterCommand('reset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if vRP.hasPermission(user_id,"admin.permissao")  then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                local id = vRP.getUserId(nplayer)
                if id then
					vRP.setUData(id,"vRP:spawnController",json.encode(1))
					SendWebhookMessage(webhookreset,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RESETOU APARENCIA]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                    TriggerClientEvent("Notify",user_id,"sucesso","Você <b>resetou</b> o personagem do passaporte <b>"..vRP.format(parseInt(args[1])).."</b>.",5000)
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao")  or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		vRP.clearInventory(user_id)
		SendWebhookMessage(webhookreset,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[LIMPOU INVENTARIO]: "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        TriggerClientEvent("Notify",source,"importante","Seu <b>inventario</b> foi limpo!")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('delnpcs',source)
		SendWebhookMessage(webhookdelnpcs,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DELETOU NPCS] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end
		SendWebhookMessage(webhookadm,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MENSAGEM]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60000,function()
			vRPclient.removeDiv(-1,"anuncio")
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Festinha
------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
            return
		end
		SendWebhookMessage(webhookfestinha,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MENSAGEM]: "..mensagem.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(7000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('status',function(source,args,rawCommand)
    --local onlinePlayers = GetNumPlayerIndices()
    local policia = vRP.getUsersByPermission("policia.permissao")
    local paramedico = vRP.getUsersByPermission("paramedico.permissao")
    local mec = vRP.getUsersByPermission("mecanico.permissao")
    --local staff = vRP.getUsersByPermission("admin.permissao")
    --local ilegal = vRP.getUsersByPermission("ilegal.permissao")
    local user_id = vRP.getUserId(source)        
        TriggerClientEvent("Notify",source,"importante","<b>Policiais</b>: "..#policia.."<br><b>Paramédicos</b>: "..#paramedico.."<br><b>Mecânicos</b>: "..#mec.."",5000)
    end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('players',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
        local users = vRP.getUsers()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,1},quantidade)
		TriggerClientEvent('chatMessage',source,"ID's ONLINE: ",{255,160,1},players)
		SendWebhookMessage(webhookplayers,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DEU /PLAYERS] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- kill
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.setHealth(nplayer,0)
				TriggerClientEvent("Notify", source, "sucesso", "Você matou o ID: "..parseInt(args[1]))
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookkill,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MATOU ID:]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		else
			vRPclient.setHealth(source,0)
			vRPclient.setArmour2(source,0)
			TriggerClientEvent("Notify", source, "sucesso", "Você se matou")
			local identity = vRP.getUserIdentity(user_id)
			SendWebhookMessage(webhookkill,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MATOU ID:]: "..source.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR cor
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carcolor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        if vehicle then
            local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
            rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
            local r,g,b = table.unpack(splitString(rgb," "))
            TriggerClientEvent('vcolorv',source,vehicle,tonumber(r),tonumber(g),tonumber(b))
            SendWebhookMessage(webhookcarcolor,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[MUDOU A COR DO CARRO]: "..vehicle.." \n[PARA]: "..rgb.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Cor ^1alterada")
        end
    end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- importa os Tunneis e Proxys
-----------------------------------------------------------------------------------------------------------------------------------------	
IDDclient = Tunnel.getInterface("vrp_admin_ids")
vRPclient = Tunnel.getInterface("vRP")
vRPidd = {}
Tunnel.bindInterface("vrp_admin_ids",vRPidd)
Proxy.addInterface("vrp_admin_ids",vRPidd)
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- Retorna a permissao pro client
-----------------------------------------------------------------------------------------------------------------------------------------	
function vRPidd.getPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Retorna o ID pro Client
-----------------------------------------------------------------------------------------------------------------------------------------	
function vRPidd.getId(sourceplayer)
	local user_id = vRP.getUserId(sourceplayer)
	return user_id
end