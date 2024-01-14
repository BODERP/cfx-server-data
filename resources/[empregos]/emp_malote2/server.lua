local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

local reward = {1,1}
local rndResult = math.random(25,75)

RegisterServerEvent('damn_malote:rewardMalote')
AddEventHandler('damn_malote:rewardMalote', function(farm)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)

	local x,y = table.unpack(reward)
	local rewardValue = math.random(x, y)
	--vRP.giveBankMoney(user_id,rewardValue)
	vRP.giveInventoryItem(user_id,"impostoderenda",rewardValue)
	TriggerClientEvent("Notify",source,"sucesso","Você recebeu "..rewardValue.." nota de recebimento.")
end)