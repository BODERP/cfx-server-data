-- Trigueiro

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_elevadorlavagem",func)
vRPclient = Tunnel.getInterface("vRP")

--[[function emP.checkPermission()
    local source = source
    local user_id = vRP.getUserId(source)
    return (vRP.hasPermission(user_id, "lavagem.permissao") or vRP.hasPermission(user_id, "conce.permissao"))
end]]

RegisterServerEvent("elevadorlavagem")
AddEventHandler("elevadorlavagem", function()
    local source = source
    local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)
    if user_id and vRP.hasPermission(user_id,"lavagem.permissao") then
        local menu = {name="ELEVADOR", css={top="75px",header_color="rgba(42, 112, 190, 0.8)"}}
        menu["Escritório"] = {function(player,choice)       
            if user_id then
                --TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- COORDENADA QUE VC IRÁ SE TELEPORTAR - INTERIOR DO ESCRITÓRIO -75.64,-827.15,243.39
                vRPclient.teleport(source,-75.64,-827.15,243.39)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu)

        menu["Térreo"] = {function(player,choice)       
            if user_id then
               -- TriggerClientEvent("progress",source,5000,"Destrancando portas")
                --Citizen.Wait(5000)
                -- CORD QUE VC IRÁ SE TELEPORTAR
                vRPclient.teleport(source,-70.81,-800.74,44.23)
            end
            vRP.closeMenu(player)       
        end,""}
        vRP.openMenu(player,menu) 
    end
end)
