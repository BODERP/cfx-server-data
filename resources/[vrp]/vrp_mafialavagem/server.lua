local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("vrp_lavagem",emP)
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR DINHEIRO SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkDinheiro()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.") 
			return false
		end
	end
end

function emP.checkPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    local policia = vRP.getUsersByPermission("policia.permissao")
    if user_id then
        random = math.random(40,60)
        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then
            if #policia == 0 then
                vRP.giveMoney(user_id,parseInt(10000*("0."..random)))
               -- vRP.giveInventoryItem(user_id,"logsinvasao",1)
            else 
                vRP.giveMoney(user_id,parseInt(10000*("0."..random))+(#policia*200))
               -- vRP.giveInventoryItem(user_id,"logsinvasao",1)

            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAMANDO POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.lavagemPolicia(id,x,y,z,head)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
			TriggerClientEvent('iniciandolavagem',source,head,x,y,z)
			vRPclient._playAnim(source,false,{{"anim@heists@prison_heistig1_p1_guard_checks_bus","loop"}},true)
			local random = math.random(100)
			if random >= 30 then
				vRPclient.setStandBY(source,parseInt(60))
				for l,w in pairs(policia) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						async(function()
							local ids = idgens:gen()
							blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Ocorrencia",0.5,true)
							TriggerClientEvent('chatMessage',player,"911",{64,64,255},"^1Lavagem^0 de dinheiro em andamento.")
							SetTimeout(5000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
						end)
					end
				end
			end	
		end
	end