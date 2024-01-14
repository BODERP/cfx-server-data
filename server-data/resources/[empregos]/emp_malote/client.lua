local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[[----------------
--Prop's list
	prop_money_bag_01 Saco de dinheiro
	prop_security_case_01 -- -1249748547 -- Case
----------------]]--
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
--Tunnel.bindInterface("vrp_chest",src)
vSERVER = Tunnel.getInterface("vrp_chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
local chestTimer = 0
local chestOpen = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeItem",function(data)
	vSERVER.storeItem(tostring(chestOpen),data.item,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AUTO-UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Creative:UpdateChest")
AddEventHandler("Creative:UpdateChest",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local quantidade = 0
local statuses = false
local nveh = nil
local pegando = false
local andamento = false
local andamento2 = false
local object = nil
local encomendapega = false
local npcoord = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local npclocal = {
	[1] = {x=-1215.48,y=-334.36,z=37.79,hash=0xC306D6F5,hash2="u_m_m_bankman"}, -- -1215.48,-334.36,37.79 Banco 1
	[2] = {x=-355.78,y=-50.36,z=49.04,hash=0x909D9E7F,hash2="ig_bankman"}, -- -355.78,-50.36,49.04 Banco 2
	[3] = {x=239.15,y=228.24,z=106.29,hash=0x9760192E,hash2="cs_bankman"}, -- 239.15,228.24,106.29 Banco 3
	[4] = {x=309.33,y=-279,z=54.17,hash=0x909D9E7F,hash2="ig_bankman"},  -- 309.33,-279.46,54.17 Banco 4
	[5] = {x=144.88,y=-1041.22,z=29.37,hash=0x9760192E,hash2="cs_bankman"}, -- 144.88,-1041.22,29.37 Banco 5
	--[6] = {x=90.76,y=298.28,z=110.21,hash=0xD55B2BF5,hash2="s_f_y_migrant_01"}, 
	--[7] = {x=1247.16,y=-349.87,z=69.20,hash=0xDB9C0997,hash2="s_m_m_linecook"}
}

local pegarlocal = { -- Pega o item do NPC
	[1] = {x=-1215.23,y=-324.71,z=37.7}, -- -1215.23,-324.71,37.7 -- Banco 1
	[2] = {x=-339.33,y=-38.9,z=47.72}, -- -343.97,-29.69,47.09 -- Banco 2 -339.33, ['y'] = -38.9, ['z'] = 47.72
	[3] = {x=230.24,y=213.61,z=105.53}, -- 230.24,213.61,105.53 -- Banco 3
	[4] = {x=318.03,y=-271.96,z=53.92}, -- 318.03,-271.96,53.92 -- Banco 4
	[5] = {x=152.57,y=-1034.43,z=29.34}, -- 152.57,-1034.43,29.34 -- Banco 5
	--[6] = {x=98.35,y=287.85,z=109.97},
	--[7] = {x=1227.00,y=-353.99,z=69.11}
}

local motolocal = { -- Chamar NPC
	--[[[1] = {x=143.72,y=-1462.58,z=29.35},
	[2] = {x=-188.72,y=-1422.01,z=31.33}, 
	[3] = {x=-843.08,y=-1146.02,z=6.79}, 
	[4] = {x=785.54,y=-734.35,z=27.63}, 
	[5] = {x=-644.88,y=232.17,z=80.77}, 
	[6] = {x=95.43,y=285.05,z=110.20},
	[7] = {x=1223.85,y=-353.38,z=68.97}]]
	[1] = {x=-1220.4,y=-317.65,z=37.18}, -- -1220.4,-317.65,37.18 -- Banco 1
	[2] = {x=-343.97,y=-29.69,z=47.09}, -- -343.97,-29.69,47.09 -- Banco 2
	[3] = {x=227.56,y=200.11,z=104.93}, -- 227.56,200.11,104.93 -- Banco 3
	[4] = {x=321.79,y=-268.7,z=53.41}, -- 321.79,-268.7,53.41 -- Banco 4
	[5] = {x=151.96,y=-1029.02,z=28.84}, -- 140.19,-1061.88,28.81 -- Banco 5 atrás e 151.96,-1029.02,28.84 Banco 5 na frente
	--[6] = {x=95.43,y=285.05,z=110.20}, -- -1220.4,-317.65,37.18 -- Banco 6 Fora da cidade
	--[7] = {x=1223.85,y=-353.38,z=68.97} -- -1220.4,-317.65,37.18 -- Banco 7 e 8 Fora da cidade
}

local entregalocal = { -- Locais de entrega
	[1] = {x=-58.05,y=-802.72,z=44.23}, -- -58.05,-802.72,44.23 -- Mazebank prédio principal
	[2] = {x=-58.05,y=-802.72,z=44.23}, -- -58.05,-802.72,44.23 -- Mazebank prédio principal
	--[[[1] = {x=8.68,y=-243.38,z=47.66}, 
	[2] = {x=66.41,y=-255.80,z=52.35},
	[3] = {x=85.61,y=-272.27,z=47.41}, 
	[4] = {x=18.69,y=-209.50,z=52.85}, 
	[5] = {x=-44.81,y=-180.49,z=54.26}, 
	[6] = {x=-40.96,y=-58.68,z=63.81}, 
	[7] = {x=-333.12,y=101.46,z=71.21}, 
	[8] = {x=-383.78,y=152.68,z=65.53}, 
	[9] = {x=-598.77,y=147.34,z=61.67}, 
	[10] = {x=-628.07,y=169.60,z=61.15}, 
	[11] = {x=-620.04,y=209.05,z=74.20}, 
	[12] = {x=479.64,y=-1735.80,z=29.15}, 
	[13] = {x=495.33,y=-1823.41,z=28.86}, 
	[14] = {x=437.81,y=-1876.05,z=27.60}, 
	[15] = {x =315.62,y=-1937.46,z=24.82}, 
	[16] = {x=200.18,y=-2002.28,z=18.86},
	[17] = {x =1200.93,y=-602.49,z=67.71},
	[18] = {x=414.99,y=-217.31,z=59.91},
	[19] = {x=-664.49,y=-391.42,z=34.59},
	[20] = {x=-668.29,y=-971.36,z=22.34}]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrp_malote:permissao')
AddEventHandler('vrp_malote:permissao',function()
	if not emservico then
		TriggerEvent("Notify","importante","Voce iniciou seu <b>trabalho</b>, pegue o <b>Carro Forte</b> na garagem!")
		parte = 0
		emservico = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local coordsx,coordsy,coordsz = table.unpack(GetEntityCoords(ped))
		if GetDistanceBetweenCoords(GetEntityCoords(ped), -1371.34,-458.53,34.48,true) <= 20 then 
		    DrawText3D(-1371.34,-458.53,34.48+0.47, "~w~Serviço", 1.0, 4)
		    DrawText3D(-1371.34,-458.53,34.48+0.35, "~b~Transporte de dinheiro", 0.8, 1)
		    DrawMarker(37, -1371.34,-458.53,34.48-0.07, 0, 0, 0, 0, 0, 0, 1.1, 1.1, 1.1, 30, 215, 45, 80, 0, true, false, false)
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), -1371.34,-458.53,34.48,true) <= 1 then
                if IsControlJustPressed(0,38) then	
				    TriggerServerEvent('vrp_malote:permissao')
				end
			end
		end
		if emservico and parte == 0 then
			if GetDistanceBetweenCoords(GetEntityCoords(ped), -1376.7,-459.64,34.48,true) <= 20 then
		        DrawMarker(21,-1376.7,-459.64,34.48-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,30,215,45,85,0,0,0,0) 
		        if GetDistanceBetweenCoords(GetEntityCoords(ped), -1376.7,-459.64,34.48,true) <= 1 then
                    if IsControlJustPressed(0,38) then	
                    	Fade(1200)
				        TriggerEvent("Notify","importante","Pegue o <b>Carro Forte</b> e aguarde um <b>chamado</b>!")
		                spawnMoto()
		                Wait(10000)
		                vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
		                TriggerEvent("Notify","sucesso","Chamada recebida, vá até o <b>local</b> e pegue o <b>malote</b>!")
                        parte = 1
                        destino = math.random(1,5)
		                CriandoBlipPegar(motolocal,destino)
				    end
			    end
		    end
		end
		if emservico and parte == 1 then
		    local veh = GetMotoPosition(10)
			local coordsMoto = GetOffsetFromEntityInWorldCoords(veh, 0.0, -0.9, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),motolocal[destino].x,motolocal[destino].y,motolocal[destino].z,true)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z,true)
			local distance3 = GetDistanceBetweenCoords(GetEntityCoords(ped),pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z,true)
			local distancecar = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z, true)
			if distance <= 50 and not pegando and not npcoord then
				DrawMarker(21,motolocal[destino].x,motolocal[destino].y,motolocal[destino].z,0,0,0,0.0,0,0,0.5,0.5,0.4,30,215,45,180,0,0,0,0)
                if IsControlJustPressed(0,38) and not andamento and not andamento2 and distance <= 2.0 then
                	Fade(1200)
                	RequestModel(GetHashKey(npclocal[destino].hash2))
					while not HasModelLoaded(GetHashKey(npclocal[destino].hash2)) do
						Citizen.Wait(1)
					end
                    npc = CreatePed(4,npclocal[destino].hash,npclocal[destino].x,npclocal[destino].y,npclocal[destino].z-1,3374176,true,false)
					SetBlockingOfNonTemporaryEvents(npc,true)
					SetPedSeeingRange(npc,0.0)
					SetPedHearingRange(npc,0.0)
					SetPedFleeAttributes(npc,0,false)
					SetPedKeepTask(npc,true)
					SetEntityInvincible(npc,true)
					SetPedCanRagdoll(npc,false)
					SetPedDiesWhenInjured(npc,false)
					SetPedCombatMovement(npc,false)
					-- A VARIÁVEL NÚMERO INFORMA QUAL PROP VAI SURGIR NA MÃO DO NPC
					-- prop_security_case_01 -- -1249748547 -- Case
					numero = math.random(1,3)
                    if numero == 1 then
                        RequestModel(GetHashKey("prop_security_case_01"))
                        while not HasModelLoaded(GetHashKey("prop_security_case_01")) do
                            Citizen.Wait(10)
                        end
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_security_case_01"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,28422),0.10,0.0,0.00,65.0,-130.0,-65.0,true,true,false,true,0,true)
                        SetEntityAsMissionEntity(object,true,true)
                    elseif numero == 2 then
                        vRP.CarregarAnim("anim@heists@box_carry@")
                        RequestModel(GetHashKey("prop_security_case_01"))
                        while not HasModelLoaded(GetHashKey("prop_security_case_01")) do
                            Citizen.Wait(10)
                        end
                        TaskPlayAnim(npc,"anim@heists@box_carry@","idle",3.0,3.0,-1,50,0,0,0,0)
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_security_case_01"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,28422),0.10,0.0,0.00,65.0,-130.0,-65.0,true,true,false,true,0,true)
                        SetEntityAsMissionEntity(object,true,true)
                        SetEntityAsMissionEntity(object,true,true)
                    elseif numero == 3 then
                        vRP.CarregarAnim("anim@heists@box_carry@")
                        RequestModel(GetHashKey("prop_security_case_01"))
                        while not HasModelLoaded(GetHashKey("prop_security_case_01")) do
                            Citizen.Wait(10)
                        end
                        TaskPlayAnim(npc,"anim@heists@box_carry@","idle",3.0,3.0,-1,50,0,0,0,0)
                        local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                        object = CreateObject(GetHashKey("prop_security_case_01"),coords.x,coords.y,coords.z,true,true,true)
                        SetEntityCollision(object,false,false)
                        AttachEntityToEntity(object,npc,GetPedBoneIndex(npc,28422),0.10,0.0,0.00,65.0,-130.0,-65.0,true,true,false,true,0,true)
                        SetEntityAsMissionEntity(object,true,true)
                    end
					TaskGoToCoordAnyMeans(npc, pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z, 1.0, 0, 0, 786603, 0xbf800000)
					npcoord = true
				end
			end
			-- NPC SE DESLOCA PARA O LOCAL E PEGA MALOTE
			if distance3 <= 50 and not pegando and npcoord then
				if distance3 < 1.3 and not IsPedInAnyVehicle(ped) and npcoord and GetDistanceBetweenCoords(GetEntityCoords(npc),pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z,true) <= 0.5 then
					FreezeEntityPosition(npc,true)
					DrawText3Ds(pegarlocal[destino].x,pegarlocal[destino].y,pegarlocal[destino].z+0.35,"~b~[E] ~w~Pegar Malote")
                    if IsControlJustPressed(0,38) and not andamento and not andamento2 then
                    	quantidade = 0
                        TriggerEvent('cancelando',true)
                        Wait(1000)
                        pegando = true
                        ClearPedTasksImmediately(ped)
                        vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        if DoesEntityExist(object) then
                            DetachEntity(object,false,false)
                            TriggerServerEvent("trydeleteobj",ObjToNet(object))
                            object = nil
                        end
                        ClearPedSecondaryTask(npc)
                        ClearPedTasks(npc)
                        FreezeEntityPosition(npc,false)
                        TaskGoToCoordAnyMeans(npc, npclocal[destino].x,npclocal[destino].y,npclocal[destino].z, 1.0, 0, 0, 786603, 0xbf800000)
                        npcoord = false
                        RemoveBlip(blip)
                        TriggerEvent("Notify","importante","<b>Maleta</b> recebida, guarde no seu <b>Carro Forte</b>!")
						-- COLOCANDO PROP NO VEÍCULO
                        if numero == 1 then
                            RequestModel(GetHashKey("prop_security_case_01"))
                            while not HasModelLoaded(GetHashKey("prop_security_case_01")) do
                                Citizen.Wait(10)
                            end
                        	local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
                            object = CreateObject(GetHashKey("prop_security_case_01"),coords.x,coords.y,coords.z,true,true,true)
                            SetEntityCollision(object,false,false)
                            AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,28422),0.10,0.0,0.00,65.0,-130.0,-65.0,true,true,false,true,0,true)
                            SetEntityAsMissionEntity(object,true,true)
                        	andamento = true
                        elseif numero == 2 then
                        	vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_security_case_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	andamento2 = true
                        elseif numero == 3 then
                        	vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_security_case_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	andamento2 = true
                        end
					end
				end
			end
			-- GERANDO LOCAL DA ENTREGA
			if distancecar <= 5.0 and not IsPedInAnyVehicle(ped) and pegando then
				if model == 1747439474 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
	                DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Guardar")
	                TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                        if quantidade == 0 then
                            quantidade = quantidade + 1
                            andamento = false
                            andamento2 = false
                            encomendapega = false
				            ClearPedTasksImmediately(ped)
				            vRP._DeletarObjeto()
				            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Maleta</b> guardada, entre no <b>Carro Forte</b> e espere a <b>localizaçao</b> da <b>entrega</b>!")
                            time = math.random(1000,2000)
                            destinoantigo2 = destino2
                            destino2 = math.random(1,2)
                            while true do
                                if destinoantigo2 == destino2 then
                                    destino2 = math.random(1,2)
                                else
                                    break
                                end
                                Citizen.Wait(1)
                            end
                            SetTimeout(400,function()
                        	    pegando = false
                                parte = 2
                            end)
                            Wait(time)
                            vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                            TriggerEvent("Notify","sucesso","Localizaçao recebida, vá até o <b>local</b> e entregue a <b>maleta</b>!")
                            CriandoBlipEntrega(entregalocal,destino2)
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                            quantidade = 0
                        end
	                end
				end
			end
			if not npcoord then
				if DoesEntityExist(npc) then
				   if GetDistanceBetweenCoords(GetEntityCoords(npc),npclocal[destino].x,npclocal[destino].y,npclocal[destino].z,true) <= 1.1 then
					   Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(npc))
                       npc = nil
                   end
                end
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if emservico and parte == 2 then
		    local veh = GetMotoPosition(10)
			local coordsMoto = GetOffsetFromEntityInWorldCoords(veh, 0.0, -0.9, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z,true)
			local distancecar = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsMoto.x,coordsMoto.y,coordsMoto.z, true)
			if distancecar <= 5.0 and not IsPedInAnyVehicle(ped) and not pegando then
				if model == 1747439474 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
	                DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Pegar")
                    if IsControlJustPressed(0,38) and not andamento and not andamento2 and not encomendapega then
                        if quantidade > 0 then
                    	    quantidade = quantidade - 1
                    	    pegando = true
                            TriggerEvent('cancelando',true)
				            ClearPedTasksImmediately(ped)
				            FreezeEntityPosition(ped,false)
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Maleta</b> recebida!")
                            SetTimeout(400,function()
                        	    encomendapega = true
                            end)
                            if numero == 1 then
                                RequestModel(GetHashKey("prop_security_case_01"))
                                while not HasModelLoaded(GetHashKey("prop_security_case_01")) do
                                    Citizen.Wait(10)
                                end
                        	    local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
                                object = CreateObject(GetHashKey("prop_security_case_01"),coords.x,coords.y,coords.z,true,true,true)
                                SetEntityCollision(object,false,false)
                                AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,28422),0.10,0.0,0.00,65.0,-130.0,-65.0,true,true,false,true,0,true)
                                SetEntityAsMissionEntity(object,true,true)
                        	    andamento = true
                            elseif numero == 2 then
                        	    vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_security_case_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	    andamento2 = true
                            elseif numero == 3 then
                        	    vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_security_case_01",50,11816,-0.05,0.38,-0.050,15.0,285.0,270.0,2)
                        	    andamento2 = true
                            end
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Voce entregou todas as suas <b>maletas</b>!")
                            quantidade = 0
					    end
				    end
				end
			end
			if distancecar <= 5.0 and not IsPedInAnyVehicle(ped) and pegando then
				if model == 1747439474 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
	                DrawText3Ds(coordsMoto.x,coordsMoto.y,coordsMoto.z+0.80,"~b~[E] ~w~Guardar")
	                TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) and encomendapega then
                        if quantidade >= 0  then
                            quantidade = quantidade + 1
                            pegando = false
                            andamento = false
                            andamento2 = false
                            FreezeEntityPosition(ped,true)
                            RequestAnimDict("pickup_object")
				            while not HasAnimDictLoaded("pickup_object") do
					            Citizen.Wait(0) 
				            end
				            TaskPlayAnim(ped,"pickup_object","pickup_low",100.0,200.0,0.3,120,0.2,0,0,0)
				            ClearPedTasksImmediately(ped)
				            FreezeEntityPosition(ped,false)
				            vRP._DeletarObjeto()
				            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","<b>Maleta</b> guardada!")
                            SetTimeout(400,function()
                                encomendapega = false
                            end)
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                            TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                            quantidade = 0
                        end
					end
				end
	        end
			if distance <= 50 and pegando and encomendapega then
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
					DrawText3Ds(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z+0.35,"~b~[E] ~w~Entregar")
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                    	if quantidade == 0 then
                    		Fade(1200)
							-- REMUNERAÇÃO
                    		local pagamento = math.random(10,20)
                    		destinoantigo = destino
							pegando = false
							encomendapega = false
                            andamento = false
                            andamento2 = false
                            vRP._DeletarObjeto()
                            vRP.stopAnim(true)
                            if DoesEntityExist(object) then
                                DetachEntity(object,false,false)
                                TriggerServerEvent("trydeleteobj",ObjToNet(object))
                                object = nil
                            end
                            ClearPedTasksImmediately(ped)
                            TriggerServerEvent("vrp_malote:receber",pagamento)
							--local malote = math.random(1,3)
							--if malote == 1 then
                            TriggerEvent("Notify","sucesso","<b>Maleta</b> entregue, vocë ganhou <b>R$"..pagamento.."</b>!")
							RegisterNUICallback("storeItem",function(data)
								vSERVER.storeItem(tostring(chestOpen),data.item,data.amount)
							end)
							--vSERVER.storeItem()
							-- TriggerServerEvent(vSERVER.storeItem("TaxistasLavagem","impostoderenda",1))
                            TriggerEvent("Notify","importante","entre no <b>Carro Forte</b> e aguarde até receber um <b>chamado</b>!")
                            RemoveBlip(blip)
                            time = math.random(2000,3000)
                        	Wait(time)
                        	vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                        	TriggerEvent("Notify","sucesso","Chamado recebido, vá até o <b>local</b> e pegue a <b>maleta</b>!")
                            while true do
                                if destinoantigo == destino then
                                    destino = math.random(1,5)
                                else
                                    break
                                end
                                Citizen.Wait(1)
                            end
                            CriandoBlipPegar(motolocal,destino)
		                    parte = 1
                        else
                        	parte = 1
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	quantidade = 0
                        	TriggerEvent("Notify","aviso","Erro, <b>reinicie</b> o seu <b>emprego</b>!")
                        end
					end
				end
			elseif distance <= 50 and not pegando and not encomendapega then
				DrawMarker(21,entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,30,215,45,180,0,0,0,1)
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
					DrawMarker(21,entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,30,215,45,180,0,0,0,1)
					DrawText3Ds(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z+0.35,"~w~ Pegue a maleta no ~b~Carro Forte")
			    end
			end
		end
	end
