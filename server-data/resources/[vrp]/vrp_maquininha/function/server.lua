local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

kinG = {}
Tunnel.bindInterface("vrp_maquininha",kinG)
local cfg = module("vrp_maquininha","config/creditos")

-------------------------------------------------------------------------------------------------------
-- ==================================================================================================--
-- ============================== SO MECHA SE FOR ARRUMAR TRADUÇÃO ==================================--
-- ==================================================================================================--
-------------------------------------------------------------------------------------------------------

function kinG.checkMaquininha()
	local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
	if vRP.getInventoryItemAmount(user_id,cfg.item_maquininha) >= 0 then
		return true
	else
		TriggerClientEvent("Notify",source,"negado","Você não tem "..cfg.item_maquininha)
		return false
	end
end

function kinG.transBanco(id,valor)
	local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
	local identityu = vRP.getUserIdentity(parseInt(id))
	local identidade = vRP.getUserIdentity(user_id)
	local players = vRP.getUserSource(parseInt(id))
	if user_id == parseInt(id) then
		TriggerClientEvent("Notify",source,"negado","Você não pode transferir para você mesmo.")
	else
		if vRP.request(player,"Deseja transferir <b>R$"..parseInt(valor).."</b> reais para <b>"..identityu.name.." "..identityu.firstname.."</b>?",60) then	
			local banco = vRP.getBankMoney(user_id)
			if banco >= parseInt(valor) then
				vRP.setBankMoney(user_id,banco-parseInt(valor))
				TriggerClientEvent("Notify",source,"sucesso","Você transferiu R$ "..parseInt(valor).." para o "..identityu.name)
				local juros = valor * cfg.juros_trans
				vRP.giveBankMoney(parseInt(id),parseInt(valor-juros))
				TriggerClientEvent("Notify",players,"sucesso","Você recebeu R$ "..parseInt(valor-juros).." do <b>"..identidade.name.." "..identidade.firstname.."</b>")
			else
				TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
			end
		end
	end
end

function kinG.pagarConserto(id,valor)
	local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
	local players = vRP.getUserSource(parseInt(id))
	local identityu = vRP.getUserIdentity(parseInt(id))
	local identidade = vRP.getUserIdentity(user_id)
	if user_id == parseInt(id) then
		TriggerClientEvent("Notify",source,"negado","Você não pode cobrar para você mesmo.")
	else
		if vRP.request(players,"Você deseja pagar <b>R$ "..parseInt(valor).."</b> para <b>"..identidade.name.." "..identidade.firstname.."</b>?",60) then
			local banco = vRP.getBankMoney(parseInt(id))
			if banco >= parseInt(valor) then
				vRP.setBankMoney(parseInt(id),banco-parseInt(valor))
				TriggerClientEvent("Notify",source,"sucesso","Você recebeu R$ "..parseInt(valor).." para o ID: "..parseInt(id))
				local juros = valor * cfg.juros_cobranca
				vRP.giveBankMoney(user_id,parseInt(valor-juros))
				TriggerClientEvent("Notify",players,"sucesso","Você pagou  R$ "..parseInt(valor-juros).." do o ID: "..parseInt(id))
			else
				TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
			end
		end
	end
end