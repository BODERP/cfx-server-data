-- Trigueiro

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

func = Tunnel.getInterface("vrp_elevadorlavagem")


-- CHAMAR func.abrirmenu()

--[[local x = -1097.0063476563
local y = -847.57476806641
local z = 19.001440048218]]

--Coordenadas da entrada do Mazebank -70.81,-800.74,44.23
local x = -70.81
local y = -800.74
local z = 44.23

-- Entrar no escritório
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-70.81,-800.74,44.23,true)
        if distance <= 3 then
            --DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
            if IsControlJustPressed(0,51) then 
                TriggerServerEvent("elevadorlavagem")
            end  
        end
	end
end)

-- Sair do escritório
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-75.64,-827.15,243.39,true)
        if distance <= 3 then
            --DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
            if IsControlJustPressed(0,51) then 
                TriggerServerEvent("elevadorlavagem")
            end  
        end
    end
end)


