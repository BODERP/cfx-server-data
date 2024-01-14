local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emS = {}
Tunnel.bindInterface("nav_policia_arsenal",emS)

local Pitemlist = {
	"wbody|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_APPISTOL",
	"wbody|WEAPON_SPECIALCARBINE",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_NIGHTSTICK",
	"wbody|WEAPON_FIREEXTINGUISHER",

	"wammo|WEAPON_COMBATPDW",
	"wammo|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_PUMPSHOTGUN",
	"wammo|WEAPON_SPECIALCARBINE",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_APPISTOL",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_NIGHTSTICK",
	"wammo|WEAPON_FIREEXTINGUISHER"
}

RegisterServerEvent('nav_policia_arsenal:Taser')
AddEventHandler('nav_policia_arsenal:Taser', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:glock')
AddEventHandler('nav_policia_arsenal:glock', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"pgeral.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 200 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:Extintor')
AddEventHandler('nav_policia_arsenal:Extintor', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FIREEXTINGUISHER"] = { ammo = 250 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:Colete')
AddEventHandler('nav_policia_arsenal:Colete', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.setArmour(source,100)
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:Cacetete')
AddEventHandler('nav_policia_arsenal:Cacetete', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:Lanterna')
AddEventHandler('nav_policia_arsenal:Lanterna', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:SigSauer')
AddEventHandler('nav_policia_arsenal:SigSauer', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 200 }})
			
		end
	end
end)

--RegisterServerEvent('nav_policia_arsenal:Parafal')
--AddEventHandler('nav_policia_arsenal:Parafal', function()
	--local source = source
	--local user_id = vRP.getUserId(source)
	--if user_id then
		--if vRP.hasPermission(user_id,"policia.permissao") then
			--vRPclient.giveWeapons(source,{["WEAPON_SPECIALCARBINE"] = { ammo = 200 }})
			
--		end
--	end
--end)

RegisterServerEvent('nav_policia_arsenal:M16')
AddEventHandler('nav_policia_arsenal:M16', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 200 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:APPistol')
AddEventHandler('nav_policia_arsenal:APPistol', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_APPISTOL"] = { ammo = 200 }})
			
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:Limpar')
AddEventHandler('nav_policia_arsenal:Limpar', function()
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
	return vRP.hasPermission(user_id,"policia.permissao")
end