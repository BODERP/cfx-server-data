local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbanco = "https://discord.com/api/webhooks/776440009845637131/gqo4K4VZWvOXtHtPt8cAjk8Q7SZ2f-v2hbeaJturg09FxbOJR5JzAMQ3Zdp7oCIBjorS"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

----------------------------------------------------------------

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_banco")
isTransfer = false

vRP._prepare("sRP/banco",[[
  CREATE TABLE IF NOT EXISTS vrp_banco(
    id INTEGER AUTO_INCREMENT,
    user_id INTEGER,
    extrato VARCHAR(255),
    data VARCHAR(255),
    CONSTRAINT pk_banco PRIMARY KEY(id)
  )
]])

vRP._prepare("sRP/inserir_table","INSERT INTO vrp_banco(user_id, extrato, data) VALUES(@user_id, @extrato, DATE_FORMAT(CURDATE(), '%d/%m/%Y') )")
vRP._prepare("sRP/get_banco_id","SELECT * FROM vrp_banco WHERE user_id = @user_id")
vRP._prepare("sRP/get_dinheiro","SELECT bank FROM vrp_user_moneys WHERE user_id = @user_id")
vRP._prepare("sRP/set_banco","UPDATE vrp_user_moneys SET bank = @bank WHERE user_id = @user_id")

async(function()
  vRP.execute("sRP/banco")
end)

RegisterServerEvent('get:banco')
AddEventHandler('get:banco', function()
    local banco = {}
    local source = source
    local user_id = vRP.getUserId(source)
    local ban = vRP.query("sRP/get_banco_id", {user_id = user_id})
    for i=1, #ban, 1 do
      table.insert(banco, {
        extrato = ban[i].extrato,
        data = ban[i].data
      })
    end
    TriggerClientEvent('send:banco', source, banco)
end)

AddEventHandler("vRPclient:playerSpawned",function(user_id,source) 
    local bankbalance = vRP.getBankMoney(user_id)
    local multasbalance = vRP.getUData(user_id,"vRP:multas")
    local walletbalance = vRP.getBank(user_id)
    TriggerClientEvent('banking:updateBalance2788', source, bankbalance, multasbalance, walletbalance)
end)

RegisterServerEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
  local user_id = vRP.getUserId(source)
  local bankbalance = vRP.getBankMoney(user_id)
  local walletbalance = vRP.getBank(user_id)
  local multasbalance = vRP.getUData(user_id,"vRP:multas")

  TriggerClientEvent('banking:updateBalance2788', source, bankbalance, multasbalance, walletbalance)
end)

function bankBalance(user_id)
  return vRP.getBankMoney(user_id)
end

function multasBalance(user_id)
  return vRP.getUData(user_id,"vRP:multas")
end

function walletbalance(user_id)
  return vRP.getMoney(user_id)
end

function Depositar(user_id, amount)
  local bankbalance = vRP.getBankMoney(user_id)
  local new_balance = bankbalance + math.abs(amount)
  TriggerClientEvent("banking:updateBalance2788", source, new_balance)
  vRP.tryDeposit(user_id,math.floor(math.abs(amount)))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  if num and type(num) == "number" then
    return math.floor(num * mult + 0.5) / mult
  end
end

