local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--local webhookanims = "https://discordapp.com/api/webhooks/754076815965945957/kPvpLsvh2bXq2p--mhJtlM4E9A0Fiywyjte_2-NyhyTsrSj7I_1A2kHGmIJ43UTCFgKR"
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e', function(source,args,rawCommand)
	TriggerClientEvent("emotes",source,args[1])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e2', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
            TriggerClientEvent("emotes",nplayer,args[1])
            SendWebhookMessage(webhookanims,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU A ANIMAÇÃO]: "..(args[1]).." \n[NO ID]: "..nplayer.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /beijar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("beijar",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
    if nplayer then
        local pedido = vRP.request(nplayer,"Deseja iniciar o beijo ?",10)
        if pedido then
            vRPclient.playAnim(source,true,{{"mp_ped_interaction","kisses_guy_a"}},false)    
            vRPclient.playAnim(nplayer,true,{{"mp_ped_interaction","kisses_guy_b"}},false)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PANO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)