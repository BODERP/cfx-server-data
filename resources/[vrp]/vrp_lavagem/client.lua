local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
emP = Tunnel.getInterface("emp_lavardinheirosujo",lav)
vRP = Proxy.getInterface("vRP")
----------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CORDENADAS DA LAVAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
local vacas = {
    {-65.58,-816.3,243.39} -- Notebook da esquerda no Mazebank
    --{-80.52,-801.62,243.41} -- Mesa do chefe no Mazebank
}

RegisterNetEvent("global:loadJob")
AddEventHandler("global:loadJob",
                function() if emP.checkPermission() then init() end end)

Citizen.CreateThread(function() if emP.checkPermission() then init() end end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO 
-----------------------------------------------------------------------------------------------------------------------------------------
function init()
    local time = 1
    
    while true do
        Citizen.Wait(time)
        if not processo then
            for _, func in pairs(vacas) do
                local ped = PlayerPedId()
                local x, y, z = table.unpack(func)
                local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
                if distancia < 30 then
                    time = 1
                    if distancia <= 1 then
                        --DrawText3Ds(x, y, z,"PRESSIONE  ~y~E~w~  PARA LAVAR O DINHEIRO")
                        drawTxt("PRESSIONE  ~r~E~w~  PARA LAVAR DINHEIRO",4,0.5,0.90,0.50,255,255,255,200)
                        DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
                        if IsControlJustPressed(0, 38) then
                            if emP.checkPayment() then
                                processo = true
                                TriggerEvent("animacao", true)
                                TriggerEvent("progress", 20000,"LAVANDO DINHEIRO")
                                Citizen.Wait(20000)
                                TriggerEvent("animacao", false)
                                TriggerEvent("Notify", "sucesso","Dinheiro lavado com Sucesso")
                                processo = false
                            end
                        end
                    end
                else
                    time = 20000
                end
            end
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

AddEventHandler('animacao', function(isPlay)
    if isPlay then
        TriggerEvent('cancelando', true)
        vRP._playAnim(false, {
            {"anim@heists@prison_heistig1_p1_guard_checks_bus", "idle_a_female"} -- era amb@prop_human_parking_meter@female@idle_a
        }, true)
    else
        TriggerEvent('cancelando', false)
        ClearPedTasks(PlayerPedId())
    end
end)