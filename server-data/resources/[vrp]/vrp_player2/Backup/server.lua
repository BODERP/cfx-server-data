local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()
src = {}
Tunnel.bindInterface("vrp_player",src)
vDIAGNOSTIC = Tunnel.getInterface("vrp_diagnostic")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookgarmas = "https://discordapp.com/api/webhooks/762457825904820254/guuYYAsMJI1lsE-vIkj9-87O8DmSKI4jggUmMlxYO3HKI6KXqVukpWW6zxPAFcZR4YdC"
local webhookgarmas250 = "https://discordapp.com/api/webhooks/762457945354272808/CogmGgglcoV3hYV7YCpHK8LdWevwd7xUEB0YUvFTevQ92PGp0ISm3cD32REBK9oVaS22"
local webhookequipar = "https://discordapp.com/api/webhooks/762458070038609951/K-zPsUZJ8_NAhUKJKcdYCYjaQKBeuCDwrwgsVYW2-gSOmvO_wm0F7yt2z9jKVvKIellL"
local webhookenviaritem = "https://discordapp.com/api/webhooks/762458206085185556/qW9zJESKGXfNp63RfZAtBhIyxLfwbCr95mnVLsKpsd5wbypKrXzSUqRNHowX5q40buIr"
local webhookenviardinheiro = "https://discordapp.com/api/webhooks/762458401262534657/NU1-J1Lrdh2JoOePHMGf6ZG_VVrhHR31B3V9BtTVmeTd0w4kzrydUcv2fsbnd1kxtpVY"
local webhookdropar = "https://discordapp.com/api/webhooks/762458590040162304/0MiUEyCzHrTX1VlqnNzygypXNak3xcfL4-qMQjzVLyl9FETXCghUT5rjNAfqO3UH68_Q"
--local webhookpaypal = "https://discordapp.com/api/webhooks/744710618443153466/OXFaTjGBwhyacPSm228p5x0OCfoA_GLIYu95gRjohBMaVxvuE2HEMqTv13KFPvZHHAS3"
local webhookgive = "https://discordapp.com/api/webhooks/762458702523138079/TGy_UijQWCPr1_F5hFcW_Dnf6_Y5TPuhL4-oVqcKjB2KLReIx2QMpEcY-gZp_DuQ0nBJ"
local webhooksaquear = "https://discordapp.com/api/webhooks/762458807108108299/RwHauxs4zTmGIovPuAkBYIqAnZUNMUePhnw_fbx4_yd8WcPju22kqU2yZqysXNs7fGsm"
local disableShuffle = true

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkRoupas()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"platina.permissao") then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["laranja"] = { index = "laranja", nome = "Laranja" },
	["agua"] = { index = "agua", nome = "agua" },
	["nitro"] = { index = "nitro", nome = "Óxido Nitroso" },
	["tartaruga"] = { index = "tartaruga", nome = "Filhote de Tartaruga" },
	["carnedetartaruga"] = { index = "carnedetartaruga", nome = "Carne de Tartaruga" },
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo" },
	["reciclaveis"] = { index = "reciclaveis", nome = "Recicláveis" },
	["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia" },
	["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite" },
	["tora"] = { index = "tora", nome = "Tora de Madeira" },
	["alianca"] = { index = "alianca", nome = "Aliança" },
	["bandagem"] = { index = "bandagem", nome = "Bandagem" },
	["dorflex"] = { index = "dorflex", nome = "Dorflex" },
	["cicatricure"] = { index = "cicatricure", nome = "Cicatricure" },
	["dipiroca"] = { index = "dipiroca", nome = "Dipiroca" },
	["nocucedin"] = { index = "nocucedin", nome = "Nocucedin" },
	["paracetanal"] = { index = "paracetanal", nome = "Paracetanal" },
	["decupramim"] = { index = "decupramim", nome = "Decupramim" },
	["buscopau"] = { index = "buscopau", nome = "Buscopau" },
	["navagina"] = { index = "navagina", nome = "Navagina" },
	["analdor"] = { index = "analdor", nome = "Analdor" },
	["sefodex"] = { index = "sefodex", nome = "Sefodex" },
	["nokusin"] = { index = "nokusin", nome = "Nokusin" },
	["glicoanal"] = { index = "glicoanal", nome = "Glicoanal" },
	["batata"] = { index = "batata", nome = "Batata" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja" },
	["tequila"] = { index = "tequila", nome = "Tequila" },
	["vodka"] = { index = "vodka", nome = "Vodka" },
	["whisky"] = { index = "whisky", nome = "Whisky" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque" },
	["absinto"] = { index = "absinto", nome = "Absinto" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo" },
	["dinheirofalso"] = { index = "dinheirofalso", nome = "Dineiro Sujo" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos" },
	["repairkitdois"] = { index = "repairkitdois", nome = "Kit de Reparo" },
	["algemas"] = { index = "algemas", nome = "Algemas" },
	["capuz"] = { index = "capuz", nome = "Capuz" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick" },
	["pneus"] = { index = "pneus", nome = "Pneus", type = "usar" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick" },
	["militec"] = { index = "militec", nome = "Militec-1" },
	["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão" },
	["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo" },
	["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia" },
	["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo" },
	["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho" },
	["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote" },
	["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo" },
	["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma" },
	["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali" },
	["amora"] = { index = "amora", nome = "Amora" },
	["cereja"] = { index = "cereja", nome = "Cereja" },
	["graos"] = { index = "graos", nome = "Graos" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros" },
	["keycard"] = { index = "keycard", nome = "Keycard" },
	["isca"] = { index = "isca", nome = "Isca" },
	["dourado"] = { index = "dourado", nome = "Dourado" },
	["corvina"] = { index = "corvina", nome = "Corvina" },
	["salmao"] = { index = "salmao", nome = "Salmão" },
	["pacu"] = { index = "pacu", nome = "Pacu" },
	["pintado"] = { index = "pintado", nome = "Pintado" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré" },
	["lambari"] = { index = "lambari", nome = "Lambari" },
	["cacao"] = { index = "cacao", nome = "Cação" },
	["piava"] = { index = "piava", nome = "Piava" },
	["arraia"] = { index = "arraia", nome = "Arraia" },
	["cherne"] = { index = "cherne", nome = "Cherne" },
	["caranha"] = { index = "caranha", nome = "Caranha" },
	["viola"] = { index = "viola", nome = "Viola" },
	["pargo"] = { index = "pargo", nome = "Pargo" },
	["badejo"] = { index = "badejo", nome = "Badejo" },
	["budiao"] = { index = "budiao", nome = "Budião" },
	["energetico"] = { index = "energetico", nome = "Energético" },
	["mochila"] = { index = "mochila", nome = "Mochila" },
	---------------------------------------------------------------------------------------------------
	--[ Remédios ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["paracetamil"] = { index = "paracetamil", nome = "Paracetamil" },
	["voltarom"] = { index = "voltarom", nome = "Voltarom" },
	["trandrylux"] = { index = "trandrylux", nome = "Trandrylux" },
	["dorfrex"] = { index = "dorfrex", nome = "Dorfrex" },
	["buscopom"] = { index = "buscopom", nome = "Buscopom" },
	---------------------------------------------------------------------------------------------------
	--[ Receitas ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	["r-paracetamil"] = { index = "r-paracetamil", nome = "Receituário Paracetamil" },
	["r-voltarom"] = { index = "r-voltarom", nome = "Receituário Voltarom" },
	["r-trandrylux"] = { index = "r-trandrylux", nome = "Receituário Trandrylux" },
	["r-dorfrex"] = { index = "r-dorfrex", nome = "Receituário Dorfrex" },
	["r-buscopom"] = { index = "r-buscopom", nome = "Receituário Buscopom" },
	---------------------------------------------------------------------------------------------------
	-- Maconha ------------------------------------------------------------------------------------------------------
	["maconha"] = { index = "maconha", nome = "Maconha" },
	["ramosdemaconha"] = { index = "ramosdemaconha", nome = "Ramo de Maconha" },
	["maconhanaoprocessada"] = { index = "maconhanaoprocessada", nome = "Maconha não Processada" },
	["maconhamisturada"] = { index = "maconhamisturada", nome = "Maconha Misturada" },
	["baseado"] = { index = "baseado", nome = "Baseado" },
	["seda"] = { index = "seda", nome = "Seda" },
	["receita1"] = { index = "receita1", nome = "Receita Médica" },
	["receita2"] = { index = "receita2", nome = "Receita Médica" },
	-- Ecstasy ----------------------------------------------------------------------------------------------------
	["ocitocina"] = { index = "ocitocina", nome = "Ocitocina Sintética" },
	["ociacido"] = { index = "ociacido", nome = "Ácido Anf. Desidratado" },
	["primaecstasy"] = { index = "primaecstasy", nome = "Matéria Prima - Ecstasy" },
	["ecstasy"] = { index = "ecstasy", nome = "Ecstasy" },
	["glicerina"] = { index = "glicerina", nome = "Glicerina" },
	-----------------------------------------------------------------------------------------------------------------
	-- Lavagem de Dinheiro ------------------------------------------------------------------------------------------
	["impostoderenda"] = { index = "impostoderenda", nome = "Imposto de Renda" },
	["impostoderendafalso"] = { index = "impostoderendafalso", nome = "Imposto de Renda Falso" },
	-----------------------------------------------------------------------------------------------------------------
	-- Lavagem de Dinheiro ------------------------------------------------------------------------------------------
	["notarecebimento"] = { index = "notarecebimento", nome = "Nota de Recebimento" },
	["notarecebimentofalso"] = { index = "notarecebimentofalso", nome = "Nota de Recebimento Falsa" },
	-----------------------------------------------------------------------------------------------------------------
	["adubo"] = { index = "adubo", nome = "Adubo" },
	["fertilizante"] = { index = "fertilizante", nome = "Fertilizante" },
	["capsula"] = { index = "capsula", nome = "Cápsula" },
	["polvora"] = { index = "polvora", nome = "Pólvora" },
	["orgaos"] = { index = "orgaos", nome = "Órgãos" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive" },
	["notebook"] = { index = "notebook", nome = "Notebook" },
	["placa"] = { index = "placa", nome = "Placa" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado" },
	["carteiraroubada"] = {  index = "carteiraroubada", nome = "Carteira Roubada"  },
	["tabletroubado"] = {  index = "tabletroubado", nome = "Tablet Roubado"  },
	["sapatosroubado"] = {  index = "sapatosroubado", nome = "Sapatos Roubado"  },
	["vibradorroubado"] = { index = "vibradorroubado", nome = "Vibrador Roubado" },
	["perfumeroubado"] = { index = "perfumeroubado", nome = "Perfume Roubado" },
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca" },
	["pastadecoca"] = { index = "pastadecoca", nome = "Pasta de Coca" },
	["cocamisturada"] = { index = "cocamisturada", nome = "Cocaína Misturada" },
	["cocaina"] = { index = "cocaina", nome = "Cocaína" },
	["ziplock"] = { index = "ziplock", nome = "Saco ZipLock" },
	["fungo"] = { index = "fungo", nome = "Fungo" },
	["dietilamina"] = { index = "dietilamina", nome = "Dietilamina" },
	["lsd"] = { index = "lsd", nome = "LSD" },
	["acidobateria"] = { index = "acidobateria", nome = "Ácido de Bateria" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina" },
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina" },
	["cristal"] = { index = "cristal", nome = "Cristal de Metanfetamina" },
	["pipe"] = { index = "pipe", nome = "Pipe" },
	["armacaodearma"] = { index = "armacaodearma", nome = "Armação de Arma" },
	-----------------------------
	-- FARM YAKUZA
	-----------------------------
	["celular"] = { index = "celular", nome = "Celular" },
	["celulardesbloqueado"] = { index = "celulardesbloqueado", nome = "Celular Desbloqueado" },
	["celularroubado"] = { index = "celularroubado", nome = "Celular Roubado" },
	-----------------------------
	-- FARM BRATVA
	-----------------------------
	["tecido"] = { index = "tecido", nome = "Tecido" },
	["colete"] = { index = "colete", nome = "Colete" },
	-----------------------------
	["pecadeferro"] = { index = "aco", nome = "Peça de Ferro" },
	["chave"] = { index = "chave", nome = "Chave" },
	["logsinvasao"] = { index = "logsinvasao", nome = "L. Inv. Banco" },
	["keysinvasao"] = { index = "keysinvasao", nome = "K. Inv. Banco" },
	["pendriveinformacoes"] = { index = "pendriveinformacoes", nome = "P. com Info." },
	["acessodeepweb"] = { index = "acessodeepweb", nome = "P. DeepWeb" },
	["diamante"] = { index = "diamante", nome = "Min. Diamante" },
	["ouro"] = { index = "ouro", nome = "Min. Ouro" },
	["bronze"] = { index = "bronze", nome = "Min. Bronze" },
	["ferro"] = { index = "ferro", nome = "Min. Ferro" },
	["rubi"] = { index = "rubi", nome = "Min. Rubi" },
	["esmeralda"] = { index = "esmeralda", nome = "Min. Esmeralda" },
	["safira"] = { index = "safira", nome = "Min. Safira" },
	["topazio"] = { index = "topazio", nome = "Min. Topazio" },
	["ametista"] = { index = "ametista", nome = "Min. Ametista" },
	["diamante2"] = { index = "diamante2", nome = "Diamante" },
	["ouro2"] = { index = "ouro2", nome = "Ouro" },
	["bronze2"] = { index = "bronze2", nome = "Bronze" },
	["ferro2"] = { index = "ferro2", nome = "Ferro" },
	["rubi2"] = { index = "rubi2", nome = "Rubi" },
	["esmeralda2"] = { index = "esmeralda2", nome = "Esmeralda" },
	["safira2"] = { index = "safira2", nome = "Safira" },
	["topazio2"] = { index = "topazio2", nome = "Topazio" },
	["ametista2"] = { index = "ametista2", nome = "Ametista" },
	["ingresso"] = { index = "ingresso", nome = "Ingresso Eventos" },
	["radio"] = { index = "radio", nome = "Radio" },
	["serra"] = { index = "serra", nome = "Serra" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira" },
	["c4"] = { index = "c4", nome = "C-4" },
	["roupas"] = { index = "roupas", nome = "Roupas" },
	["xerelto"] = { index = "xerelto", nome = "Xerelto" },
	["coumadin"] = { index = "coumadin", nome = "Coumadin" },
	["detonador"] = { index = "detonador", nome = "Detonador" },
	["ferramentas"] = { index = "ferramentas", nome = "Ferramentas Pesadas" },
	["projetoassaultrifle"] = { index = "projetoassaultrifle", nome = "Projeto Ak-47" },
	["projetoassaultsmg"] = { index = "projetoassaultsmg", nome = "Projeto SMG" },
	["projetobullpuprifle"] = { index = "projetobullpuprifle", nome = "Projeto QBZ" },
	["projetocarbinerifle"] = { index = "projetocarbinerifle", nome = "Projeto M4A1" },
	["projetocombatpdw"] = { index = "projetocombatpdw", nome = "Projeto MPX" },
	["projetocombatpistol"] = { index = "projetocombatpistol", nome = "Projeto Glock 19" },
	["projetogusenberg"] = { index = "projetogusenberg", nome = "Projeto Thompson" },
	["projetopistol"] = { index = "projetopistol", nome = "Projeto M1911" },
	["projetopumpshotgun"] = { index = "projetopumpshotgun", nome = "Projeto Shotgun" },
	["projetosawnoffshotgun"] = { index = "projetosawnoffshotgun", nome = "Projeto Shot Cano Serrado" },
	["projetosmg"] = { index = "projetosmg", nome = "Projeto MP5" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês" },
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra" },
	["wbody|WEAPON_PISTOL"] = { index = "m1911", nome = "M1911" }, -- WEAPON_PISTOL
	["wbody|WEAPON_APPISTOL"] = { index = "appistol", nome = "AP Pistol" }, -- AP Pistol
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven" },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19" },  -- WEAPON_COMBATPISTOL
	["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10" },
	["wbody|WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44" },
	["wbody|WEAPON_REVOLVER_MK2"] = { index = "magnum357", nome = "Magnum 357" },
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador" },
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor" },
	["wbody|WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi" },
	["wbody|WEAPON_SMG"] = { index = "smg", nome = "SMG" }, -- WEAPON_SMG
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mag-pdr", nome = "MAG-PDR" }, -- WEAPON_ASSAULTSMG
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX" }, -- WEAPON_COMBATPDW
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a1", nome = "M4A1" }, -- WEAPON_CARBINERIFLE
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak47", nome = "AK-47" }, -- WEAPON_ASSAULTRIFLE
	["wbody|WEAPON_BULLPUPRIFLE"] = { index = "qbz", nome = "QBZ" }, -- WEAPON_BULLPUPRIFLE
	["wammo|WEAPON_BULLPUPRIFLE"] = { index = "m-qbz", nome = "M.QBZ" }, -- WEAPON_BULLPUPRIFLE
	["wbody|WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson" }, -- WEAPON_GUSENBERG
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9" },
	["wbody|WEAPON_CARBINERIFLE_MK2"] = { index = "mpx", nome = "MPX" },
	["wbody|WEAPON_COMPACTRIFLE"] = { index = "aks", nome = "AKS-74U" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina" },
	["wbody|WEAPON_PUMPSHOTGUN"] = { index = "shotgun", nome = "Shotgun" }, -- WEAPON_PUMPSHOTGUN
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = { index = "sawnoffshotgun", nome = "Shotgun C.Serrado" }, -- WEAPON_SAWNOFFSHOTGUN
	["wammo|WEAPON_SAWNOFFSHOTGUN"] = { index = "m-sawnoffshotgun", nome = "M.Shotgun C.Serrado" }, -- WEAPON_SAWNOFFSHOTGUN
	["wammo|WEAPON_PISTOL"] = { index = "m-m1911", nome = "M.M1911" }, -- WEAPON_PISTOL
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.Five Seven" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19" }, -- WEAPON_COMBATPISTOL
	["wammo|WEAPON_APPISTOL"] = { index = "m-appistol", nome = "M. AP Pistol" }, -- WEAPON_APPISTOL
	["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "M.HK P7M10" },
	["wammo|WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "M.M1922" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44" },
	["wammo|WEAPON_REVOLVER_MK2"] = { index = "m-magnum357", nome = "M.Magnum 357" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor" },
	["wammo|WEAPON_MICROSMG"] = { index = "m-uzi", nome = "M.Uzi" },
	["wammo|WEAPON_SMG"] = { index = "m-smg", nome = "M.SMG" }, -- WEAPON_SMG
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mag-pdr", nome = "M.MAG-PDR" },  -- WEAPON_ASSAULTSMG
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer MPX" }, -- WEAPON_COMBATPDW
	["wammo|WEAPON_PUMPSHOTGUN"] = { index = "m-shotgun", nome = "M.Shotgun" }, -- WEAPON_PUMPSHOTGUN
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a1", nome = "M.M4A1" },  -- WEAPON_CARBINERIFLE
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak47", nome = "M.AK-47" }, -- WEAPON_ASSAULTRIFLE
	["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.Tec-9" },
	["wammo|WEAPON_CARBINERIFLE_MK2"] = { index = "m-mpx", nome = "M.MPX" },
	["wammo|WEAPON_COMPACTRIFLE"] = { index = "m-aks", nome = "M.AKS-74U" },
	["wammo|WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "M.Thompson" },  -- WEAPON_GUSENBERG
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] and itemlist[args[1]] ~= nil then
			vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
			SendWebhookMessage(webhookgive,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU]: "..args[1].." \n[QUANTIDADE]: "..vRP.format(parseInt(args[2])).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER VEHS [ADMIN]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"admin.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- reskin
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reskin',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
	vRPclient._setCustomization(vRPclient.getCustomization(source))		
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVASAO
-----------------------------------------------------------------------------------------------------------------------------------------
local guetos = {}
RegisterCommand('invasao',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"helipa.permissao") or vRP.hasPermission(user_id,"mare.permissao") or vRP.hasPermission(user_id,"kennedy.permissao") or vRP.hasPermission(user_id,"vidigal.permissao") or vRP.hasPermission(user_id,"helipa.permissao") then	
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						if vRP.hasPermission(user_id,"helipa.permissao") then
							guetos[id] = vRPclient.addBlip(player,x,y,z,437,27,"Localização da invasão",0.8,false)
							TriggerClientEvent("Notify",player,"negado","Localização da invasão entre gangues recebida de <b>Ballas</b>.")
						elseif vRP.hasPermission(user_id,"vidigal.permissao") then
							guetos[id] = vRPclient.addBlip(player,x,y,z,437,46,"Localização da invasão",0.8,false)
							TriggerClientEvent("Notify",player,"negado","Localização da invasão entre gangues recebida de <b>Milícia</b>.")
						elseif vRP.hasPermission(user_id,"kennedy.permissao") then
							guetos[id] = vRPclient.addBlip(player,x,y,z,437,25,"Localização da invasão",0.8,false)
							TriggerClientEvent("Notify",player,"negado","Localização da invasão entre gangues recebida de <b>CV</b>.")
						elseif vRP.hasPermission(user_id,"mare.permissao") then
							guetos[id] = vRPclient.addBlip(player,x,y,z,437,38,"Localização da invasão",0.8,false)
							TriggerClientEvent("Notify",player,"negado","Localização da invasão entre gangues recebida de <b>TCP</b>.")
						end
						vRPclient._playSound(player,"5s_To_Event_Start_Countdown","GTAO_FM_Events_Soundset")
						vRPclient._playSound(source,"5s_To_Event_Start_Countdown","GTAO_FM_Events_Soundset")
						SetTimeout(60000,function() vRPclient.removeBlip(player,guetos[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--FIX PARA TODOS QUANDO NÃO TEM MECÂNICO
--------------------------------------------------------------------------------------------
RegisterCommand('recuperar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mecanico = vRP.getUsersByPermission("mecanico.permissao")
	if parseInt(#mecanico) >= 1 then 
        TriggerClientEvent("Notify",source,"sucesso","Há mecânicos em serviço") 
	else
	local vehicle = vRPclient.getNearestVehicle(source,11)
		if vehicle then
				if vRP.tryPayment(user_id,2000) then
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,60000,"reparando")
				Citizen.Wait(60000)
				TriggerClientEvent('reparar',source,vehicle)
				vRPclient._stopAnim(source,false)
				TriggerClientEvent("Notify",source,"sucesso","Você consertou seu carro por <b>R$2.000,00 reais</b>.")
			else
				TriggerClientEvent("Notify",source,"negado","Você está sem <b>Dinheiro</b>.")
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------------
-- ID
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('revistar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(user_id)
		local weapons = vRPclient.getWeapons(nplayer)
		local money = vRP.getMoney(nuser_id)
		local data = vRP.getUserDataTable(nuser_id)

		TriggerClientEvent('cancelando',source,true)
		TriggerClientEvent('cancelando',nplayer,true)
		TriggerClientEvent('carregar',nplayer,source)
		--[[vRPclient._playAnim(source,false,{{"misscarsteal4@director_grip","end_loop_grip"}},true)
		vRPclient._playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
		TriggerClientEvent("progress",source,5000,"revistando")
		SetTimeout(5000,function()]]

			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
			if data and data.inventory then
				for k,v in pairs(data.inventory) do
					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k))
				end
			end
			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
			for k,v in pairs(weapons) do
				if v.ammo < 1 then
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k))
				else
					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k).." | "..vRP.format(parseInt(v.ammo)).."x Munições")
				end
			end

			--vRPclient._stopAnim(source,false)
			vRPclient._stopAnim(nplayer,false)
			TriggerClientEvent('cancelando',source,false)
			TriggerClientEvent('cancelando',nplayer,false)
			TriggerClientEvent('carregar',nplayer,source)
			TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
		--end)
		TriggerClientEvent("Notify",nplayer,"aviso","Você está sendo <b>Revistado</b>.")
		--TriggerClientEvent("Notify",nplayer,"aviso","Revistado por <b>"..identity.name.." "..identity.firstname.."</b>.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
local salarios = {
	-- Vips --------------------------------------------------------------------------------
	--{ ['permissao'] = "bronze.permissao", ['nome'] = "BRONZE", ['payment'] = 2500 },
	--{ ['permissao'] = "prata.permissao", ['nome'] = "PRATA", ['payment'] = 4000 },
	{ ['permissao'] = "ouro.permissao", ['nome'] = "OURO", ['payment'] = 150 },
	{ ['permissao'] = "platina.permissao", ['nome'] = "PLATINA", ['payment'] = 200 },
	{ ['permissao'] = "diamante.permissao", ['nome'] = "DIAMANTE", ['payment'] = 250 },
	-- Polícia -----------------------------------------------------------------------------
	{ ['permissao'] = "policial.servico", ['nome'] = "SOLDADO", ['payment'] = 100 },
	{ ['permissao'] = "sargento.servico", ['nome'] = "SARGENTO", ['payment'] = 125 },
	{ ['permissao'] = "investigador.servico", ['nome'] = "INVESTIGADOR", ['payment'] = 150 },
	{ ['permissao'] = "capitao.servico", ['nome'] = "CAPITAO", ['payment'] = 150 },
	{ ['permissao'] = "comando.servico", ['nome'] = "COMANDANTE", ['payment'] = 200 },
	-- Hospital -----------------------------------------------------------------------------
	{ ['permissao'] = "enfermeiro.servico", ['nome'] = "ENFERMEIRO", ['payment'] = 150 },
	{ ['permissao'] = "medico.servico", ['nome'] = "MEDICO", ['payment'] = 200 },
	{ ['permissao'] = "diretor.servico", ['nome'] = "DIRETOR", ['payment'] = 250 },
	-- Mecânica -----------------------------------------------------------------------------
	{ ['permissao'] = "chefe.permissao", ['nome'] = "MECANICO", ['payment'] = 100 },
	{ ['permissao'] = "mecanico.permissao", ['nome'] = "MECANICO", ['payment'] = 75 },
	{ ['permissao'] = "ajudante.permissao", ['nome'] = "MECANICO", ['payment'] = 50 },
	-- Taxistas -----------------------------------------------------------------------------
	{ ['permissao'] = "chefetaxista.servico", ['nome'] = "CHEFETAXISTAS", ['payment'] = 100 }
	{ ['permissao'] = "executivo.servico", ['nome'] = "TAXISTAEXECUTIVO", ['payment'] = 75 }
	{ ['permissao'] = "convencional.servico", ['nome'] = "TAXISTACONVENCIONAL", ['payment'] = 50 }
}

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(salarios) do
			if vRP.hasPermission(user_id,v.permissao) then
				TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
				TriggerClientEvent("Notify",source,"importante","Obrigado por colaborar com a cidade, seu salário de <b>R$"..vRP.format(parseInt(v.payment)).." reais</b> foi depositado.")
				vRP.giveBankMoney(user_id,parseInt(v.payment))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AFKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,"admin.permissao") then
        DropPlayer(source,"Voce foi desconectado por ficar ausente.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /SEQUESTRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do porta-malas.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tratamento',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"paramedico.permissao") then
        local nplayer = vRPclient.getNearestPlayer(source,3)
        if nplayer then
            if not vRPclient.isComa(nplayer) then
                TriggerClientEvent("tratamento",nplayer)
                TriggerClientEvent("Notify",source,"sucesso","Tratamento no paciente iniciado com sucesso.",10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('motor',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,3)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if mPlaca then
		if not vRPclient.isInVehicle(source) then
			if vRP.hasPermission(user_id,"mecanico.permissao") then
				if user_id ~= mPlacaUser then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('repararmotor',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"aviso","Não pode efetuar reparos em seu próprio veículo.")
				end
			else
				if vRP.tryGetInventoryItem(user_id,"militec",1) then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('repararmotor',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Militec-1</b> para reparar o motor.")
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
		end
	end
end)

RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('reparar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mPlaca = vRPclient.ModelName(source,3)
	local mPlacaUser = vRP.getUserByRegistration(mPlaca)
	if mPlaca then
		if not vRPclient.isInVehicle(source) then
			if vRP.hasPermission(user_id,"mecanico.permissao") then
				if user_id ~= mPlacaUser then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('reparar',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"aviso","Não pode efetuar reparos em seu próprio veículo.")
				end
			else
				if vRP.tryGetInventoryItem(user_id,"repairkit",1) then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
					TriggerClientEvent("progress",source,30000,"reparando")
					SetTimeout(30000,function()
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('reparar',source)
						vRPclient._stopAnim(source,false)
					end)
				else
					TriggerClientEvent("Notify",source,"negado","Precisa de um <b>Kit de Reparos</b> para reparar o motor.")
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Precisa estar próximo ou fora do veículo para efetuar os reparos.")
		end
	end
end)

RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENVIAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	local identity = vRP.getUserIdentity(user_id)
  	local identitynu = vRP.getUserIdentity(nuser_id)
	--[[if nuser_id and args[1] and parseInt(args[2]) > 0 then
		for k,v in pairs(itemlist) do
			if args[1] == v.index then
				if vRP.getInventoryWeight(nuser_id)+vRP.getItemWeight(k)*parseInt(args[2]) <= vRP.getInventoryMaxWeight(nuser_id) then
					if vRP.tryGetInventoryItem(user_id,k,parseInt(args[2])) then
						vRP.giveInventoryItem(nuser_id,k,parseInt(args[2]))
						vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent("Notify",source,"sucesso","Enviou <b>"..vRP.format(parseInt(args[2])).."x "..v.nome.."</b>.",8000)
						vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
						TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>"..vRP.format(parseInt(args[2])).."x "..v.nome.."</b>.",8000)
						SendWebhookMessage(webhookenviaritem,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: "..vRP.format(parseInt(args[2])).." "..v.nome.." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end
				end
			end
		end]]
	if nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[1])).." reais</b>.",8000)
			vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." reais</b>.",8000)
			SendWebhookMessage(webhookenviardinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[1])).." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.",8000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})
		for k,v in pairs(weapons) do
			vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			end
			SendWebhookMessage(webhookgarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList("wbody|"..k).." \n[QUANTIDADE]: "..v.ammo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			if v.ammo == 250 then 
				SendWebhookMessage(webhookgarmas250,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[TENTOU USAR MONSTERMENU E FOI PEGO NO PULO] \n>>>> [GUARDOU]: "..vRP.itemNameList("wbody|"..k).." \n[QUANTIDADE]: "..v.ammo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&641048265856647169>")
			end
		end
		TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('roubar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia > 0 then
			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo?",30) then
				local vida = vRPclient.getHealth(nplayer)
				if vida <= 100 then
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
					TriggerClientEvent("progress",source,30000,"roubando")
					SetTimeout(30000,function()
						local ndata = vRP.getUserDataTable(nuser_id)
						if ndata ~= nil then
							if ndata.inventory ~= nil then
								for k,v in pairs(ndata.inventory) do
									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
											vRP.giveInventoryItem(user_id,k,v.amount)
										end
									else
										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
									end
								end
							end
						end
						local weapons = vRPclient.replaceWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
							end
							if v.ammo > 0 then
								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
								end
							end
						end
						local nmoney = vRP.getMoney(nuser_id)
						if vRP.tryPayment(nuser_id,nmoney) then
							vRP.giveMoney(user_id,nmoney)
						end
						vRPclient.setStandBY(source,parseInt(600))
						vRPclient._stopAnim(source,false)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
					end)
				else
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					TriggerClientEvent("Notify",source,"sucesso","Roubo concluido com sucesso.")
				end
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa está resistindo ao roubo.")
			end
		else
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Saquear
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('saquear',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if vRPclient.isInComa(nplayer) then
			local identity_user = vRP.getUserIdentity(user_id)
			local nuser_id = vRP.getUserId(nplayer)
			local nidentity = vRP.getUserIdentity(nuser_id)
			local policia = vRP.getUsersByPermission("policia.permissao")
			local itens_saque = {}
			if #policia >= 0 then
				local vida = vRPclient.getHealth(nplayer)
				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
				TriggerClientEvent("progress",source,20000,"saqueando")
				SetTimeout(20000,function()
					local ndata = vRP.getUserDataTable(nuser_id)
					if ndata ~= nil then
						if ndata.inventory ~= nil then
							for k,v in pairs(ndata.inventory) do
								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
										vRP.giveInventoryItem(user_id,k,v.amount)
										table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList(k).." [QUANTIDADE]: "..v.amount)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(k).."</b> por causa do peso.")
								end
							end
						end
					end
					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
								table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wbody|"..k).." [QUANTIDADE]: "..1)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
						end
						if v.ammo > 0 then
							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
									table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wammo|"..k).." [QTD]: "..v.ammo)
								end
							else
								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
							end
						end
					end
					local nmoney = vRP.getMoney(nuser_id)
					if vRP.tryPayment(nuser_id,nmoney) then
						vRP.giveMoney(user_id,nmoney)
					end
					vRPclient.setStandBY(source,parseInt(600))
					vRPclient._stopAnim(source,false)
					TriggerClientEvent('cancelando',source,false)
					local apreendidos = table.concat(itens_saque, "\n")
					TriggerClientEvent("Notify",source,"importante","Saque concluido com sucesso.")
					SendWebhookMessage(webhooksaquear,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.."\n[SAQUEOU]: "..nuser_id.." "..nidentity.name.." " ..nidentity.firstname .. "\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end)
			else
				TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você só pode saquear quem está em coma.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('ligar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false
		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
			especialidade = "polícia militar"
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("paramedico.permissao")
			especialidade = "samu"
		elseif args[1] == "197" then
			players = vRP.getUsersByPermission("pcivil.permissao")
			especialidade = "policia civil"
		elseif args[1] == "mec" then
			players = vRP.getUsersByPermission("mecanico.permissao")
			especialidade = "mecânicos"
		elseif args[1] == "taxi" then
			players = vRP.getUsersByPermission("taxista.permissao")
			especialidade = "taxistas"
		elseif args[1] == "adv" then
			players = vRP.getUsersByPermission("advogado.permissao")
			especialidade = "advogados"
		elseif args[1] == "adm" then
			players = vRP.getUsersByPermission("admin.permissao")	
			especialidade = "Administradores"
		end
		local adm = ""
		if especialidade == "Administradores" then
			adm = "[ADM] "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		if #players == 0  and especialidade ~= "policiais" then
			TriggerClientEvent("Notify",source,"importante","Não há "..especialidade.." em serviço.")
		else
			local identitys = vRP.getUserIdentity(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player and player ~= uplayer then
					async(function()
						vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
						TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
						local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
						if ok then
							if not answered then
								answered = true
								local identity = vRP.getUserIdentity(nuser_id)
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								vRPclient._setGPS(player,x,y)
							else
								TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
								vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
						local id = idgens:gen()
						blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
						SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MEC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mec',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"mecanico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Central Benny's",{255,128,0},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mr',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "mecanico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,191,128},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CARTAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('card',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local cd = math.random(1,13)
		local naipe = math.random(1,4)
		TriggerClientEvent('CartasMe',-1,source,identity.name,cd,naipe)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('ChatMe')
AddEventHandler('ChatMe',function(text)
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerClientEvent('DisplayMe',-1,text,source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /card
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('card',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local cd = math.random(1,13)
		local naipe = math.random(1,4)
		TriggerClientEvent('CartasMe',-1,source,identity.name,cd,naipe)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmascara",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setblusa",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcolete",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setjaqueta",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setmaos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setcalca",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setacessorios",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setsapatos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setchapeu",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if user_id then
					TriggerClientEvent("setoculos",source,args[1],args[2])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
    ["mecanico"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 12,0 },
			[4] = { 39,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { 109,0 },
			[8] = { 89,0 },
			[9] = { 14,0 },
			[10] = { -1,0 },
			[11] = { 66,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 38,0 },
			[5] = { -1,0 },
			[6] = { 24,0 },
			[7] = { 2,0 },
			[8] = { 56,0 },
			[9] = { 35,0 },
			[10] = { -1,0 },
			[11] = { 59,0 }
		}
	},
	["minerador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 99,1 },
			[4] = { 89,20 },
			[5] = { -1,0 },
			[6] = { 82,2 },
			[7] = { -1,0 },
			[8] = { 90,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 273,0 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 114,1 },
			[4] = { 92,20 },
			[5] = { -1,0 },
			[6] = { 86,2 },
			[7] = { -1,0 },
			[8] = { 54,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 286,0 },
			["p1"] = { 25,0 }
		}
	},
    ["lixeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 17,0 },
			[4] = { 36,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 59,0 },
			[10] = { -1,0 },
			[11] = { 57,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 18,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 26,0 },
			[7] = { -1,0 },
			[8] = { 36,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 50,0 }
		}
	},
	--[[ ["carteiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 17,10 },
			[5] = { 40,0 },
			[6] = { 7,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 242,3 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 14,1 },
			[5] = { 40,0 },
			[6] = { 10,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 250,3 }
		}
	},]]
	--[[["fazendeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 37,0 },
			[4] = { 7,0 },
			[5] = { -1,0 },
			[6] = { 15,6 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 95,2 },
			["p0"] = { 105,23 },
			["p1"] = { 5,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 45,0 },
			[4] = { 25,10 },
			[5] = { -1,0 },
			[6] = { 21,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 171,4 },
			["p0"] = { 104,23 },
			["p1"] = { 11,2 }
		}
	},]]
	["lenhador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 62,0 },
			[4] = { 89,23 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p0"] = { 77,13 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 71,0 },
			[4] = { 92,23 },
			[5] = { -1,0 },
			[6] = { 69,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p1"] = { 25,0 }
		}
	},
	["taxista"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 11,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 10,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 13,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 112,0 },
			[5] = { -1,0 },
			[6] = { 6,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 }
		}
	},
	["caminhoneiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 63,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 81,0 },
			[10] = { -1,0 },
			[11] = { 173,3 },
			["p1"] = { 8,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 74,5 },
			[5] = { -1,0 },
			[6] = { 9,0 },
			[7] = { -1,0 },
			[8] = { 92,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 175,3 },
			["p1"] = { 11,0 }
		}
	},
	["motocross"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 111,0 },
			[4] = { 67,3 },
			[5] = { -1,0 },
			[6] = { 47,3 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 152,0 },
			["p1"] = { 25,5 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 128,0 },
			[4] = { 69,3 },
			[5] = { -1,0 },
			[6] = { 48,3 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 149,0 },
			["p1"] = { 27,5 }
		}
	},
	["mergulho"] = {
		[1885233650] = {
			[1] = { 122,0 },
			[3] = { 31,0 },
			[4] = { 94,0 },
			[5] = { -1,0 },
			[6] = { 67,0 },
			[7] = { -1,0 },
			[8] = { 123,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 243,0 },			
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 122,0 },
			[3] = { 18,0 },
			[4] = { 97,0 },
			[5] = { -1,0 },
			[6] = { 70,0 },
			[7] = { -1,0 },
			[8] = { 153,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 251,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pelado"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 34,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 35,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 82,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 61,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 104,0 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 57,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },		
			[8] = { 7,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 105,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["gesso"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 84,9 },
			[5] = { -1,0 },
			[6] = { 13,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 186,9 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 3,0 },
			[4] = { 86,9 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },		
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 188,9 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	--[[ ["leiteiro"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 74,0 }, -- maos
			[4] = { 89,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 51,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 271,0 }, -- jaqueta		
			["p0"] = { 105,22 }, -- chapeu
			["p1"] = { 23,0 }, -- oculos
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 85,0 }, -- maos
			[4] = { 92,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 52,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 141,0 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 3,9 }, -- oculos
		}
	},]]
	["motorista"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 10,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 21,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 242,1 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 7,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 37,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 27,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 250,1 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	--[[ ["cacador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 97,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 2,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 100,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 44,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}, ]]
	["pescador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 98,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 85,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 247,12 }, -- jaqueta		
			["p0"] = { 104,20 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 101,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 88,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 255,13 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 11,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}


RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if not vRP.searchReturn(source,user_id) then
				if args[1] then
					local custom = roupas[tostring(args[1])]
					if custom then
						local old_custom = vRPclient.getCustomization(source)
						local idle_copy = {}

						idle_copy = vRP.save_idle_custom(source,old_custom)
						idle_copy.modelhash = nil

						for l,w in pairs(custom[old_custom.modelhash]) do
							idle_copy[l] = w
						end
						vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
						Citizen.Wait(2500)
						vRPclient._stopAnim(source,true)
						vRPclient._setCustomization(source,idle_copy)
					end
				else
					vRPclient._playAnim(source,true,{{"clothingshirt","try_shirt_positive_d"}},false)
					Citizen.Wait(2500)
					vRPclient._stopAnim(source,true)
					vRP.removeCloak(source)
				end
			end
		end
	end
end)

RegisterCommand('roupas2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) > 101 then
		if not vRPclient.isHandcuffed(source) then
			if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"paramedico.permissao") then
				local nplayer = vRPclient.getNearestPlayer(source,2)
				if not vRP.searchReturn(nplayer,user_id) then
					if nplayer then
						if args[1] then
							local custom = roupas[tostring(args[1])]
							if custom then
								local old_custom = vRPclient.getCustomization(nplayer)
								local idle_copy = {}

								idle_copy = vRP.save_idle_custom(nplayer,old_custom)
								idle_copy.modelhash = nil

								for l,w in pairs(custom[old_custom.modelhash]) do
									idle_copy[l] = w
								end
								vRPclient._setCustomization(nplayer,idle_copy)
							end
						else
							vRP.removeCloak(nplayer)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ /PAYPAL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('paypal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if args[1] == "sacar" and parseInt(args[2]) > 0 then
			local consulta = vRP.getUData(user_id,"vRP:paypal")
			local resultado = json.decode(consulta) or 0
			if resultado >= parseInt(args[2]) then
				--if vRP.request(source,"Deseja sacar <b>$"..vRP.format(parseInt(args[2])).." dólares</b> da sua conta do paypal ?",30) then
					vRP.giveBankMoney(user_id,parseInt(args[2]))
					vRP.setUData(user_id,"vRP:paypal",json.encode(parseInt(resultado-args[2])))
					TriggerClientEvent("Notify",source,"sucesso","Efetuou o saque de <b>$"..vRP.format(parseInt(args[2])).." dólares</b> da sua conta paypal.")
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente em sua conta paypal.")
				--end
			end
		elseif args[1] == "trans" and parseInt(args[2]) > 0 and parseInt(args[3]) > 0 then
			local consulta = vRP.getUData(parseInt(args[2]),"vRP:paypal")
			local resultado = json.decode(consulta) or 0
			local banco = vRP.getBankMoney(user_id)
			local identityu = vRP.getUserIdentity(parseInt(args[2]))
			if banco >= parseInt(args[3]) then
				--if vRP.request(source,"Deseja transferir <b>$"..vRP.format(parseInt(args[3])).." dólares</b> para <b>"..identityu.name.." "..identityu.firstname.."</b> ?",30) then
					vRP.setBankMoney(user_id,parseInt(banco-args[3]))
					vRP.setUData(parseInt(args[2]),"vRP:paypal",json.encode(parseInt(resultado+args[3])))
					TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[3])).." dólares</b> ao passaporte <b>"..vRP.format(parseInt(args[2])).."</b>.")
					SendWebhookMessage(webhookpaypal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[3])).." \n[PARA O ID]: "..parseInt(args[2]).." "..identityu.name.." "..identityu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					local player = vRP.getUserSource(parseInt(args[2]))
					if player == nil then
						return
					else
						TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> transferiu <b>$"..vRP.format(parseInt(args[3])).." dólares</b> para sua conta do paypal.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
				--end
			end
		end
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- /PAYPAL   Bug Fix
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand('paypal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if args[1] == "sacar" and parseInt(args[2]) > 0 then
            local descricao = vRP.prompt(source,"Deseja enviar o dinheiro?","")
        if descricao == "" then
            return
        end
			local consulta = vRP.getUData(user_id,"vRP:paypal")
			local resultado = json.decode(consulta) or 0
			if resultado >= parseInt(args[2]) then
					vRP.giveBankMoney(user_id,parseInt(args[2]))
					vRP.setUData(user_id,"vRP:paypal",json.encode(parseInt(resultado-args[2])))
					TriggerClientEvent("Notify",source,"sucesso","Efetuou o saque de <b>$"..vRP.format(parseInt(args[2])).." dólares</b> da sua conta paypal.")
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente em sua conta paypal.")
			end
		elseif args[1] == "trans" and parseInt(args[2]) > 0 and parseInt(args[3]) > 0 then
			local consulta = vRP.getUData(parseInt(args[2]),"vRP:paypal")
			local resultado = json.decode(consulta) or 0
			local banco = vRP.getBankMoney(user_id)
			local identityu = vRP.getUserIdentity(parseInt(args[2]))
			if banco >= parseInt(args[3]) then
				if vRP.request(source,"Deseja transferir <b>$"..vRP.format(parseInt(args[3])).." dólares</b> para <b>"..identityu.name.." "..identityu.firstname.."</b> ?",30) then
					vRP.setBankMoney(user_id,parseInt(banco-args[3]))
					vRP.setUData(parseInt(args[2]),"vRP:paypal",json.encode(parseInt(resultado+args[3])))
					TriggerClientEvent("Notify",source,"sucesso","Enviou <b>$"..vRP.format(parseInt(args[3])).." dólares</b> ao passaporte <b>"..vRP.format(parseInt(args[2])).."</b>.")
					SendWebhookMessage(webhookpaypal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[3])).." \n[PARA O ID]: "..parseInt(args[2]).." "..identityu.name.." "..identityu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					local player = vRP.getUserSource(parseInt(args[2]))
					if player == nil then
						return
					else
						TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> transferiu <b>$"..vRP.format(parseInt(args[3])).." dólares</b> para sua conta do paypal.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
				end
			end
		end
	end
end)]]

--------------------------------------------------------------------------------------------------
-------------------------- /cavalinho ------------------------------------------------------------
--------------------------------------------------------------------------------------------------
RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(target, animationLib, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	print("got to srv cmg2_animations:sync")
	TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	print("triggering to target: " .. tostring(targetSrc))
	TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Carregar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	print("got to srv cmg2_animations:sync")
	TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	print("triggering to target: " .. tostring(targetSrc))
	TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)

----------------------------------------------------------
-- LIMPAR INVENTARIO -------------------------------------
----------------------------------------------------------
RegisterCommand('limparinv',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        vRP.clearInventory(user_id)
        TriggerClientEvent("Notify",source,"importante","Seu <b>inventario</b> foi limpo!")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT PUBLICO
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT ADV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adv',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"advogado.permissao") or vRP.hasPermission(user_id,"juiz.permissao") then
			if user_id then --255 128 0
				TriggerClientEvent('chatMessage',-1,"Advocacia",{255,128,0},rawCommand:sub(4))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT SAMU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('samu',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"paramedico.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"SAMU",{252,1,1},rawCommand:sub(5))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('policia',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"policia.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Polícia",{30,57,212},rawCommand:sub(8))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT POLICIA CIVIL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"pcivil.permissao") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Polícia Civíl",{0,0,0},rawCommand:sub(3))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT PRIVADO
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- CS  CHAT SAMU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cs',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{229,88,88},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CP  CHAT POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cp',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,52,230},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CC  CHAT POLICIA CIVIL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "pcivil.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,64,64},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CA  CHAT ADVOGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ca',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "advogado.permissao"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{255,178,102},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LUXVEHCONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lvc_TogDfltSrnMuted_s")
AddEventHandler("lvc_TogDfltSrnMuted_s", function(toggle)
	TriggerClientEvent("lvc_TogDfltSrnMuted_c",-1,source,toggle)
end)

RegisterServerEvent("lvc_SetLxSirenState_s")
AddEventHandler("lvc_SetLxSirenState_s", function(newstate)
	TriggerClientEvent("lvc_SetLxSirenState_c",-1,source,newstate)
end)

RegisterServerEvent("lvc_TogPwrcallState_s")
AddEventHandler("lvc_TogPwrcallState_s", function(toggle)
	TriggerClientEvent("lvc_TogPwrcallState_c",-1,source,toggle)
end)

RegisterServerEvent("lvc_SetAirManuState_s")
AddEventHandler("lvc_SetAirManuState_s", function(newstate)
	TriggerClientEvent("lvc_SetAirManuState_c",-1,source,newstate)
end)

RegisterServerEvent("lvc_TogIndicState_s")
AddEventHandler("lvc_TogIndicState_s", function(newstate)
	TriggerClientEvent("lvc_TogIndicState_c",-1,source,newstate)
end)