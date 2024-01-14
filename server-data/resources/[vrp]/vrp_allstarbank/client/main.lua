local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_allstarbank")

-- Display Map Blips
--[[Citizen.CreateThread(
  function()
    for k, v in ipairs(Config.Banks) do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
)]]

-- NUI Variables
local atBank = false
local atATM = false
local bankOpen = false
local atmOpen = false

local hora = 0
function CalculateTimeToDisplay()
  hora = GetClockHours()
  if hora <= 9 then
    hora = "0" .. hora
  end
end

-- Open Gui and Focus NUI
function openGui()
  CalculateTimeToDisplay()
  if parseInt(hora) >= 00 and parseInt(hora) <= 23 then  --if parseInt(hora) >= 07 and parseInt(hora) <= 17 then
      SetNuiFocus(true, true)
      SendNUIMessage({open = true})
  else
      TriggerEvent("Notify","importante","Funcionamento dos bancos é das <b>07:00</b> as <b>18:00</b>.") 
  end    
end

-- Close Gui and disable NUI
function closeGui()
  if bankOpen or atmOpen then 
    SetNuiFocus(false)
    SendNUIMessage({close = true})
    bankOpen = false
    atmOpen = false
  end
end

if true then
  Citizen.CreateThread(
    function()
      while true do
        Citizen.Wait(0)
        if (IsNearBank() or IsNearATM()) then
          if (atBank == false) then
            TriggerEvent("Notify","aviso","Pressione E para acessar o banco.")
          end
          atBank = true
          if IsControlJustPressed(1, 51) then
            if (IsInVehicle()) then
              TriggerEvent("Notify","aviso","Não pode ser usado no veiculo.")
            else
              if bankOpen then
                closeGui()
                bankOpen = false
              else
                openGui()
                bankOpen = true
              end
            end
          end
        else
          if (atmOpen or bankOpen) then
            closeGui()
          end
          atBank = false
          atmOpen = false
          bankOpen = false
        end
      end
    end
  )
end

Citizen.CreateThread(
  function()
    while true do
      if bankOpen or atmOpen then
        local ply = GetPlayerPed(-1)
        local active = true
        DisableControlAction(0, 1, active)
        DisableControlAction(0, 2, active)
        DisableControlAction(0, 24, active)
        DisablePlayerFiring(ply, true)
        DisableControlAction(0, 142, active)
        DisableControlAction(0, 106, active)
      end
      Citizen.Wait(0)
    end
  end
)

function IsNearATM()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(Config.Atms) do
    local distance =
      GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 3) then
      return true
    end
  end
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function IsNearBank()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(Config.Banks) do
    local distance =
      GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 3) then
      return true
    end
  end
end

function IsNearPlayer(player)
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance =
    GetDistanceBetweenCoords(
    ply2Coords["x"],
    ply2Coords["y"],
    ply2Coords["z"],
    plyCoords["x"],
    plyCoords["y"],
    plyCoords["z"],
    true
  )
  if (distance <= 5) then
    return true
  end
end

function notification(title, description, type, returnHome)
  if returnHome == true then
    SendNUIMessage({open = true})
  end
  SendNUIMessage(
    {
      notification = true,
      notification_title = title,
      notification_desc = description,
      notification_type = type
    }
  )
end

RegisterNUICallback("close", function(data)
  closeGui()
end)

RegisterNUICallback("openBalance", function(data)
  TriggerServerEvent("vrp_allstarbank:openBalance1461")
end)

RegisterNUICallback("depositMoney", function(data)
  TriggerServerEvent("vrp_allstarbank:depositMoney1461", data.amount)
end)

RegisterNUICallback("withdrawMoney", function(data)
  TriggerServerEvent("vrp_allstarbank:withdrawMoney1461", data.amount)
end)

RegisterNUICallback("showName", function(data)
  TriggerServerEvent("vrp_allstarbank:showName1461")
end)

RegisterNUICallback("transferMoney", function(data)
  TriggerServerEvent("vrp_allstarbank:transferMoney1461", tonumber(data.userid), tonumber(data.amount))
end)

RegisterNetEvent("vrp_allstarbank:notification1461")
AddEventHandler("vrp_allstarbank:notification1461", function(title, description, type, returnHome)
  notification(title, description, type, returnHome)
end)

RegisterNetEvent("vrp_allstarbank:showName1461")
AddEventHandler("vrp_allstarbank:showName1461", function(firstname, lastname)
  SendNUIMessage({
    showName = true,
    firstname = firstname,
    lastname = lastname
  })
end)

RegisterNetEvent("vrp_allstarbank:depositResponse1461")
AddEventHandler("vrp_allstarbank:depositResponse1461", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then
    notification("Success", "Deposit success", "success")
  else
    notification("Deposit failed", "Not enough money", "error")
  end
end)

RegisterNetEvent("vrp_allstarbank:withdrawResponse1461")
AddEventHandler("vrp_allstarbank:withdrawResponse1461", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then
    notification("Success", "Withdraw success", "success")
  else
    notification("Withdraw failed", "Not enough money", "error")
  end
end)

RegisterNetEvent("vrp_allstarbank:openBalance1461")
AddEventHandler("vrp_allstarbank:openBalance1461", function(amount)
  SendNUIMessage({
    openBalance = true,
    balance = amount
  })
end)

RegisterNetEvent("vrp_allstarbank:transferResponse1461")
AddEventHandler("vrp_allstarbank:transferResponse1461", function(res)
  Citizen.Wait(1000)
  SendNUIMessage({open = true})
  if res == true then    
    notification("Success", "Transfer success", "success")    
  else
    notification("Transfer failed", "Not enough money", "error")
  end
end)

RegisterNetEvent("vrp_allstarbank:showNotification1461")
AddEventHandler("vrp_allstarbank:showNotification1461", function(text)
  SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end)

AddEventHandler("onResourceStop", function(resource)
  if resource == GetCurrentResourceName() then
    closeGui()
  end
end)
