-- Trigueiro

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_elevador",func)
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent("elevador")
AddEventHandler("elevador", function()
    local source = source
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
    if user_id then
        local menu = {name="ELEVADOR", css={top="75px",header_color="rgba(42, 112, 190, 0.8)"}}
        menu["ANDAR -1"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1096.4714355469,-849.85949707031,4.8841781616211)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)

        menu["ANDAR -2"] = {function(player,choice)       
            if user_id then
               -- TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1095.8375244141,-851.00842285156,10.27662563324)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu) 

        menu["ANDAR -3"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1096.2438964844,-850.28997802734,13.687377929688)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu) 

        menu["ANDAR 1"] = {function(player,choice)       
            if user_id then
               --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1096.2032470703,-850.23126220703,19.001211166382)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)

        menu["ANDAR 2"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1095.9049072266,-850.28167724609,23.038635253906)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)

		menu["ANDAR 3"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1096.3288574219,-850.80749511719,26.827583312988)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)   

        menu["ANDAR 4"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1095.7860107422,-850.15930175781,30.757162094116)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)

        menu["ANDAR 5"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1096.0079345703,-850.57739257813,34.360740661621)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)  

        menu["HELIPONTO"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-1095.8020019531,-850.17749023438,38.243240356445)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)   

                
    end
end)
