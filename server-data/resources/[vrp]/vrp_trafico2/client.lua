local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico2")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	-- LAVAGEM DE DINHEIRO
	{ ['id'] = 1, ['x'] = -65.06, ['y'] = -814.91, ['z'] = 243.39, ['text'] = "~y~VALIDAR NOTA DE RECEBIMENTO  ~r~(1 Nota de Recimento Falsa)", ['perm'] = "lavagem.permissao" },
	-- COCAINA
	--{ ['id'] = 2, ['x'] = 356.25,  	  ['y'] = 6466.80,  ['z'] = 30.20,   ['text'] = "COLHER ~y~FOLHA DE COCA", ['perm'] = "favela.permissao" },
	--{ ['id'] = 3, ['x'] = 356.57, ['y'] = 6469.25, ['z'] = 30.11,   ['text'] = "COLHER ~y~FOLHA DE COCA", ['perm'] = "favela.permissao" },
	{ ['id'] = 2, ['x'] = -938.19, ['y'] = -2932.49, ['z'] = 13.95,   ['text'] = "PEGAR ~y~PASTA BASE", ['perm'] = "campinho.permissao" },
	{ ['id'] = 2, ['x'] = 142.27, ['y'] = -2204.22, ['z'] = 4.69,   ['text'] = "PEGAR ~y~PASTA BASE", ['perm'] = "campinho.permissao" },
	-- CONTRABANDO
	{ ['id'] = 4, ['x'] = 717.0, ['y'] = -960.0, ['z'] = 30.4,  ['text'] = "COSTURAR ~y~CAPUZ  ~r~(8x Tecidos)", ['perm'] = "contrabandistas.permissao" },
	{ ['id'] = 5, ['x'] = 705.06, ['y'] = -960.69, ['z'] = 30.4, ['text'] = "~y~FORJAR UMA MASTERPICK  ~r~(1 chave)", ['perm'] = "contrabandistas.permissao" },
	{ ['id'] = 6, ['x'] = 708.3, ['y'] = -959.61, ['z'] = 30.4, ['text'] = "~y~FORJAR UM PAR DE ALGEMAS  ~r~(8 peças de ferro)", ['perm'] = "contrabandistas.permissao" }
	--[[MACONHA
	{ ['id'] = 4, ['x'] = 2219.87,    ['y'] = 5577.19,  ['z'] = 53.85,   ['text'] = "COLHER ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	{ ['id'] = 5, ['x'] = 2222.61, ['y'] = 5576.8, ['z'] = 53.82,   ['text'] = "COLETAR ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	--{ ['id'] = 3, ['x'] = 2223.4,    ['y'] = 5577.1,  ['z'] = 53.85,   ['text'] = "COLETAR ~y~RAMOS DE MACONHA", ['perm'] = "helipa.permissao" },
	{ ['id'] = 2, ['x'] = 114.18,     ['y'] = 6360.46, ['z'] = 32.30,  ['text'] = "PROCESSAR OS ~y~RAMOS DE MACONHA  ~r~(16x Ramos)", ['perm'] = "helipa.permissao" },
	{ ['id'] = 6, ['x'] = 118.22, ['y'] = 6362.66, ['z'] = 32.3,  ['text'] = "PROCESSAR OS ~y~RAMOS DE MACONHA  ~r~(16x Ramos)", ['perm'] = "helipa.permissao" },
	-- ECSTASY
	{ ['id'] = 7, ['x'] = -175.05,    ['y'] = 6169.46,  ['z'] = 31.20,   ['text'] = "PEGAR ~y~OCITOCINA SINTÉTICA", ['perm'] = "zeronze.permissao" },
	{ ['id'] = 8, ['x'] = 2856.01,    ['y'] = 4450.12,  ['z'] = 49.00,   ['text'] = "PROCESSAR E PRENSAR ~y~OCITOCINA  ~r~(16x OCitocina Sint.)", ['perm'] = "zeronze.permissao" },
	-- METANFETAMINA
	{ ['id'] = 10, ['x'] = 2331.17,   ['y'] = 3037.42, ['z'] = 48.15, ['text'] = "RETIRAR ~y~ÁCIDO DAS BATERIAS", ['perm'] = "helipa.permissao" },
	{ ['id'] = 11, ['x'] = 1493.14,   ['y'] = 6390.24, ['z'] = 21.25, ['text'] = "~y~PREPARAR ANFETAMINA  ~r~(16x Ácido de Bateria)", ['perm'] = "helipa.permissao" },
	-- LSD
	{ ['id'] = 40, ['x'] = -1108.76, ['y'] = 4952.06, ['z'] = 218.65, ['text'] = "PEGAR ~y~FUNGOS", ['perm'] = "zeronze.permissao" },
	{ ['id'] = 41, ['x'] = -1108.2, ['y'] = 4946.35, ['z'] = 218.65, ['text'] = "~y~PROCESSAR OS FUNGOS  ~r~(8x FUNGOS)", ['perm'] = "zeronze.permissao" },
	--DRIFT KING 
	--{ ['id'] = 15, ['x'] = 84.11,  ['y'] = -1963.97,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~LOCKPICK  ~r~(4000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	--{ ['id'] = 13, ['x'] = 82.46,  ['y'] = -1966.19,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~ÓXIDO NITROSO  ~r~(3000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	--{ ['id'] = 14, ['x'] = 80.06,   ['y'] = -1966.27,  ['z'] = 17.83,  ['text'] = "PEGAR ~y~PLACA   ~r~(5000x Dinheiro Sujo)", ['perm'] = "desmanche.permissao" },
	-- COLETE 1
	--{ ['id'] = 32, ['x'] = 713.33,    ['y'] = -969.99, ['z'] = 30.39, ['text'] = "COLETAR ~y~TECIDO", ['perm'] = "admin.permissao" },
	--{ ['id'] = 33, ['x'] = -1870.54,  ['y'] = 2062.06,  ['z'] = 135.43,  ['text'] = "COSTURAR ~y~COLETE  ~r~(8x Linhas)", ['perm'] = "bratva.permissao" },
	--{ ['id'] = 33, ['x'] = 713.33,['y'] = -969.99, ['z'] = 30.39,  ['text'] = "COSTURAR ~y~COLETE  ~r~(8x Tecidos)", ['perm'] = "admin.permissao" },
	--{ ['id'] = 34, ['x'] = 9.59, 	  ['y'] = 6506.31, ['z'] = 31.52, ['text'] = "COLETAR ~y~LINHA", ['perm'] = "abutres.permissao" },
	-- MECANICO
	{ ['id'] = 36, ['x'] = -199.48,   ['y'] = -1319.82,  ['z'] = 31.08,  ['text'] = "PEGAR ~y~ FERRAMENTA", ['perm'] = "mecanico.permissao" },
	-- ARMAS/MAFIA
	{ ['id'] = 37, ['x'] = 3592.4, ['y'] = 3680.24, ['z'] = 27.63,  ['text'] = "FORJAR ~y~ PEÇAS DE FERRO", ['perm'] = "milicia.permissao" },
	{ ['id'] = 38, ['x'] = 3594.21, ['y'] = 3682.64, ['z'] = 27.85,  ['text'] = "FORJAR ~y~ PEÇAS DE FERRO", ['perm'] = "milicia.permissao" },]]
} 
---------------------------------------------------------------------------------------------------------------------------------------
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
				DrawMarker(21,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,230,100,100,0,0,0,1)
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