end
)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if andamento then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,22,true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if andamento2 then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
		end
	end
end)

function Fade(time)
	DoScreenFadeOut(800)
	Wait(time)
	DoScreenFadeIn(800)
end

function spawnMoto()
	local mhash = "stockade"
	if not nveh then
	 while not HasModelLoaded(mhash) do
	  RequestModel(mhash)
	    Citizen.Wait(10)
	 end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,-1398.75,-456.14,34.09+0.5,305.300,true,false)--1398.75,-456.14,34.09 spawn do carro forte via garagem
		SetVehicleIsStolen(nveh,false)
		SetVehicleOnGroundProperly(nveh)
		SetEntityInvincible(nveh,false)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		Citizen.InvokeNative(0xAD738C3085FE7E11,nveh,true,true)
		SetVehicleHasBeenOwnedByPlayer(nveh,true)
		SetVehicleDirtLevel(nveh,0.0)
		SetVehRadioStation(nveh,"OFF")
		SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) and emservico and (nveh) then
			emservico = false
			pegando = false
			andamento = false
			andamento2 = false
			quantidade = 0
			parte = 0
			encomendapega = false
			npcoord = false
			TriggerEvent('cancelando',false)
			RemoveBlip(blip)
			vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
			if nveh then
			   DeleteVehicle(nveh)
			   nveh = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetMotoPosition(radius)
	local ped = PlayerPedId()
	local coordsx = GetEntityCoords(ped, 1)
	local coordsy = GetOffsetFromEntityInWorldCoords(ped, 0.0, radius+0.00001, 0.0)
	local nearVehicle = GetMotoDirection(coordsx, coordsy)
	if IsEntityAVehicle(nearVehicle) then
	    return nearVehicle
	else
		local x,y,z = table.unpack(coordsx)
	    if IsPedSittingInAnyVehicle(ped) then
	        local veh = GetVehiclePedIsIn(ped,true)
	        return veh
	    else
	        local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,8192+4096+4+2+1) 
	        if not IsEntityAVehicle(veh) then 
	        	veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,4+2+1) 
	        end 
	        return veh
	    end
	end
end

function GetMotoDirection(coordFrom,coordTo)
	local position = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a,b,c,d,vehicle = GetRaycastResult(position)
	return vehicle
end

function DrawText3D(x,y,z, text, scl, font) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

	local scale = (1/dist)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 180)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end

function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end

function CriandoBlipPegar(motolocal,destino)
	blip = AddBlipForCoord(motolocal[destino].x,motolocal[destino].y,motolocal[destino].z+5)
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Pegar Maleta")
	EndTextCommandSetBlipName(blip)
end

function CriandoBlipEntrega(entregalocal,destino2)
	blip = AddBlipForCoord(entregalocal[destino2].x,entregalocal[destino2].y,entregalocal[destino2].z)
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega da Maleta")
	EndTextCommandSetBlipName(blip)
end