function addComma(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

RegisterServerEvent('bank:update1461')
AddEventHandler('bank:update1461', function()
  local source = source
  local user_id = vRP.getUserId(source)
  local bankbalance = vRP.getBankMoney(user_id)
  local identity = vRP.getUserIdentity(user_id)
  local multasbalance = vRP.getUData(user_id,"vRP:multas")
  local walletbalance = vRP.getMoney(user_id)
  TriggerClientEvent("banking:updateBalance2788", source, bankbalance, walletbalance, multasbalance, identity.name.." "..identity.firstname) -- ADICIONAR VALORES AQUI PARA APARECER NA NUI + JAVA SCRIPT + HTML
end)

RegisterServerEvent('bank:pagarmulta1461')
AddEventHandler('bank:pagarmulta1461', function(amount)
  local source = source
  local user_id = vRP.getUserId(source)
  local valor = vRP.getUData(user_id,"vRP:multas")
  local int = parseInt(valor)
  if amount < 1 then TriggerClientEvent("Notify", source, "aviso","Você só pode pagar multas acima de <b>R$1</b>") return end
  local rounded = math.ceil(amount)
  local novamulta = int - rounded
  if vRP.tryFullPayment(user_id,rounded) then
    vRP.setUData(user_id,"vRP:multas",json.encode(novamulta))
    local newvalor = vRP.getUData(user_id,"vRP:multas")
    local bank = vRP.getBankMoney(user_id)
    local wallet = vRP.getMoney(user_id)
    TriggerClientEvent("banking:updateBalance2788", source, bank, wallet,novamulta)
    TriggerClientEvent("banking:removeMulta2788", source, rounded)
    SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." \n[PAGOU MULTAS]: R$"..addComma(math.floor(rounded)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    vRP.execute("sRP/inserir_table", {user_id = user_id, extrato = "Você pagou <strong> R$"..addComma(math.floor(rounded)).."</strong> em multas, restando <strong>R$"..addComma(math.floor(novamulta)).."</strong> de multas pendentes e seu novo saldo ficou em <strong>R$"..addComma(math.floor(bank)).."</strong> e o valor na carteira é de <strong>R$"..wallet.."</strong>"})
    TriggerClientEvent("Notify", source, "sucesso","Voce pagou <b> R$"..rounded.." em multas </b>")
  else
    TriggerClientEvent("Notify", source, "negado","<b>Você não possui dinheiro suficiente </b>")
  end
end)
RegisterServerEvent('bank:deposit1461')
AddEventHandler('bank:deposit1461', function(amount)
  local source = source
  local user_id = vRP.getUserId(source)
  if user_id then
    if amount and type(amount) == "number" then
      local rounded = math.ceil(amount)
      if (rounded > 0) then
        local wallet = vRP.getMoney(user_id)
        local bankbalance = vRP.getBankMoney(user_id)
        if (rounded <= wallet) then
          local new_balance = bankbalance + math.abs(rounded)
          
          Depositar(user_id, rounded)
          local carteira = vRP.getMoney(user_id)
          TriggerClientEvent("banking:updateBalance2788", source, new_balance,carteira)
          TriggerClientEvent("banking:addBalance2788", source, rounded)
          SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." \n[DEPOSITOU]: R$"..addComma(math.floor(rounded)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
          vRP.execute("sRP/inserir_table", {user_id = user_id, extrato = "Você depositou <strong>R$"..addComma(math.floor(rounded)).."</strong>, seu saldo ficou em <strong>R$"..addComma(math.floor(bankbalance + rounded)).."</strong> e seu novo valor na carteira é de <strong>$"..carteira.."</strong"})
          TriggerClientEvent("Notify", source, "sucesso","Você depositou <b>R$ " ..addComma(amount).." </b>em sua conta.")
        else
          TriggerClientEvent("Notify", source, "negado","<b>Dinheiro Insuficiente </b>")
        end
      end
    end
  end
end)

RegisterServerEvent('bank:withdraw1461')
AddEventHandler('bank:withdraw1461', function(amount)
  local source = source
  local user_id = vRP.getUserId(source)
  if user_id then
    if amount and type(amount) == "number" then
      local rounded = math.ceil(amount)
      local bankbalance = vRP.getBankMoney(user_id)
      if (rounded <= bankbalance) then
        -- Saca o Dinheiro
        local new_balance = bankbalance - math.abs(rounded)

        vRP.tryWithdraw(user_id,rounded)
        local carteira = vRP.getMoney(user_id)
        vRP.execute("sRP/inserir_table", {user_id = user_id, extrato = "Você fez um saque de <strong>$"..addComma(math.floor(rounded)).."</strong>, seu saldo ficou em <strong>$" .. addComma(math.floor(bankbalance - rounded)) .. "</strong>e seu novo valor na carteira é de <strong>$"..carteira.."</strong"})
        -- Update NUI
        TriggerClientEvent("banking:updateBalance2788", source, new_balance, carteira)
        TriggerClientEvent("banking:removeBalance2788", source, rounded)
        -- Salva o extrato
        SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." \n[SACOU]: R$"..addComma(math.floor(rounded)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        TriggerClientEvent("Notify", source, "sucesso","Você sacou <b>R$ " ..rounded.."</b> da sua conta.")
      else
        TriggerClientEvent("Notify", source, "negado","<b>Você não tem esta quantia!</b>")
      end

    end
  end
end)

RegisterServerEvent('bank:quickCash1461')
AddEventHandler('bank:quickCash1461', function()
  local source = source
  local user_id = vRP.getUserId(source)
  local source = vRP.getUserSource(user_id)
  local bankbalance = vRP.getBankMoney(user_id)
  local quantia = 5000
  if (bankbalance >= quantia) then
    local new_balance = bankbalance - math.abs(quantia)
    vRP.tryWithdraw(user_id,quantia)
    local carteira = vRP.getMoney(user_id)
    TriggerClientEvent("banking:updateBalance2788", source, new_balance,carteira)
    TriggerClientEvent("banking:removeBalance2788", source, quantia)
    SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." \n[SAQUE RAPIDO]: R$"..addComma(math.floor(quantia)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    TriggerClientEvent("Notify", source, "sucesso","Você fez um saque rápido de <b>R$ 5000!</b>")
    vRP.execute("sRP/inserir_table", {user_id = user_id, extrato = "Você fez um saque rapído de <strong>$" .. "5.000" .. "</strong>, seu saldo ficou em <strong>$" .. addComma(bankbalance - 1000) .. "</strong> e seu novo valor na carteira é de <strong>$"..carteira.."</strong"})
  else
    TriggerClientEvent("Notify", source, "negado","<b>Dinheiro Insuficiente </b>")
  end
end)

RegisterServerEvent('bank:transfer1461')
AddEventHandler('bank:transfer1461', function(toPlayer, amount)
  local source = source
  local user_id = vRP.getUserId(source)
  local nuser_id = tonumber(toPlayer)
  if user_id ~= nuser_id then
    if amount and type(amount) == "number" then
      local rounded = math.ceil(amount)
      if (rounded > 0) then
        local bankbalance = vRP.getBankMoney(user_id)
        if (rounded <= bankbalance) then
          local aleatorio = math.random(10000, 99999)
          -- user_id
          local newBalance = bankbalance - math.abs(rounded)
          -- nuser_id
          local player = vRP.getUserSource(nuser_id)
          local bank = vRP.getBankMoney(nuser_id)
          local newBalance_Player = bank + math.abs(amount)
          if player then -- Está online
            vRP.setBankMoney(user_id, newBalance)
            vRP.setBankMoney(nuser_id, newBalance_Player)

            -- Seta o dinheiro pro player
            TriggerClientEvent("banking:updateBalance2788", player, newBalance_Player)
            TriggerClientEvent("banking:addBalance2788", player, rounded)
          else
            local bank = vRP.scalar('sRP/get_dinheiro', {user_id = nuser_id})
            vRP.setBankMoney(user_id, newBalance)
            vRP.execute('sRP/set_banco', {user_id = nuser_id, bank = bank + tonumber(amount) })
          end
          -- Remove o dinheiro do player que enviou
          local carteira = vRP.getMoney(user_id)
          TriggerClientEvent("banking:updateBalance2788", source, newBalance, carteira)
          TriggerClientEvent("banking:removeBalance2788", source, rounded)
          -- Extrato
          SendWebhookMessage(webhookbanco,"```prolog\n[ID]: "..user_id.." \n[TRANSFERENCIA]: R$"..addComma(math.floor(rounded)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
          vRP.execute("sRP/inserir_table", {user_id = user_id, extrato = "Você Transferiu <strong>$"..addComma(math.floor(rounded)).."</strong> para o ID: "..toPlayer..", seu saldo ficou em <strong>$"..addComma(math.floor(bankbalance - rounded)).."</strong> comprovante <strong>NL"..aleatorio.."</strong> e seu novo valor na carteira é de <strong>$"..carteira.."</strong"})
          TriggerClientEvent("Notify", source, "sucesso","Você transferiu <b>$"..rounded.."</b> para o <b>ID: "..nuser_id.."</b>")
        else
          TriggerClientEvent("Notify", source, "negado","<b>Você não tem esta quantia! </b>")
        end
      else
        TriggerClientEvent("Notify", source, "negado","<b>Você não pode transferir esse valor!</b>")
      end
    end
  else
    TriggerClientEvent("Notify", source, "aviso","<b>Impossivel transferir para você mesmo!</b>")
  end
end)