local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_drogas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {}
local segundos = 0
local selectnpc = nil
local porcentagem = 0
local pweapon = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VENDA DE DROGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),-186.1,-893.5,29.3,true)
		if distance <= 2100 then
			local random,npc = FindFirstPed()
			repeat
				local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),GetEntityCoords(npc),true)
				if not IsPedDeadOrDying(npc) and not IsPedAPlayer(npc) and distancia <= 2.5 and not IsPedInAnyVehicle(ped) and not IsPedInAnyVehicle(npc) and not pedlist[npc] and not selectnpc and GetPedType(npc) ~= 28 then
					if IsControlJustPressed(0,38) then
						if emP.checkItens() then
							selectnpc = npc
							pedlist[npc] = true
							porcentagem = math.random(100)

							if porcentagem >= 1 and porcentagem <= 74 then
								segundos = 5
							elseif porcentagem >= 75 and porcentagem <= 87 then
								segundos = -1
								selectnpc = nil
								--emP.OcorrenciaDrogas()
							elseif porcentagem >= 01 then
								segundos = -1
								selectnpc = nil
								TaskSetBlockingOfNonTemporaryEvents(npc,true)
								pweapon = math.random(3)
								emP.OcorrenciaDrogas()
								if pweapon == 1 then
									GiveWeaponToPed(npc,0xA2719263,48,true,true)
								elseif pweapon == 2 then
									GiveWeaponToPed(npc,0x84BD7BFD,12,true,true)
								elseif pweapon == 3 then
									GiveWeaponToPed(npc,0x958A4A8F,60,true,true)
								end
								TaskShootAtEntity(npc,ped,15000,GetHashKey("FIRING_PATTERN_FULL_AUTO"))
							end

							repeat
								Citizen.Wait(10)
							until not selectnpc

							if porcentagem >= 1 and porcentagem <= 74 and segundos == 0 then
								emP.checkPayment()
							end

							concluido = true
						end
					end
				end
				concluido,npc = FindNextPed(random)
			until not concluido
			EndFindPed(random)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(600000)
		pedlist = {}
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TEXTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if segundos > 0 then
			drawTxt("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A NEGOCIAÇÃO",4,0.5,0.90,0.50,255,255,255,200)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMINUINDO O TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(selectnpc),true)
			if distancia <= 5 and not IsPedDeadOrDying(selectnpc) then
				segundos = segundos - 1
				if segundos == 0 then
					TaskPlayAnim(selectnpc,"mp_common","givetake1_a",3.0,3.0,-1,48,10,0,0,0)
					selectnpc = nil
				end
			else
				segundos = -1
				selectnpc = nil
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end