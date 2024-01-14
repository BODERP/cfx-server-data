local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_banco")


local giveCashAnywhere = false 
local withdraWAnywhere = false 
local depositAnywhere = false 
local displayBankBlips = false 
local enableBankingGui = true 

local banks = {
  {name="Banco", id=1,   x=149.94,    y=-1040.74, z=29.37 },
  --{name="Banco", id=1,   x=1175.05,   y=2706.804, z=38.094},
  {name="Banco", id=108, x=-1212.980, y=-330.841, z=37.787},
  --{name="Banco", id=108, x=-2962.582, y=482.627,  z=15.703},
  {name="Banco", id=108, x=-112.202,  y=6469.295, z=31.626},
  {name="Banco", id=108, x=314.187,   y=-278.621, z=54.170},
  {name="Banco", id=108, x=-351.534,  y=-49.529,  z=49.042},
  {name="Banco", id=108, x=237.45,    y=217.81,   z=106.28},
  {name="Banco", id=108, x=-717.70,   y=-915.74,  z=19.21 },
  {name="Banco", id=108, x=-1153.75,  y=-915.74,  z=19.21 },
  {name="Banco", id=108, x=-56.9,     y=-1752.16, z=29.43 },
  {name="Banco", id=108, x=380.84,    y=323.46,   z=103.57},
  {name="Banco", id=108, x=-3240.67,  y=-1008.72, z=12.84 },
  {name="Banco", id=108, x=1735.32,   y=6410.58,  z=35.04 },
  {name="Banco", id=108, x=540.33,    y=2671.05,  z=42.16 },
  {name="Banco", id=108, x=1968.07,   y=3743.63,  z=32.35 },
  {name="Banco", id=108, x=2683.12,   y=3286.61,  z=19.21 },
  {name="Banco", id=108, x=1827.28,   y=784.86,   z=138.31},
  {name="Banco", id=108, x=-3040.81,  y=593.1,    z=7.91  },
  {name="Banco", id=108, x=-660.75,  y=-853.97,    z=24.49  },
  {name="Banco", id=108, x=1703.01,  y=4933.52,    z=42.07  },
  {name="Banco", id=108, x=-1827.18,  y=784.91,    z=138.31  },
  {name="Banco", id=108, x=315.22,  y=-593.6,    z=43.29  },
  {name="Banco", id=108, x=1109.68,  y=-1690.85,   z=4.38  },
  {name="Banco", id=108, x=33.17,  y=-1348.12,   z=29.5  },
}

Citizen.CreateThread(function()
  if displayBankBlips then
    for k,v in ipairs(banks)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.4)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

local atBank = false
local bankOpen = false

RegisterNetEvent('send:banco')
AddEventHandler('send:banco', function(banco)
  TransitionToBlurred(1000)
	SetNuiFocus(true, true)
	SendNUIMessage({
    openBank = true,
		banco = banco
	})
end)


function closeGui()
  TransitionFromBlurred(1000)
  SetNuiFocus(false)
  SendNUIMessage({openBank = false})
  bankOpen = false
  atmOpen = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(PlayerPedId(), true)
		for k, j in pairs(banks) do
			if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 1.0) then
				if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 1.0) then
					draw3DText(j.x, j.y, j.z, "Pressione [~g~E~w~] para acessar o banco")
				end
			end
		end
	end
end)

if enableBankingGui then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if(IsNearBank()) then
        atBank = true
        if IsControlJustPressed(1, 51) and not vRP.isHandcuffed()  then 
            if bankOpen then
              closeGui()
              bankOpen = false
            else
              TriggerServerEvent("bank:update1461")
              TriggerServerEvent("get:banco")
              bankOpen = true
          end
      	end
      else
        if(bankOpen) then
          closeGui()
        end
        atBank = false
        bankOpen = false
      end
    end
  end)
end

