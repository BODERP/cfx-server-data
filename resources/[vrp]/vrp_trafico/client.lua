local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
-- COCAÍNA
{ ['id'] = 1, ['x'] = 681.59, ['y'] = -278.41, ['z'] = 69.95, 	['text'] = "~y~REFINAR COCAINA  ~r~(16 Pasta Base + 8 Produtos Químicos)", ['perm'] = "campinho.permissao" }, -- 844.6,-293.76,73.12
{ ['id'] = 1, ['x'] = 684.12, ['y'] = -279.87, ['z'] = 69.95, 	['text'] = "~y~REFINAR COCAINA  ~r~(16 Pasta Base + 8 Produtos Químicos)", ['perm'] = "campinho.permissao" }, -- 844.6,-293.76,73.12
{ ['id'] = 2, ['x'] = 689.57, ['y'] = -282.78, ['z'] = 69.72, 	['text'] = "~y~EMBALAR A COCAÍNA  ~r~(16 Po de coca + 8 ZipLock)", ['perm'] = "campinho.permissao" }, -- 844.32,-291.74,73.12
{ ['id'] = 2, ['x'] = 688.31, ['y'] = -284.86, ['z'] = 69.72, 	['text'] = "~y~EMBALAR A COCAÍNA  ~r~(16 Po de coca + 8 ZipLock)", ['perm'] = "campinho.permissao" }, -- 844.32,-291.74,73.12
-- MONTAR ARMAS 1
{ ['id'] = 3, ['x'] = -588.15, ['y'] = -1598.68, ['z'] = 27.02, ['text'] = "MONTAR UMA ~y~M1911  ~r~(300 Peças de ferro + 1 Projeto M1911)", ['perm'] = "reciclagem.permissao" },
{ ['id'] = 3, ['x'] = -586.94, ['y'] = -1598.7, ['z'] = 27.02, ['text'] = "MONTAR UMA ~y~M1911  ~r~(300 Peças de ferro + 1 Projeto M1911)", ['perm'] = "reciclagem.permissao" },
{ ['id'] = 5, ['x'] = -572.59, ['y'] = -1607.46, ['z'] = 27.02, ['text'] = "MONTAR UMA ~y~MICROSMG Uzi  ~r~(380 Peças de ferro + 1 Projeto UZI)", ['perm'] = "reciclagem.permissao" }, 
{ ['id'] = 6, ['x'] = -572.36, ['y'] = -1604.66, ['z'] = 27.02, ['text'] = "MONTAR UMA ~y~AK-47  ~r~(750 Peças de ferro + 1 Projeto AK-47)", ['perm'] = "reciclagem.permissao" }, 					 
-- MUNIÇÕES 1
{ ['id'] = 7, ['x'] = -585.12, ['y'] = -1601.87, ['z'] = 27.02, ['text'] = "FABRICAR MUNIÇÃO DE ~y~M1911  ~r~(20 Pólvoras + 20 Cápsulas)", ['perm'] = "reciclagem.permissao" }, 		 
{ ['id'] = 9, ['x'] = -574.92, ['y'] = -1605.57, ['z'] = 27.02, ['text'] = "FABRICAR MUNIÇÃO DE ~y~Uzi  ~r~(60 Pólvora + 20 Cápsula)", ['perm'] = "reciclagem.permissao" },
{ ['id'] = 10, ['x'] = -574.68, ['y'] = -1603.44, ['z'] = 27.02, ['text'] = "FABRICAR MUNIÇÃO DE ~y~AK47  ~r~(300 Pólvoras + 20 Cápsulas)", ['perm'] = "reciclagem.permissao" },
-- CONTRABANDO
{ ['id'] = 11, ['x'] = 713.33, ['y'] = -969.99, ['z'] = 30.39, ['text'] = "FABRICAR  ~y~ COLETE BALÍSTICO ~r~(20 Peças de ferro + 20 Tecidos)", ['perm'] = "contrabandista.permissao" },
{ ['id'] = 12, ['x'] = 711.48, ['y'] = -969.94, ['z'] = 30.4, ['text'] = "FABRICAR  ~y~ C4 ~r~ (20 Produtos químicos + 20 detonadores)", ['perm'] = "contrabandista.permissao" },
--[[ MACONHA
--{ ['id'] = 3, ['x'] = 1660.42, 	  ['y'] = -51.18,   ['z'] = 168.32,  ['text'] = "~y~ENROLAR OS BASEADOS  ~r~(16 Maconhas + 8 Seda)", ['perm'] = "helipa.permissao" },
--ECSTASY
{ ['id'] = 9, ['x'] = 844.31, ['y'] = -291.78, ['z'] = 73.12,   ['text'] = "~y~REVESTIR COMPRIMIDOS  ~r~(16 Ácido Anf. + 8 Glicerina)", ['perm'] = "zeronze.permissao" },
-- METANFETAMINA
{ ['id'] = 10, ['x'] = 1664.65, ['y'] = -49.79, ['z'] = 168.32,    ['text'] = "~y~PREPARAR METANFETAMINA  ~r~(16 Anfetaminas. + 8 Pipes)", ['perm'] = "helipa.permissao" },
-- LSD
{ ['id'] = 11, ['x'] = 847.3, ['y'] = -291.78, ['z'] = 73.12,    ['text'] = "~y~PREPARAR LSD  ~r~(16 Dietilaminas + 8 Ziplock)", ['perm'] = "zeronze.permissao" },]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- Gambiarra COM Permissão --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5) --Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.2 and not processo then
				drawTxt("PRESSIONE  ~r~E~w~  PARA "..v.text,4,0.5,0.90,0.50,255,255,255,200)
				if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
					if func.checkPayment(v.id) then
						TriggerEvent('cancelando',true)
						processo = true
						segundos = 10
					end
				end
			end
		end
		if processo then
			drawTxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ ~y~FINALIZAR O PROCESSO",4,0.5,0.90,0.50,255,255,255,200)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
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