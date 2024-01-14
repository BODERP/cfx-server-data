local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("nav_radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

RegisterNetEvent("radio:outServers")
AddEventHandler("radio:outServers",function()
    outServers()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if emP.checkRadio2() then
		outServers()
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "pm" then
		if emP.checkPermission2("policia.permissao","pm") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1018)
		end
	elseif data == "pc" then
		if emP.checkPermission2("policia.permissao","pc") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1019)
		end
	elseif data == "bope" then
		if emP.checkPermission2("policia.permissao","bope") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1020)
		end
	elseif data == "paramedico" then
		if emP.checkPermission2("paramedico.permissao","Paramédicos") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1022)
		end
	elseif data == "mecanico" then
		if emP.checkPermission2("mecanico.permissao","Mecânicos") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1023)
		end
	elseif data == "helipa" then
		if emP.checkPermission2("helipa.permissao","helipa") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1024)
		end	
	elseif data == "vidigal" then
		if emP.checkPermission2("vidigal.permissao","Vidigal") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1025)
		end		
	elseif data == "mare" then
		if emP.checkPermission2("mare.permissao","Mare") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1026)
		end	
	elseif data == "kennedy" then
		if emP.checkPermission2("kennedy.permissao","Kennedy") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1027)
		end	
	elseif data == "yakuza" then
		if emP.checkPermission2("yakuza.permissao","Yakuza") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1028)
		end
	elseif data == "motoclub" then
		if emP.checkPermission2("motoclub.permissao","Motoclub") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1029)
		end		
	elseif data == "italianos" then
		if emP.checkPermission2("milicia.permissao","italianos") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1030)
		end		
	elseif data == "driftking" then
		if emP.checkPermission2("desmanche.permissao","driftking") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1031)
		end
	elseif data == "bratva" then
		if emP.checkPermission2("bratva.permissao","bratva") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1032)
		end
	elseif data == "abutres" then
		if emP.checkPermission2("abutres.permissao","abutres") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1032)
		end	
	--[[elseif data == "medelin" then
		if emP.checkPermission2("cosanostra.permissao","medelin") then
			outServers()
			exports.tokovoip_script:addPlayerToRadio(1033)
		end	]]
	elseif data == "desconectar" then
		outServers()
		TriggerEvent("Notify","sucesso","Desconectou de todos os canais.")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("radio",function(source,args)
    if emP.checkRadio() then
        ToggleActionMenu()
	end
end)

RegisterCommand("radiof",function(source,args)
	if args[1] then
		if parseInt(args[1]) < 1017 then
        	if emP.checkRadio() then
				if emP.checkPermission() then
                	outServers()
                	exports.tokovoip_script:addPlayerToRadio(parseInt(args[1]))
					TriggerEvent("Notify","sucesso","Você entrou na Frequência <b>"..args[1].."</b> do rádio.",8000)
				end
			end
		else
			TriggerEvent("Notify","negado","Você não tem permissão.")
		end
    end
end)

RegisterCommand("radiod",function(source,args)
    if emP.checkRadio() then
		if emP.checkPermission() then
			outServers()
		    TriggerEvent("Notify","sucesso","Você desconectou de todos os canais.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTSERVERS
-----------------------------------------------------------------------------------------------------------------------------------------
function outServers()
	local i = 0
    while i < 1036 do
      if exports.tokovoip_script:isPlayerInChannel(i) == true then
		exports.tokovoip_script:removePlayerFromRadio(i)
	  end	
      i = i + 1
    end
end