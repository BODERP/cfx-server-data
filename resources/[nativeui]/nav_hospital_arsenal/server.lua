local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emS = {}
Tunnel.bindInterface("nav_hospital_arsenal",emS)

local Pitemlist = {

	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_FIREEXTINGUISHER",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_FIREEXTINGUISHER"
}

RegisterServerEvent('nav_hospital_arsenal:Taser')
AddEventHandler('nav_hospital_arsenal:Taser', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"paramedico.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			
		end
	end
end)

RegisterServerEvent('nav_hospital_arsenal:Extintor')
AddEventHandler('nav_hospital_arsenal:Extintor', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"paramedico.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 250 }})
			
		end
	end
end)

RegisterServerEvent('nav_hospital_arsenal:Lanterna')
AddEventHandler('nav_hospital_arsenal:Lanterna', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"paramedico.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			
		end
	end
end)

RegisterServerEvent('nav_hospital_arsenal:Limpar')
AddEventHandler('nav_hospital_arsenal:Limpar', function()
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})

		for k,v in pairs(weapons) do
			vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			end
		end

		local inv = vRP.getInventory(user_id)

		for k,v in pairs(Pitemlist) do
			local sub_items = { v }
			if string.sub(v,1,1) == "*" then
				local idname = string.sub(v,2)
				sub_items = {}
				for fidname,_ in pairs(inv) do
					if splitString(fidname,"|")[1] == idname then
						table.insert(sub_items,fidname)
					end
				end
			end

			for _,idname in pairs(sub_items) do
				local amount = vRP.getInventoryItemAmount(user_id,idname)
				if amount > 0 then
					local item_name,item_weight = vRP.getItemDefinition(idname)
					if item_name then
						if vRP.tryGetInventoryItem(user_id,idname,amount,true) then
						end
					end
				end
			end
		end

		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"aviso","Equipamento guardado.")
		
	else
		TriggerClientEvent("Notify",source,"negado","Acesso negado!")
	end
end)

function emS.permissao()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"paramedico.permissao")
end