local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')

vRP = Proxy.getInterface('vRP')

lcSERVER = {}
Tunnel.bindInterface('emp_lc', lcSERVER)

lcCLIENT = Tunnel.getInterface('emp_lc')

--vRPclient = Tunnel.getInterface("vRP")
local blips = {}
----------------------------------------------------------------------------------------------------------

RegisterServerEvent('emp_lc:ChamadoPolicial')
AddEventHandler('emp_lc:ChamadoPolicial', function (message, coords)
  local source = source
  local user_id = vRP.getUserId(source)
  local policia = vRP.getUsersByPermission("pgeral.permissao")
  for l,w in pairs(policia) do
  if user_id then
    local player = vRP.getUserSource(parseInt(w))

    --blips = vRPclient.addBlip(player,256.136,215.53,106.28,1,59,"Roubo em andamento",0.5,true)
    blips = lcCLIENT.addBlip(player,256.136,215.53,106.28,1,59,"Roubo em andamento",0.5,true)

    TriggerClientEvent('chatMessage',player,"190",{65,130,255},"(COPOM) Um veículo de alto valor acaba de ser roubado, intercepte o assaltante localizando o rastreador!")
    SetTimeout(60000,function() lcCLIENT.removeBlip(player, blips) end)
  end
end
end)

----------------------------------------------------------------------------------------------

-- CONFIG
local cPermission = 'desmanche.permissao' -- Permissao para roubar / Permission to start
local cCopPermission = 'pgeral.permissao' -- Permissao dos policias / Cop's permission
local cCops = 0--3 -- Quantidade de policias para iniciar o roubo / Minimum quantity of cops to start
local cGlobalRadar = true -- Mostrar o rastreador para todos do servidor / Show vehicle's tracker to every player
local cSeconds = 180 --300 Segundos para desabilitar o rastreador / Seconds to turn the tracker off
local cCooldownSeconds = 500 -- Segundos para poder iniciar o roubo apos termino / Seconds to be able to do it again after it has ended
local cRandomizeSeconds = 15 * 60 -- Segundos para randomizar os veiculos / Seconds to randomize the vehicles
local cVehicles = {
    [1] = {'exemplar', 'Exemplar', 12473},
    [2] = {'cheetah', 'Cheetah', 12398},
    [3] = {'infernus', 'Infernus', 13986},
    [4] = {'vacca', 'Vacca', 11543},
    [5] = {'t20', 'Protgen T20', 10293},
    [6] = {'schafter2', 'Schafter2', 11012},
    [7] = {'zentorno', 'Zentorno', 10475},
    [8] = {'f620', 'f620', 9018},
}

-- USER/SERVER ONLY
local varUserID
local varSeconds = 0
local varCooldownSeconds = 0
local varRandomizeSeconds = 0
local varSelectedIndex

-- GLOBAL
local gVehicleNetID

function lcSERVER.GetSeconds()
    return varSeconds
end

function lcSERVER.GetCooldownSeconds()
    return varCooldownSeconds
end

function lcSERVER.GetVehicles()
    return cVehicles
end

function lcSERVER.End()
    newCooldownSecondsCountdown()
    varUserID = nil
    varSeconds = 0
    varSelectedIndex = nil
end

function lcSERVER.ClearGlobalVehicleNetID()
    if varUserID ~= vRP.getUserId(source) and varSeconds > 0 then
        return false
    end

    newCooldownSecondsCountdown()
    lcCLIENT.ClearGlobalVehicleNetID(-1)
end

function lcSERVER.SetGlobalVehicleNetID(value)
    gVehicleNetID = value

    varUserID = vRP.getUserId(source)

    if cGlobalRadar then
        lcCLIENT.SetGlobalVehicleNetID(-1, gVehicleNetID)
    else
        lcCLIENT.SetGlobalVehicleNetID(source, gVehicleNetID)
        for k, v in pairs(vRP.getUsersByPermission(cCopPermission)) do
            lcCLIENT.SetGlobalVehicleNetID(v, gVehicleNetID)
        end
    end
