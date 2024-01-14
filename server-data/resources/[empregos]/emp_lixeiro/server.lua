local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

local reward = {25,75}
local rndResult = math.random(1,2)

RegisterServerEvent('damn_lixeiro:rewardTrash')
AddEventHandler('damn_lixeiro:rewardTrash', function(farm)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)

	local x,y = table.unpack(reward)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("reciclaveis")*rndResult <= vRP.getInventoryMaxWeight(user_id) then
			vRP.giveInventoryItem(user_id,"reciclaveis",rndResult)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>"..rndResult.."</b> recicláveis.")
			rndResult = math.random(1,2)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.")
			return false
		end
	end
	--local rewardValue = math.random(x, y)
	--vRP.giveBankMoney(user_id,rewardValue)
	
	--TriggerClientEvent("Notify",source,"sucesso","Você recebeu "..rewardValue.." recicláveis ")
end)