Citizen.CreateThread(function()
  while true do
    if bankOpen then
      local ply = PlayerPedId()
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
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNUICallback('balance', function(data, cb)
  SendNUIMessage({openSection = "balance"})
  cb('ok')
end)

RegisterNUICallback('multasbalance', function(data, cb)
  SendNUIMessage({openSection = "multasbalance"})
  cb('ok')
end)
RegisterNUICallback('walletbalance', function(data, cb)
  SendNUIMessage({openSection = "walletbalance"})
  cb('ok')
end)

RegisterNUICallback('withdraw', function(data, cb)
  SendNUIMessage({openSection = "withdraw"})
  cb('ok')
end)

RegisterNUICallback('deposit', function(data, cb)
  SendNUIMessage({openSection = "deposit"})
  cb('ok')
end)

RegisterNUICallback('transfer', function(data, cb)
  SendNUIMessage({openSection = "transfer"})
  cb('ok')
end)

RegisterNUICallback('quickCash', function(data, cb)
  TriggerServerEvent('bank:quickCash1461')
  cb('ok')
end)

RegisterNUICallback('erroMulta', function()
  TriggerEvent('Notify',"negado","Você não tem nenhuma multa para pagar")
end)
RegisterNUICallback('erroMulta2', function()
  TriggerEvent('Notify',"negado","Valor desejado inexistente")
end)

RegisterNUICallback('withdrawSubmit', function(data, cb)
  TriggerEvent('bank:withdraw1461', data.amount)
  cb('ok')
end)

RegisterNUICallback('depositSubmit', function(data, cb)
  TriggerEvent('bank:deposit1461', data.amount)
  cb('ok')
end)

RegisterNUICallback('pagarMulta', function(data,cb)
  TriggerEvent('bank:pagarmulta1461', tonumber(data.amount))
  cb('ok')
end)

RegisterNUICallback('transferSubmit', function(data, cb)
  local toPlayer = data.toPlayer
  local amount = data.amount
  TriggerServerEvent("bank:transfer1461", toPlayer, tonumber(amount))
end)

function IsNearBank()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(banks) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 3) then
      return true
    end
  end
end

function IsNearPlayer(player)
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if (distance <= 5) then
    return true
  end
end

RegisterNetEvent('bank:pagarmulta1461')
AddEventHandler('bank:pagarmulta1461', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:pagarmulta1461", tonumber(amount))
  else
    vRP.notifyError("Você só pode pagar multa em um banco!")
  end
end)

RegisterNetEvent('bank:deposit1461')
AddEventHandler('bank:deposit1461', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:deposit1461", tonumber(amount))
  else
    vRP.notifyError("Você só pode depositar em um banco!")
  end
end)

RegisterNetEvent('bank:withdraw1461')
AddEventHandler('bank:withdraw1461', function(amount)
  if (IsNearBank() == true or withdraWAnywhere == true) then
    TriggerServerEvent("bank:withdraw1461", tonumber(amount))
  else
    vRP.notifyError("Você só pode sacar em um banco!")
  end
end)

RegisterNetEvent('bank:givecash1461')
AddEventHandler('bank:givecash1461', function(toPlayer, amount)
  if(IsNearPlayer(toPlayer) == true or giveCashAnywhere == true) then
    local player2 = GetPlayerFromServerId(toPlayer)
    local playing = IsPlayerPlaying(player2)
    if (playing ~= false) then
      TriggerServerEvent("bank:givecash1461", toPlayer, tonumber(amount))
      vRP.notify("Você transferiu " .. tonumber(amount) .. " para " .. toPlayer)
    else
      vRP.notifyWarning("Cidadão fora da cidade!")
    end
  else
    vRP.notifyWarning("Cidadão não mora nessa cidade!")
  end
end)

RegisterNetEvent('banking:updateBalance2788')
AddEventHandler('banking:updateBalance2788', function(balance, walletbalance, multasbalance,   identidade)
	SendNUIMessage({
		updateBalance = true,
    balance = balance,
    walletbalance = walletbalance,
    multasbalance = multasbalance,   
    identidade = identidade
    
	})
end)

RegisterNetEvent("banking:addBalance2788")
AddEventHandler("banking:addBalance2788", function(amount)
	SendNUIMessage({
		addBalance = true,
		amount = amount
	})
end)

RegisterNetEvent("banking:removeBalance2788")
AddEventHandler("banking:removeBalance2788", function(amount)
	SendNUIMessage({
		removeBalance = true,
		amount = amount
	})
end)


function draw3DText(x,y,z, text)
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