end

function lcSERVER.GetGlobalVehicleNetID()
    return gVehicleNetID
end

function lcSERVER.HasPermission()
    local user_id = vRP.getUserSource(source)

    if vRP.hasPermission(user_id, cCopPermission) then
        lcCLIENT.Notification(source, '~r~Policiais não possuem permissão/autorização para realizar esta ação.')
        return false
    end

    if cPermission ~= '' and vRP.hasPermission(user_id, cPermission) then
        lcCLIENT.Notification(source, '~r~Você não tem permissão para fazer isso.')
        return false
    end

    if #vRP.getUsersByPermission(cCopPermission) < cCops then
        lcCLIENT.Notification(source, '~r~O número de policiais é insuficiente, para realizar esta ação.')
        return false
    end

    if varSeconds > 0 then
        lcCLIENT.Notification(source, '~r~Você deve aguardar a entrega atual acabar.')
        return false
    end

    if varCooldownSeconds > 0 then
        lcCLIENT.Notification(source, '~r~Não temos nada para você no momento! Aguarde ~o~' .. varCooldownSeconds .. ' ~r~segundos.')
        return false
    end

    return true
end

function lcSERVER.Start(index, netid)
    varSelectedIndex = index
    lcSERVER.SetGlobalVehicleNetID(netid)

    newSecondsCountdown()
    return true
end

function lcSERVER.StartDelivery(index)
    if varUserID ~= vRP.getUserId(source) then
        return false
    end

    if varSeconds > 0 then
        return false
    end

    varSelectedIndex = index
    lcSERVER.ClearGlobalVehicleNetID()
    return true
end

function lcSERVER.GetPayment()
    if varUserID ~= vRP.getUserId(source) then
        return false
    end

    vRP.giveInventoryItem(vRP.getUserId(source), 'dinheirosujo', cVehicles[varSelectedIndex][3])
    lcCLIENT.Notification(source, '+ ~g~R$' .. vRP.format(cVehicles[varSelectedIndex][3]) .. ' sujo')
    return true
end

local function RandomizeVehicles()
    varRandomizeSeconds = cRandomizeSeconds
    local old = cVehicles
    cVehicles = {}

    for i = 1, #old do
        local rndindex = math.random(#old)

        while cVehicles[rndindex] ~= nil do
            rndindex = math.random(#old)
        end

        cVehicles[rndindex] = old[rndindex]
    end
end

Citizen.CreateThread(
    function()
        -- Initialize on resource start
        Citizen.Wait(1000) -- Wait for lcCLIENT to load resource
        lcCLIENT.SetVehicles(-1, lcSERVER.GetVehicles()) -- Update lcCLIENT's vehicles
        while true do
            Citizen.Wait(1000)

            if varRandomizeSeconds > 0 then
                varRandomizeSeconds = varRandomizeSeconds - 1
            end

            if varRandomizeSeconds <= 0 and varUserID == nil then
                RandomizeVehicles()
            end
        end
    end
)

function newSecondsCountdown()
    Citizen.CreateThread(
        function()
            varSeconds = cSeconds
            while true do
                Citizen.Wait(1000)
                varSeconds = varSeconds - 1

                if varSeconds <= 0 then
                    break
                end
            end
        end
    )
end

function newCooldownSecondsCountdown()
    Citizen.CreateThread(
        function()
            varCooldownSeconds = cCooldownSeconds
            while true do
                Citizen.Wait(1000)
                varCooldownSeconds = varCooldownSeconds - 1

                if varCooldownSeconds <= 0 then
                    break
                end
            end
        end
    )
end

AddEventHandler(
    'vRP:playerSpawn',
    function(user_id, source, first_spawn)
        if first_spawn then
            lcCLIENT.SetVehicles(source, lcSERVER.GetVehicles())
        end
    end
)