local cfg = module("cfg/inventory")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookbaucasa = "https://discord.com/api/webhooks/767017571618652170/RBHFSRFFd9iJlL5IbcWdfwj9MMQeGeH--s6KSyds133ptixZstiUVpNMA31DFI7eX71E"
local webhookbaustatic = "https://discord.com/api/webhooks/767017627318485059/cQVW7je3uQNdhUpWb4vUtAaVSfz-P9rBdhz0Rkzy_sFAkYC3nxmyF3ZUh4eXLaehOTGN"
local webhookbaustaticpolicia = "https://discord.com/api/webhooks/767017689985318931/1fnna6xfNL53m8OCrtx0xN4Cky7ptPECAnNOxPf3mOyUI_OF2ifS4SV_Palt2lfArJeq"
local webhookbauvagos = ""
local webhookbaugroove = ""
local webhookbauballas = ""
local webhookbaumafia = "https://discord.com/api/webhooks/768443584017727538/_MlzvNwD9WF4vKFgAORmJBWgFGpGxp2reu9qv3b7MzwrlctPsKXXGasMr4SmyEfGY44g"
local webhookbauserpentes = ""
local webhookbaumc = "https://discord.com/api/webhooks/768443491168550922/sL7rD79jLU5CZRwW43SeQEoqcrRtrmwsKRjElXGkHsJK1_jQ4VeTLLqUWDoaGKrrIo1i"
local webhookbaucosanostra = ""
local webhookbaubratva = ""
local webhookbauhelipa = "https://discord.com/api/webhooks/768443936016302110/lD47TsNhF_XLNkovZfetfsLAXbbQ59_APDZHYFOO0BA8zynqiEhWqF9lSbBcHoPfHzeF"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local itemlist = {
	["laranja"] = { index = "laranja", nome = "Laranja", type = "usar" },
	["nitro"] = { index = "nitro", nome = "Óxido Nitroso", type = "usar" },
	["agua"] = { index = "agua", nome = "agua", type = "usar" },
	["tartaruga"] = { index = "tartaruga", nome = "Filhote de Tartaruga", type = "usar" },
	--["carnedetartaruga"] = { index = "carnedetartaruga", nome = "Carne de Tartaruga", type = "usar" },
	["ferramenta"] = { index = "ferramenta", nome = "Ferramenta", type = "usar" },
	["encomenda"] = { index = "encomenda", nome = "Encomenda", type = "usar" },
	["sacodelixo"] = { index = "sacodelixo", nome = "Saco de Lixo", type = "usar" },
	["reciclaveis"] = { index = "reciclaveis", nome = "Recicláveis", type = "usar" },
	--["garrafavazia"] = { index = "garrafavazia", nome = "Garrafa Vazia", type = "usar" },
	--["garrafadeleite"] = { index = "garrafadeleite", nome = "Garrafa de Leite", type = "usar" },
	["tora"] = { index = "tora", nome = "Tora de Madeira", type = "usar" },
	["alianca"] = { index = "alianca", nome = "Aliança", type = "usar" },
	--["bandagem"] = { index = "bandagem", nome = "Bandagem", type = "usar" },
	["dorflex"] = { index = "dorflex", nome = "Dorflex", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Remédios ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	--["paracetamil"] = { index = "paracetamil", nome = "Paracetamil", type = "usar" },
	--["voltarom"] = { index = "voltarom", nome = "Voltarom", type = "usar" },
	--["trandrylux"] = { index = "trandrylux", nome = "Trandrylux", type = "usar" },
	--["dorfrex"] = { index = "dorfrex", nome = "Dorfrex", type = "usar" },
	--["buscopom"] = { index = "buscopom", nome = "Buscopom", type = "usar" },
	---------------------------------------------------------------------------------------------------
	--[ Receitas ]-------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------
	--["r-paracetamil"] = { index = "r-paracetamil", nome = "Receituário Paracetamil", type = "usar" },
	--["r-voltarom"] = { index = "r-voltarom", nome = "Receituário Voltarom", type = "usar" },
	--["r-trandrylux"] = { index = "r-trandrylux", nome = "Receituário Trandrylux", type = "usar" },
	--["r-dorfrex"] = { index = "r-dorfrex", nome = "Receituário Dorfrex", type = "usar" },
	--["r-buscopom"] = { index = "r-buscopom", nome = "Receituário Buscopom", type = "usar" },
	---------------------------------------------------------------------------------------------------
	["Cicatricure"] = { index = "cicatricure", nome = "Cicatricure", type = "usar" },
	["Dipirona"] = { index = "dipiroca", nome = "Dipiroca", type = "usar" },
	["Dramin"] = { index = "nocucedin", nome = "Nocucedin", type = "usar" },
	["Paracetamol"] = { index = "paracetanal", nome = "Paracetanal", type = "usar" },
	["nulo"] = { index = "decupramim", nome = "Decupramim", type = "usar" },
	["Buscopam"] = { index = "buscopau", nome = "Buscopau", type = "usar" },
	["Novalgina"] = { index = "navagina", nome = "Navagina", type = "usar" },
	["Anador"] = { index = "analdor", nome = "Analdor", type = "usar" },
	["sefodex"] = { index = "sefodex", nome = "Sefodex", type = "usar" },
	["Tramal"] = { index = "nokusin", nome = "Nokusin", type = "usar" },
	["Glicose"] = { index = "glicoanal", nome = "Glicoanal", type = "usar" },
	["cerveja"] = { index = "cerveja", nome = "Cerveja", type = "usar" },
	["batata"] = { index = "batata", nome = "Batata", type = "usar" },
	["tequila"] = { index = "tequila", nome = "Tequila", type = "usar" },
	["vodka"] = { index = "vodka", nome = "Vodka", type = "usar" },
	["whisky"] = { index = "whisky", nome = "Whisky", type = "usar" },
	["conhaque"] = { index = "conhaque", nome = "Conhaque", type = "usar" },
	["absinto"] = { index = "absinto", nome = "Absinto", type = "usar" },
	["dinheirosujo"] = { index = "dinheirosujo", nome = "Dinheiro Sujo", type = "usar" },
	["dinheirofalso"] = { index = "dinheirofalso", nome = "Dineiro Sujo", type = "usar" },
	["repairkit"] = { index = "repairkit", nome = "Kit de Reparos", type = "usar" },
	["repairkitdois"] = { index = "repairkitdois", nome = "Kit de Reparo", type = "usar" },
	["morfina"] = { index = "morfina", nome = "Morfina", type = "usar" },
	["placa"] = { index = "placa", nome = "Placa", type = "usar" },
	["algemas"] = { index = "algemas", nome = "Algemas", type = "usar" },
	["projetodearmas"] = { index = "projetodearmas", nome = "Projeto de Armas", type = "usar" },
	["capuz"] = { index = "capuz", nome = "Capuz", type = "usar" },
	["lockpick"] = { index = "lockpick", nome = "Lockpick", type = "usar" },
	["identidade"] = { index = "identidade", nome = "Identidade", type = "usar" },
	["masterpick"] = { index = "masterpick", nome = "Masterpick", type = "usar" },
	["chave"] = { index = "chave", nome = "Chave", type = "usar" },
	["quimico"] = { index = "quimico", nome = "Produto Químico", type = "usar" },
	["militec"] = { index = "militec", nome = "Militec-1", type = "usar" },
	["pneus"] = { index = "pneus", nome = "Pneus", type = "usar" },
	["rebite"] = { index = "rebite", nome = "Rebite", type = "usar" },
	["notebook"] = { index = "notebook", nome = "Notebook", type = "usar" },
	["roupas"] = { index = "roupas", nome = "Roupas", type = "usar" },
	--["carnedecormorao"] = { index = "carnedecormorao", nome = "Carne de Cormorão", type = "usar" },
	--["carnedecorvo"] = { index = "carnedecorvo", nome = "Carne de Corvo", type = "usar" },
	--["carnedeaguia"] = { index = "carnedeaguia", nome = "Carne de Águia", type = "usar" },
	--["carnedecervo"] = { index = "carnedecervo", nome = "Carne de Cervo", type = "usar" },
	--["carnedecoelho"] = { index = "carnedecoelho", nome = "Carne de Coelho", type = "usar" },
	--["carnedecoyote"] = { index = "carnedecoyote", nome = "Carne de Coyote", type = "usar" },
	--["carnedelobo"] = { index = "carnedelobo", nome = "Carne de Lobo", type = "usar" },
	--["carnedepuma"] = { index = "carnedepuma", nome = "Carne de Puma", type = "usar" },
	--["carnedejavali"] = { index = "carnedejavali", nome = "Carne de Javali", type = "usar" },
	["amora"] = { index = "amora", nome = "Amora", type = "usar" },
	["cereja"] = { index = "cereja", nome = "Cereja", type = "usar" },
	["isca"] = { index = "isca", nome = "Isca", type = "usar" },
	["dourado"] = { index = "dourado", nome = "Dourado", type = "usar" },
	["corvina"] = { index = "corvina", nome = "Corvina", type = "usar" },
	["salmao"] = { index = "salmao", nome = "Salmão", type = "usar" },
	["cherne"] = { index = "cherne", nome = "Cherne", type = "usar" },
	["arraia"] = { index = "arraia", nome = "Arraia", type = "usar" },
	["budiao"] = { index = "budiao", nome = "Budião", type = "usar" },
	["pargo"] = { index = "pargo", nome = "Pargo", type = "usar" },
	["badejo"] = { index = "badejo", nome = "Badejo", type = "usar" },
	["piava"] = { index = "piava", nome = "Piava", type = "usar" },
	["cacao"] = { index = "cacao", nome = "Cação", type = "usar" },
	["caranha"] = { index = "caranha", nome = "Caranha", type = "usar" },
	["viola"] = { index = "viola", nome = "Viola", type = "usar" },
	["pacu"] = { index = "pacu", nome = "Pacu", type = "usar" },
	["pintado"] = { index = "pintado", nome = "Pintado", type = "usar" },
	["pirarucu"] = { index = "pirarucu", nome = "Pirarucu", type = "usar" },
	["tilapia"] = { index = "tilapia", nome = "Tilápia", type = "usar" },
	["tucunare"] = { index = "tucunare", nome = "Tucunaré", type = "usar" },
	["lambari"] = { index = "lambari", nome = "Lambari", type = "usar" },
	["energetico"] = { index = "energetico", nome = "Energético", type = "usar" },
	["mochila"] = { index = "mochila", nome = "Mochila", type = "usar" },
	-- Maconha ----------------------------------------------------------------------------------------------------
	["maconha"] = { index = "maconha", nome = "Maconha", type = "usar" },
	["ramosdemaconha"] = { index = "ramosdemaconha", nome = "Ramo de Maconha", type = "usar" },
	["maconhanaoprocessada"] = { index = "maconhanaoprocessada", nome = "Maconha não Processada", type = "usar" },
	["maconhamisturada"] = { index = "maconhamisturada", nome = "Maconha Misturada", type = "usar" },
	["baseado"] = { index = "baseado", nome = "Baseado", type = "usar" },
	["seda"] = { index = "seda", nome = "Seda", type = "usar" },
	["receita1"] = { index = "receita1", nome = "Receita Médica", type = "usar" },
	["receita2"] = { index = "receita2", nome = "Receita Médica", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	-- Cocaína ----------------------------------------------------------------------------------------------------
	["folhadecoca"] = { index = "folhadecoca", nome = "Folha de Coca", type = "usar" },
	["pastadecoca"] = { index = "pastadecoca", nome = "Pasta de Coca", type = "usar" },
	["cocamisturada"] = { index = "cocamisturada", nome = "Cocaína Misturada", type = "usar" },
	["cocaina"] = { index = "cocaina", nome = "Cocaína", type = "usar" },
	["ziplock"] = { index = "ziplock", nome = "Saco ZipLock", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	-- Ecstasy -----------------------------------------------------------------
	["ocitocina"] = { index = "ocitocina", nome = "Ocitocina Sintética", type = "usar" },
	["ociacido"] = { index = "ociacido", nome = "Ácido Anf. Desidratado", type = "usar" },
	["primaecstasy"] = { index = "primaecstasy", nome = "Matéria Prima - Ecstasy", type = "usar" },
	["ecstasy"] = { index = "ecstasy", nome = "Ecstasy", type = "usar" },
	["glicerina"] = { index = "glicerina", nome = "Glicerina", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	-- Lavagem de Dinheiro ----------------------------------------------------------------------------------------
	["impostoderenda"] = { index = "impostoderenda", nome = "Imposto de Renda", type = "usar" },
	["impostoderendafalso"] = { index = "impostoderendafalso", nome = "Imposto de Renda Falso", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	-- Lavagem de Dinheiro ----------------------------------------------------------------------------------------
	["notarecebimento"] = { index = "notarecebimento", nome = "Nota de Recebimento", type = "usar" },
	["notarecebimentofalso"] = { index = "notarecebimentofalso", nome = "Nota de Recebimento Falsa", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	-- Bratva Munições --------------------------------------------------------------------------------------------
	["detonador"] = { index = "detonador", nome = "Detonador", type = "usar" },
	["ferramentas"] = { index = "ferramentas", nome = "Ferramentas Pesadas", type = "usar" },
	---------------------------------------------------------------------------------------------------------------
	["adubo"] = { index = "adubo", nome = "Adubo", type = "usar" },
	["fertilizante"] = { index = "fertilizante", nome = "Fertilizante", type = "usar" },
	["capsula"] = { index = "capsula", nome = "Cápsula", type = "usar" },
	["polvora"] = { index = "polvora", nome = "Pólvora", type = "usar" },
	["orgaos"] = { index = "orgaos", nome = "Órgãos", type = "usar" },
	["etiqueta"] = { index = "etiqueta", nome = "Etiqueta", type = "usar" },
	["pendrive"] = { index = "pendrive", nome = "Pendrive", type = "usar" },
	["relogioroubado"] = { index = "relogioroubado", nome = "Relógio Roubado", type = "usar" },
	["pulseiraroubada"] = { index = "pulseiraroubada", nome = "Pulseira Roubada", type = "usar" },
	["anelroubado"] = { index = "anelroubado", nome = "Anel Roubado", type = "usar" },
	["colarroubado"] = { index = "colarroubado", nome = "Colar Roubado", type = "usar" },
	["brincoroubado"] = { index = "brincoroubado", nome = "Brinco Roubado", type = "usar" },
	["carteiraroubada"] = { index = "carteiraroubada", nome = "Carteira Roubada", type = "usar" },
	["tabletroubado"] = { index = "tabletroubado", nome = "Tablet Roubado", type = "usar" },
	["sapatosroubado"] = { index = "sapatosroubado", nome = "Sapatos Roubado", type = "usar" },
	["vibradorroubado"] = { index = "vibradorroubado", nome = "Vibrador Roubado", type = "usar" },
	["perfumeroubado"] = { index = "perfumeroubado", nome = "Perfume Roubado", type = "usar" },
	["fungo"] = { index = "fungo", nome = "Fungo", type = "usar" },
    ["dietilamina"] = { index = "dietilamina", nome = "Dietilamina", type = "usar" },
	["lsd"] = { index = "lsd", nome = "LSD", type = "usar" },
	["acidobateria"] = { index = "acidobateria", nome = "Ácido de Bateria", type = "usar" },
	["anfetamina"] = { index = "anfetamina", nome = "Anfetamina", type = "usar" },
	["cristal"] = { index = "cristal", nome = "Cristal de Metanfetamina", type = "usar" },
	["metanfetamina"] = { index = "metanfetamina", nome = "Metanfetamina", type = "usar" },
	["pipe"] = { index = "pipe", nome = "Pipe", type = "usar" },
	["armacaodearma"] = { index = "armacaodearma", nome = "Armação de Arma", type = "usar" },
	-----------------------------
	-- FARM YAKUZA
	-----------------------------
	["celular"] = { index = "celular", nome = "Celular", type = "usar" },
	["celulardesbloqueado"] = { index = "celular", nome = "Celular Desbloqueado", type = "usar" },
	["celularroubado"] = { index = "celular", nome = "Celular Roubado", type = "usar" },
		-----------------------------
	-- FARM BRATVA
	-----------------------------
	["tecido"] = { index = "tecido", nome = "Tecido", type = "usar" },
	["colete"] = { index = "colete", nome = "Colete", type = "usar" },
	-----------------------------
	-----------------------------
	["pecadeferro"] = { index = "pecadeferro", nome = "Peça de Ferro", type = "usar" },
	["logsinvasao"] = { index = "logsinvasao", nome = "L. Inv. Banco", type = "usar" },
	["keysinvasao"] = { index = "keysinvasao", nome = "K. Inv. Banco", type = "usar" },
	["pendriveinformacoes"] = { index = "pendriveinformacoes", nome = "P. Info.", type = "usar" },
	["acessodeepweb"] = { index = "acessodeepweb", nome = "P. DeepWeb", type = "usar" },
	["diamante"] = { index = "diamante", nome = "Min. Diamante", type = "usar" },
	["ouro"] = { index = "ouro", nome = "Min. Ouro", type = "usar" },
	["bronze"] = { index = "bronze", nome = "Min. Bronze", type = "usar" },
	["ferro"] = { index = "ferro", nome = "Min. Ferro", type = "usar" },
	["rubi"] = { index = "rubi", nome = "Min. Rubi", type = "usar" },
	["esmeralda"] = { index = "esmeralda", nome = "Min. Esmeralda", type = "usar" },
	["safira"] = { index = "safira", nome = "Min. Safira", type = "usar" },
	["topazio"] = { index = "topazio", nome = "Min. Topazio", type = "usar" },
	["ametista"] = { index = "ametista", nome = "Min. Ametista", type = "usar" },
	["diamante2"] = { index = "diamante2", nome = "Diamante", type = "usar" },
	["ouro2"] = { index = "ouro2", nome = "Ouro", type = "usar" },
	["bronze2"] = { index = "bronze2", nome = "Bronze", type = "usar" },
	["ferro2"] = { index = "ferro2", nome = "Ferro", type = "usar" },
	["radio"] = { index = "radio", nome = "Radio", type = "usar" },
	["c4"] = { index = "c4", nome = "C4", type = "usar" },
	["furadeira"] = { index = "furadeira", nome = "Furadeira", type = "usar" },
	["serra"] = { index = "serra", nome = "Serra", type = "usar" },
	["rubi2"] = { index = "rubi2", nome = "Rubi", type = "usar" },
	["esmeralda2"] = { index = "esmeralda2", nome = "Esmeralda", type = "usar" },
	["safira2"] = { index = "safira2", nome = "Safira", type = "usar" },
	["topazio2"] = { index = "topazio2", nome = "Topazio", type = "usar" },
	["ametista2"] = { index = "ametista2", nome = "Ametista", type = "usar" },
	["graos"] = { index = "graos", nome = "Graos", type = "usar" },
	["graosimpuros"] = { index = "graosimpuros", nome = "Graos Impuros", type = "usar" },
	["keycard"] = { index = "keycard", nome = "Keycard", type = "usar" },
	["xerelto"] = { index = "xerelto", nome = "Xerelto", type = "usar" },
	["coumadin"] = { index = "coumadin", nome = "Coumadin", type = "usar" },
	["aneldecompromisso"] = { index = "aneldecompromisso", nome = "Anel de Compromisso", type = "usar" },
	["colardeperolas"] = { index = "colardeperolas", nome = "Colar de Pérolas", type = "usar" },
	["pulseiradeouro"] = { index = "pulseiradeouro", nome = "Pulseira de Ouro", type = "usar" },
	["chocolate"] = { index = "chocolate", nome = "Chocolate", type = "usar" },
	["pirulito"] = { index = "pirulito", nome = "Pirulito", type = "usar" },
	["buque"] = { index = "buque", nome = "Buquê de Flores", type = "usar" },
	["wbody|WEAPON_DAGGER"] = { index = "adaga", nome = "Adaga", type = "equipar" },
	["wbody|WEAPON_BAT"] = { index = "beisebol", nome = "Taco de Beisebol", type = "equipar" },
	["wbody|WEAPON_BOTTLE"] = { index = "garrafa", nome = "Garrafa", type = "equipar" },
	["wbody|WEAPON_CROWBAR"] = { index = "cabra", nome = "Pé de Cabra", type = "equipar" },
	["wbody|WEAPON_FLASHLIGHT"] = { index = "lanterna", nome = "Lanterna", type = "equipar" },
	["wbody|WEAPON_GOLFCLUB"] = { index = "golf", nome = "Taco de Golf", type = "equipar" },
	["wbody|WEAPON_HAMMER"] = { index = "martelo", nome = "Martelo", type = "equipar" },
	["wbody|WEAPON_HATCHET"] = { index = "machado", nome = "Machado", type = "equipar" },
	["wbody|WEAPON_KNUCKLE"] = { index = "ingles", nome = "Soco-Inglês", type = "equipar" },
	["wbody|WEAPON_KNIFE"] = { index = "faca", nome = "Faca", type = "equipar" },
	["wbody|WEAPON_MACHETE"] = { index = "machete", nome = "Machete", type = "equipar" },
	["wbody|WEAPON_SWITCHBLADE"] = { index = "canivete", nome = "Canivete", type = "equipar" },
	["wbody|WEAPON_NIGHTSTICK"] = { index = "cassetete", nome = "Cassetete", type = "equipar" },
	["wbody|WEAPON_WRENCH"] = { index = "grifo", nome = "Chave de Grifo", type = "equipar" },
	["wbody|WEAPON_BATTLEAXE"] = { index = "batalha", nome = "Machado de Batalha", type = "equipar" },
	["wbody|WEAPON_POOLCUE"] = { index = "sinuca", nome = "Taco de Sinuca", type = "equipar" },
	["wbody|WEAPON_STONE_HATCHET"] = { index = "pedra", nome = "Machado de Pedra", type = "equipar" },
	["wbody|WEAPON_PISTOL"] = { index = "m1911", nome = "M1911", type = "equipar" },
	["wbody|WEAPON_PISTOL_MK2"] = { index = "fiveseven", nome = "FN Five Seven", type = "equipar" },
	["wbody|WEAPON_COMBATPISTOL"] = { index = "glock", nome = "Glock 19", type = "equipar" },
	["wbody|WEAPON_APPISTOL"] = { index = "appistol", nome = "AP Pistol", type = "equipar" },
	["wbody|WEAPON_STUNGUN"] = { index = "taser", nome = "Taser", type = "equipar" },
	["wbody|WEAPON_SNSPISTOL"] = { index = "hkp7m10", nome = "HK P7M10", type = "equipar" },
	["wbody|WEAPON_VINTAGEPISTOL"] = { index = "m1922", nome = "M1922", type = "equipar" },
	["wbody|WEAPON_REVOLVER"] = { index = "magnum44", nome = "Magnum 44", type = "equipar" },
	["wbody|WEAPON_REVOLVER_MK2"] = { index = "magnum357", nome = "Magnum 357", type = "equipar" },
	["wbody|WEAPON_MUSKET"] = { index = "winchester22", nome = "Winchester 22", type = "equipar" },
	["wbody|WEAPON_FLARE"] = { index = "sinalizador", nome = "Sinalizador", type = "equipar" },
	["wbody|GADGET_PARACHUTE"] = { index = "paraquedas", nome = "Paraquedas", type = "equipar" },
	["wbody|WEAPON_FIREEXTINGUISHER"] = { index = "extintor", nome = "Extintor", type = "equipar" },
	["wbody|WEAPON_MICROSMG"] = { index = "uzi", nome = "Uzi", type = "equipar" },
	["wbody|WEAPON_SMG"] = { index = "mp5", nome = "MP5", type = "equipar" },
	["wbody|WEAPON_ASSAULTSMG"] = { index = "mag-pdr", nome = "MAG-PDR", type = "equipar" },
	["wbody|WEAPON_COMBATPDW"] = { index = "sigsauer", nome = "Sig Sauer MPX", type = "equipar" },
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = { index = "remington", nome = "Remington 870", type = "equipar" },
	["wbody|WEAPON_CARBINERIFLE"] = { index = "m4a1", nome = "M4A1", type = "equipar" },
	["wbody|WEAPON_ASSAULTRIFLE"] = { index = "ak47", nome = "AK-47", type = "equipar" },
	["wbody|WEAPON_PETROLCAN"] = { index = "gasolina", nome = "Galão de Gasolina", type = "equipar" },	
	["wbody|WEAPON_GUSENBERG"] = { index = "thompson", nome = "Thompson", type = "equipar" },		
	["wbody|WEAPON_MACHINEPISTOL"] = { index = "tec9", nome = "Tec-9", type = "equipar" },
	["wbody|WEAPON_COMPACTRIFLE"] = { index = "aks", nome = "AKS", type = "equipar" },
	["wbody|WEAPON_CARBINERIFLE_MK2"] = { index = "mpx", nome = "MPX", type = "equipar" },
	["wbody|WEAPON_BULLPUPRIFLE"] = { index = "qbz", nome = "QBZ", type = "equipar" },
	["wbody|WEAPON_PUMPSHOTGUN"] = { index = "shotgun", nome = "Shotgun", type = "equipar" },
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = { index = "sawnoffshotgun", nome = "Shotgun C.Serrado", type = "equipar" },
	-- Munições
	["wammo|WEAPON_SAWNOFFSHOTGUN"] = { index = "m-sawnoffshotgun", nome = "M.Shotgun C.Serrado", type = "recarregar" },
	["wammo|WEAPON_BULLPUPRIFLE"] = { index = "m-qbz", nome = "M.QBZ", type = "recarregar" },
	["wammo|WEAPON_PISTOL"] = { index = "m-m1911", nome = "M.M1911", type = "recarregar" },
	["wammo|WEAPON_PISTOL_MK2"] = { index = "m-fiveseven", nome = "M.FN Five Seven", type = "recarregar" },
	["wammo|WEAPON_COMBATPISTOL"] = { index = "m-glock", nome = "M.Glock 19", type = "recarregar" },
	["wammo|WEAPON_APPISTOL"] = { index = "m-appistol", nome = "M.AP Pistol", type = "recarregar" },
	["wammo|WEAPON_STUNGUN"] = { index = "m-taser", nome = "M.Taser", type = "recarregar" },
	["wammo|WEAPON_SNSPISTOL"] = { index = "m-hkp7m10", nome = "M.HK P7M10", type = "recarregar" },
	["wammo|WEAPON_VINTAGEPISTOL"] = { index = "m-m1922", nome = "M.M1922", type = "recarregar" },
	["wammo|WEAPON_REVOLVER"] = { index = "m-magnum44", nome = "M.Magnum 44", type = "recarregar" },
	["wammo|WEAPON_REVOLVER_MK2"] = { index = "m-magnum357", nome = "M.Magnum 357", type = "recarregar" },
	["wammo|WEAPON_MUSKET"] = { index = "m-winchester22", nome = "M.Winchester 22", type = "recarregar" },
	["wammo|WEAPON_FLARE"] = { index = "m-sinalizador", nome = "M.Sinalizador", type = "recarregar" },
	["wammo|GADGET_PARACHUTE"] = { index = "m-paraquedas", nome = "M.Paraquedas", type = "recarregar" },
	["wammo|WEAPON_FIREEXTINGUISHER"] = { index = "m-extintor", nome = "M.Extintor", type = "recarregar" },
	["wammo|WEAPON_MICROSMG"] = { index = "m-uzi", nome = "M.Uzi", type = "recarregar" },
	["wammo|WEAPON_SMG"] = { index = "m-mp5", nome = "M.MP5", type = "recarregar" },
	["wammo|WEAPON_ASSAULTSMG"] = { index = "m-mag-pdr", nome = "M.MAG-PDR", type = "recarregar" },
	["wammo|WEAPON_COMBATPDW"] = { index = "m-sigsauer", nome = "M.Sig Sauer MPX", type = "recarregar" },
	["wammo|WEAPON_PUMPSHOTGUN"] = { index = "m-shotgun", nome = "M.Shotgun", type = "recarregar" },
	["wammo|WEAPON_PUMPSHOTGUN_MK2"] = { index = "m-remington", nome = "M.Remington 870", type = "recarregar" },
	["wammo|WEAPON_CARBINERIFLE"] = { index = "m-m4a1", nome = "M.M4A1", type = "recarregar" },
	["wammo|WEAPON_ASSAULTRIFLE"] = { index = "m-ak47", nome = "M.AK-47", type = "recarregar" },
	["wammo|WEAPON_GUSENBERG"] = { index = "m-thompson", nome = "M.Thompson", type = "recarregar" },
	["wammo|WEAPON_MACHINEPISTOL"] = { index = "m-tec9", nome = "M.Tec-9", type = "recarregar" },
	["wammo|WEAPON_COMPACTRIFLE"] = { index = "m-aks", nome = "M.AKS", type = "recarregar" },
	["wammo|WEAPON_CARBINERIFLE_MK2"] = { index = "m-mpx", nome = "M.MPX", type = "recarregar" },
	["wammo|WEAPON_PETROLCAN"] = { index = "combustivel", nome = "Combustível", type = "recarregar" },
	["projetoassaultrifle"] = { index = "projetoassaultrifle", nome = "Projeto Ak-47", type = "usar" },
	["projetoassaultsmg"] = { index = "projetoassaultsmg", nome = "Projeto MAG-PDR", type = "usar" },
	["projetobullpuprifle"] = { index = "projetobullpuprifle", nome = "Projeto QBZ", type = "usar" },
	["projetocarbinerifle"] = { index = "projetocarbinerifle", nome = "Projeto M4A1", type = "usar" },
	["projetocombatpdw"] = { index = "projetocombatpdw", nome = "Projeto MPX", type = "usar" },
	["projetocombatpistol"] = { index = "projetocombatpistol", nome = "Projeto Glock 19", type = "usar" },
	["projetogusenberg"] = { index = "projetogusenberg", nome = "Projeto Thompson", type = "usar" },
	["projetopistol"] = { index = "projetopistol", nome = "Projeto M1911", type = "usar" },
	["projetopumpshotgun"] = { index = "projetopumpshotgun", nome = "Projeto Shotgun", type = "usar" },
	["projetosawnoffshotgun"] = { index = "projetosawnoffshotgun", nome = "Projeto Shot Cano Serrado", type = "usar" },
	["projetosmg"] = { index = "projetosmg", nome = "Projeto MP5", type = "usar" },
	["agave"] = { index = "agave", nome = "Miolo da Agave", type = "usar" }
}

function vRP.itemNameList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].nome
	end
end

function vRP.itemIndexList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].index
	end
end

function vRP.itemTypeList(item)
	if itemlist[item] ~= nil then
		return itemlist[item].type
	end
end

function vRP.itemBodyList(item)
	if itemlist[item] ~= nil then
		return itemlist[item]
	end
end

vRP.items = {}
function vRP.defInventoryItem(idname,name,weight)
	if weight == nil then
		weight = 0
	end
	local item = { name = name, weight = weight }
	vRP.items[idname] = item
end

function vRP.computeItemName(item,args)
	if type(item.name) == "string" then
		return item.name
	else
		return item.name(args)
	end
end

function vRP.computeItemWeight(item,args)
	if type(item.weight) == "number" then
		return item.weight
	else
		return item.weight(args)
	end
end

function vRP.parseItem(idname)
	return splitString(idname,"|")
end

function vRP.getItemDefinition(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemName(item,args),vRP.computeItemWeight(item,args)
	end
	return nil,nil
end

function vRP.getItemWeight(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemWeight(item,args)
	end
	return 0
end

function vRP.computeItemsWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		local iweight = vRP.getItemWeight(k)
		weight = weight+iweight*v.amount
	end
	return weight
end

function vRP.giveInventoryItem(user_id,idname,amount)
	local amount = parseInt(amount)
	local data = vRP.getUserDataTable(user_id)
	if data and amount > 0 then
		local entry = data.inventory[idname]
		if entry then
			entry.amount = entry.amount + amount
		else
			data.inventory[idname] = { amount = amount }
		end
	end
end

--local creative_itens = "https://discordapp.com/api/webhooks/604945979023687691/8XKL0ByvuyQxjnW5JtWVb8FdtDyPYa0mKcP2wcifM2LGzMGSHpFchQhD8-PAdYG-QfQq"

function vRP.tryGetInventoryItem(user_id,idname,amount)
	local amount = parseInt(amount)
	local data = vRP.getUserDataTable(user_id)
	if data and amount > 0 then
		--if idname == "tora" or idname == "carnedepuma" or idname == "etiqueta" then
			--creativeLogs(creative_itens,"**USER_ID:** "..user_id.." **ITEM:** "..idname.." - **QUANTIDADE:** "..parseInt(amount).." - "..os.date("%H:%M:%S"))
		--end
		local entry = data.inventory[idname]
		if entry and entry.amount >= amount then
			entry.amount = entry.amount - amount

			if entry.amount <= 0 then
				data.inventory[idname] = nil
			end
			return true
		end
	end
	return false
end

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		local entry = data.inventory[idname]
		if entry then
			return entry.amount
		end
	end
	return 0
end

function vRP.getInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		return data.inventory
	end
end

function vRP.getInventoryWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		return vRP.computeItemsWeight(data.inventory)
	end
	return 0
end

function vRP.getInventoryMaxWeight(user_id)
	return math.floor(vRP.expToLevel(vRP.getExp(user_id,"physical","strength")))*3
end

RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            data.inventory = {}
        end

        vRP.setMoney(user_id,0)
        vRPclient._clearWeapons(source)
        vRPclient._setHandcuffed(source,false)

        if not vRP.hasPermission(user_id,"mochila.permissao") then
            vRP.setExp(user_id,"physical","strength",20)
        end
    end
end)

AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)

local chests = {}
local function build_itemlist_menu(name,items,cb)
	local menu = { name = name }
	local kitems = {}

	local choose = function(player,choice)
		local idname = kitems[choice]
		if idname then
			cb(idname)
		end
	end

	for k,v in pairs(items) do 
		local name,weight = vRP.getItemDefinition(k)
		if name then
			kitems[name] = k
			menu[name] = { choose,"<text01>Quantidade:</text01> <text02>"..v.amount.."</text02><text01>Peso:</text01> <text02>"..string.format("%.2f",weight).."kg</text02>" }
		end
	end

	return menu
end

function vRP.openChest(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					if parseInt(amount) > 0 and parseInt(amount) <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*parseInt(amount)
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,parseInt(amount))
								if name == "static:1" then
									SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```<@&628630606649098276>")
								elseif name == "static:2" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaumc,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:3" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:4" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:5" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:6" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Families "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Families "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:7" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaumafia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:8" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bratva "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaubratva,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bratva "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:9" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:10" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: helipa "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauhelipa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: helipa "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:11" then
									-- Colocar depois
								elseif name == "static:12" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:13" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Serpentes "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbauserpentes,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Serpentes "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:14" then
									--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								elseif name == "static:15" then
									SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Cosanostra "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
									SendWebhookMessage(webhookbaucosanostra,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Cosanostra "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end
							citem.amount = citem.amount - parseInt(amount)

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.",8000)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.",8000)
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					if string.match(idname,"identidade") then
						TriggerClientEvent("Notify",source,"importante","Não pode guardar a <b>Identidade</b> em veículos.",8000)
						return
					end

					local amount = vRP.prompt(source,"Quantidade:","")
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*parseInt(amount)
					if new_weight <= max_weight then
						if parseInt(amount) > 0 and vRP.tryGetInventoryItem(user_id,idname,parseInt(amount)) then
							
							if name == "static:1" then
								SendWebhookMessage(webhookbaustaticpolicia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Policia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:2" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaumc,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:3" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Marabunta "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:4" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauballas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Ballas "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:5" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauvagos,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Vagos "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:6" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Families "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaugroove,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Families "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:7" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaumafia,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Mafia "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:8" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bratva "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaubratva,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Bratva "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:9" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Motoclub "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:10" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: helipa "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauhelipa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: helipa "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:11" then
								-- Colocar depois
							elseif name == "static:12" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Corleone "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:13" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Serpentes "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbauserpentes,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Serpentes "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:14" then
								--SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Concessionaria "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							elseif name == "static:15" then
								SendWebhookMessage(webhookbaustatic,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Cosanostra "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
								SendWebhookMessage(webhookbaucosanostra,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[COLOCOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: Cosanostra "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end

							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + parseInt(amount)
							else
								chest.items[idname] = { amount = parseInt(amount) }
							end

							if cb_in then
								cb_in(idname,parseInt(amount))
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.",8000)
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","Está sendo utilizado no momento.",8000)
			end
		end
	end
end

local function build_client_static_chests(source)
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(cfg.static_chests) do
			local mtype,x,y,z = table.unpack(v)
			local schest = cfg.static_chest_types[mtype]

			if schest then
				local function schest_enter(source)
					local user_id = vRP.getUserId(source)
					if user_id and vRP.hasPermissions(user_id,schest.permissions or {}) then
						vRP.openChest(source,"static:"..k,schest.weight or 0)
					end
				end

				local function schest_leave(source)
					vRP.closeMenu(source)
				end

				vRP.setArea(source,"vRP:static_chest:"..k,x,y,z,1,1,schest_enter,schest_leave)
			end
		end
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		build_client_static_chests(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local vehglobal = {
	["blista"] = { ['name'] = "Blista", ['price'] = 33000, ['tipo'] = "carros" },
	["brioso"] = { ['name'] = "Brioso", ['price'] = 36000, ['tipo'] = "carros" },
	["emperor"] = { ['name'] = "Emperor", ['price'] = 90000, ['tipo'] = "carros" },
	["emperor2"] = { ['name'] = "Emperor 2", ['price'] = 50000, ['tipo'] = "carros" },
	["dilettante"] = { ['name'] = "Dilettante", ['price'] = 45700, ['tipo'] = "carros" },
	["issi2"] = { ['name'] = "Issi2", ['price'] = 75000, ['tipo'] = "carros" },
	["panto"] = { ['name'] = "Panto", ['price'] = 29000, ['tipo'] = "carros" },
	["savestra"] = { ['name'] = "Savestra", ['price'] = 63500, ['tipo'] = "carros" },
	["prairie"] = { ['name'] = "Prairie", ['price'] = 23150, ['tipo'] = "carros" },
	["rhapsody"] = { ['name'] = "Rhapsody", ['price'] = 28000, ['tipo'] = "carros" },
	["cogcabrio"] = { ['name'] = "Cogcabrio", ['price'] = 260000, ['tipo'] = "carros" },
	["exemplar"] = { ['name'] = "Exemplar", ['price'] = 235000, ['tipo'] = "carros" },
	["f620"] = { ['name'] = "F620", ['price'] = 263000, ['tipo'] = "carros" },
	["felon"] = { ['name'] = "Felon", ['price'] = 102000, ['tipo'] = "carros" },
	["ingot"] = { ['name'] = "Ingot", ['price'] = 59000, ['tipo'] = "carros" },
	["jackal"] = { ['name'] = "Jackal", ['price'] = 106000, ['tipo'] = "carros" },
	["oracle"] = { ['name'] = "Oracle", ['price'] = 81000, ['tipo'] = "carros" },
	["oracle2"] = { ['name'] = "Oracle2", ['price'] = 93000, ['tipo'] = "carros" },
	["sentinel"] = { ['name'] = "Sentinel", ['price'] = 93000, ['tipo'] = "carros" },
	["sentinel2"] = { ['name'] = "Sentinel Conversível", ['price'] = 120000, ['tipo'] = "carros" },
	["windsor"] = { ['name'] = "Windsor", ['price'] = 111000, ['tipo'] = "carros" },
	["windsor2"] = { ['name'] = "Windsor Super", ['price'] = 430000, ['tipo'] = "carros" },
	["revolter"] = { ['name'] = "Revolter", ['price'] = 480000, ['tipo'] = "carros" },
	["zion"] = { ['name'] = "Zion", ['price'] = 79000, ['tipo'] = "carros" },
	["zion2"] = { ['name'] = "Zion Conversível", ['price'] = 104000, ['tipo'] = "carros" },
	["blade"] = { ['name'] = "Blade", ['price'] = 110000, ['tipo'] = "carros" },
	["buccaneer"] = { ['name'] = "Buccaneer", ['price'] = 115000, ['tipo'] = "carros" },
	["buccaneer2"] = { ['name'] = "Buccaneer2", ['price'] = 160000, ['tipo'] = "carros" },
	["primo"] = { ['name'] = "Primo", ['price'] = 130000, ['tipo'] = "carros" },
	["chino"] = { ['name'] = "Chino", ['price'] = 130000, ['tipo'] = "carros" },
	["coquette3"] = { ['name'] = "Coquette3", ['price'] = 195000, ['tipo'] = "carros" },
	["dukes"] = { ['name'] = "Dukes", ['price'] = 150000, ['tipo'] = "carros" },
	["faction"] = { ['name'] = "Faction", ['price'] = 150000, ['tipo'] = "carros" },
	["faction3"] = { ['name'] = "Faction3", ['price'] = 350000, ['tipo'] = "carros" },
	["gauntlet"] = { ['name'] = "Gauntlet", ['price'] = 230000, ['tipo'] = "carros" },
	["gauntlet2"] = { ['name'] = "Gauntlet2", ['price'] = 165000, ['tipo'] = "carros" },
	["hermes"] = { ['name'] = "Hermes", ['price'] = 280000, ['tipo'] = "carros" },
	["hotknife"] = { ['name'] = "Hotknife", ['price'] = 180000, ['tipo'] = "carros" },
	["moonbeam"] = { ['name'] = "Moonbeam", ['price'] = 99000, ['tipo'] = "carros" },
	["moonbeam2"] = { ['name'] = "Moonbeam2", ['price'] = 250000, ['tipo'] = "carros" },
	["nightshade"] = { ['name'] = "Nightshade", ['price'] = 270000, ['tipo'] = "carros" },
	["picador"] = { ['name'] = "Picador", ['price'] = 150000, ['tipo'] = "carros" },
	["ruiner"] = { ['name'] = "Ruiner", ['price'] = 150000, ['tipo'] = "carros" },
	["sabregt"] = { ['name'] = "Sabregt", ['price'] = 260000, ['tipo'] = "carros" },
	["sabregt2"] = { ['name'] = "Sabregt2", ['price'] = 150000, ['tipo'] = "carros" },
	["slamvan"] = { ['name'] = "Slamvan", ['price'] = 180000, ['tipo'] = "carros" },
	["slamvan3"] = { ['name'] = "Slamvan3", ['price'] = 230000, ['tipo'] = "carros" },
	["stalion"] = { ['name'] = "Stalion", ['price'] = 150000, ['tipo'] = "carros" },
	["stalion2"] = { ['name'] = "Stalion2", ['price'] = 150000, ['tipo'] = "carros" },
	["tampa"] = { ['name'] = "Tampa", ['price'] = 170000, ['tipo'] = "carros" },
	["vigero"] = { ['name'] = "Vigero", ['price'] = 170000, ['tipo'] = "carros" },
	["virgo"] = { ['name'] = "Virgo", ['price'] = 150000, ['tipo'] = "carros" },
	["virgo2"] = { ['name'] = "Virgo2", ['price'] = 250000, ['tipo'] = "carros" },
	["virgo3"] = { ['name'] = "Virgo3", ['price'] = 180000, ['tipo'] = "carros" },
	["voodoo"] = { ['name'] = "Voodoo", ['price'] = 220000, ['tipo'] = "carros" },
	["voodoo2"] = { ['name'] = "Voodoo2", ['price'] = 220000, ['tipo'] = "carros" },
	["yosemite"] = { ['name'] = "Yosemite", ['price'] = 350000, ['tipo'] = "carros" },
	["bfinjection"] = { ['name'] = "Bfinjection", ['price'] = 65000, ['tipo'] = "carros" },
	["bifta"] = { ['name'] = "Bifta", ['price'] = 35000, ['tipo'] = "carros" },
	["bodhi2"] = { ['name'] = "Bodhi2", ['price'] = 170000, ['tipo'] = "carros" },
	["brawler"] = { ['name'] = "Brawler", ['price'] = 260000, ['tipo'] = "carros" },
	["trophytruck"] = { ['name'] = "Trophytruck", ['price'] = 450000, ['tipo'] = "carros" },
	["trophytruck2"] = { ['name'] = "Trophytruck2", ['price'] = 450000, ['tipo'] = "carros" },
	["dubsta3"] = { ['name'] = "Dubsta 3", ['price'] = 355000, ['tipo'] = "carros" },
	["mesa3"] = { ['name'] = "Mesa 3", ['price'] = 179000, ['tipo'] = "carros" },
	["rancherxl"] = { ['name'] = "Rancher XL", ['price'] = 165000, ['tipo'] = "carros" },
	["rebel2"] = { ['name'] = "Rebel 2", ['price'] = 179000, ['tipo'] = "carros" },
	["riata"] = { ['name'] = "Riata", ['price'] = 212000, ['tipo'] = "carros" },
	["dloader"] = { ['name'] = "Dloader", ['price'] = 145000, ['tipo'] = "carros" },
	["sandking"] = { ['name'] = "Sandking CD", ['price'] = 399000, ['tipo'] = "carros" },
	["sandking2"] = { ['name'] = "Sandking", ['price'] = 375000, ['tipo'] = "carros" },
	["baller"] = { ['name'] = "Baller", ['price'] = 150000, ['tipo'] = "carros" },
	["baller2"] = { ['name'] = "Baller2", ['price'] = 160000, ['tipo'] = "carros" },
	["baller3"] = { ['name'] = "Baller3", ['price'] = 350000, ['tipo'] = "carros" },
	["baller4"] = { ['name'] = "Baller4", ['price'] = 450000, ['tipo'] = "carros" },
	["baller5"] = { ['name'] = "Baller Blindado", ['price'] = 2000000, ['tipo'] = "carros" },
	["baller6"] = { ['name'] = "Baller Blindado Ext", ['price'] = 2500000, ['tipo'] = "carros" },
	["bjxl"] = { ['name'] = "Bjxl", ['price'] = 279000, ['tipo'] = "carros" },
	["cavalcade"] = { ['name'] = "Cavalcade", ['price'] = 289000, ['tipo'] = "carros" },
	["cavalcade2"] = { ['name'] = "Cavalcade2", ['price'] = 312000, ['tipo'] = "carros" },
	["contender"] = { ['name'] = "Contender", ['price'] = 450000, ['tipo'] = "carros" },
	["dubsta"] = { ['name'] = "Dubsta", ['price'] = 240000, ['tipo'] = "carros" },
	["dubsta2"] = { ['name'] = "Dubsta2", ['price'] = 240000, ['tipo'] = "carros" },
	["fq2"] = { ['name'] = "Fq2", ['price'] = 275000, ['tipo'] = "carros" },
	["granger"] = { ['name'] = "Granger", ['price'] = 397000, ['tipo'] = "carros" },
	["gresley"] = { ['name'] = "Gresley", ['price'] = 251000, ['tipo'] = "carros" },
	["habanero"] = { ['name'] = "Habanero", ['price'] = 180000, ['tipo'] = "carros" },
	[""] = { ['name'] = "Seminole", ['price'] = 238000, ['tipo'] = "carros" },
	["seminole2"] = { ['name'] = "Seminole 2", ['price'] = 198000, ['tipo'] = "carros" },
	["fleet72"] = { ['name'] = "Cadillac Fleetwood", ['price'] = 950000, ['tipo'] = "carros" },
	["gtorino76"] = { ['name'] = "Gran Torino 76", ['price'] = 950000, ['tipo'] = "carros" },
	["serrano"] = { ['name'] = "Serrano", ['price'] = 215000, ['tipo'] = "carros" },
	["xls"] = { ['name'] = "Xls", ['price'] = 352000, ['tipo'] = "carros" },
	["xls2"] = { ['name'] = "Xls2", ['price'] = 350000, ['tipo'] = "carros" },
	["asea"] = { ['name'] = "Asea", ['price'] = 28000, ['tipo'] = "carros" },
	["asterope"] = { ['name'] = "Asterope", ['price'] = 46000, ['tipo'] = "carros" },
	["cog552"] = { ['name'] = "Cognoscenti Blindado", ['price'] = 1390000, ['tipo'] = "carros" },
	["cognoscenti"] = { ['name'] = "Cognoscenti Ext", ['price'] = 149000, ['tipo'] = "carros" },
	["cognoscenti2"] = { ['name'] = "Cognoscenti Blindado Ext", ['price'] = 1590000, ['tipo'] = "carros" },
	["regina"] = { ['name'] = "Regina", ['price'] = 68000, ['tipo'] = "carros" },
	["stanier"] = { ['name'] = "Stanier", ['price'] = 49000, ['tipo'] = "carros" },
	["stratum"] = { ['name'] = "Stratum", ['price'] = 75000, ['tipo'] = "carros" },
	["surge"] = { ['name'] = "Surge", ['price'] = 156000, ['tipo'] = "carros" },
	["tailgater"] = { ['name'] = "Tailgater", ['price'] = 109000, ['tipo'] = "carros" },
	["warrener"] = { ['name'] = "Warrener", ['price'] = 40000, ['tipo'] = "carros" },
	["washington"] = { ['name'] = "Washington", ['price'] = 110000, ['tipo'] = "carros" },
	["alpha"] = { ['name'] = "Alpha", ['price'] = 207000, ['tipo'] = "carros" },
	["banshee"] = { ['name'] = "Banshee", ['price'] = 270000, ['tipo'] = "carros" },
	["bestiagts"] = { ['name'] = "Bestia GTS", ['price'] = 209000, ['tipo'] = "carros" },
	["blista2"] = { ['name'] = "Blista2", ['price'] = 33000, ['tipo'] = "carros" },
	["blista3"] = { ['name'] = "Blista3", ['price'] = 80000, ['tipo'] = "carros" },
	["buffalo"] = { ['name'] = "Buffalo", ['price'] = 214000, ['tipo'] = "carros" },
	["buffalo2"] = { ['name'] = "Buffalo2", ['price'] = 248000, ['tipo'] = "carros" },
	["buffalo3"] = { ['name'] = "Buffalo3", ['price'] = 300000, ['tipo'] = "carros" },
	["carbonizzare"] = { ['name'] = "Carbonizzare", ['price'] = 699000, ['tipo'] = "carros" },
	["comet2"] = { ['name'] = "Comet2", ['price'] = 380000, ['tipo'] = "carros" },
	["comet3"] = { ['name'] = "Comet3", ['price'] = 399000, ['tipo'] = "carros" },
	["comet5"] = { ['name'] = "Comet5", ['price'] = 438000, ['tipo'] = "carros" },
	["coquette"] = { ['name'] = "Coquette", ['price'] = 452000, ['tipo'] = "carros" },
	["elegy"] = { ['name'] = "Elegy", ['price'] = 169000, ['tipo'] = "carros" },
	["elegy2"] = { ['name'] = "Elegy2", ['price'] = 220000, ['tipo'] = "carros" },
	["feltzer2"] = { ['name'] = "Feltzer2", ['price'] = 151000, ['tipo'] = "carros" },
	["furoregt"] = { ['name'] = "Furoregt", ['price'] = 318000, ['tipo'] = "carros" },
	["fusilade"] = { ['name'] = "Fusilade", ['price'] = 153000, ['tipo'] = "carros" },
	["futo"] = { ['name'] = "Futo", ['price'] = 150000, ['tipo'] = "carros" },
	["gb200"] = { ['name'] = "GB 200", ['price'] = 232000, ['tipo'] = "carros" },
	["jester"] = { ['name'] = "Jester", ['price'] = 158000, ['tipo'] = "carros" },
	["khamelion"] = { ['name'] = "Khamelion", ['price'] = 820000, ['tipo'] = "carros" },
	["kuruma"] = { ['name'] = "Kuruma", ['price'] = 309000, ['tipo'] = "carros" },
	["massacro"] = { ['name'] = "Massacro", ['price'] = 290000, ['tipo'] = "carros" },
	["massacro2"] = { ['name'] = "Massacro2", ['price'] = 330000, ['tipo'] = "carros" },
	["ninef"] = { ['name'] = "Ninef", ['price'] = 370000, ['tipo'] = "carros" },
	["ninef2"] = { ['name'] = "Ninef2", ['price'] = 405000, ['tipo'] = "carros" },
	["omnis"] = { ['name'] = "Omnis", ['price'] = 350000, ['tipo'] = "carros" },
	["pariah"] = { ['name'] = "Pariah", ['price'] = 469000, ['tipo'] = "carros" },
	["penumbra"] = { ['name'] = "Penumbra", ['price'] = 225000, ['tipo'] = "carros" },
	["raiden"] = { ['name'] = "Raiden", ['price'] = 899000, ['tipo'] = "carros" },
	["rapidgt"] = { ['name'] = "Rapidgt", ['price'] = 222000, ['tipo'] = "carros" },
	["rapidgt2"] = { ['name'] = "Rapidgt2", ['price'] = 315000, ['tipo'] = "carros" },
	["ruston"] = { ['name'] = "Ruston", ['price'] = 280000, ['tipo'] = "carros" },
	["schafter3"] = { ['name'] = "Schafter3", ['price'] = 275000, ['tipo'] = "carros" },
	["schafter4"] = { ['name'] = "Schafter4", ['price'] = 145000, ['tipo'] = "carros" },
	["schafter5"] = { ['name'] = "Schafter Blindado", ['price'] = 1350000, ['tipo'] = "carros" },
	["schafter6"] = { ['name'] = "Schafter Blindado Ext", ['price'] = 1550000, ['tipo'] = "carros" },
	["schwarzer"] = { ['name'] = "Schwarzer", ['price'] = 260000, ['tipo'] = "carros" },
	["sentinel3"] = { ['name'] = "Sentinel3", ['price'] = 190000, ['tipo'] = "carros" },
	["seven70"] = { ['name'] = "Seven70", ['price'] = 1300000, ['tipo'] = "carros" },
	["specter"] = { ['name'] = "Specter", ['price'] = 364000, ['tipo'] = "carros" },
	["specter2"] = { ['name'] = "Specter2", ['price'] = 355000, ['tipo'] = "carros" },
	["streiter"] = { ['name'] = "Streiter", ['price'] = 200000, ['tipo'] = "carros" },
	["sultan"] = { ['name'] = "Sultan", ['price'] = 196000, ['tipo'] = "carros" },
	["surano"] = { ['name'] = "Surano", ['price'] = 475000, ['tipo'] = "carros" },
	["tampa2"] = { ['name'] = "Tampa2", ['price'] = 890000, ['tipo'] = "carros" },
	["tropos"] = { ['name'] = "Tropos", ['price'] = 191000, ['tipo'] = "carros" },
	["verlierer2"] = { ['name'] = "Verlierer2", ['price'] = 380000, ['tipo'] = "carros" },
	["btype2"] = { ['name'] = "Btype2", ['price'] = 460000, ['tipo'] = "carros" },
	["btype3"] = { ['name'] = "Btype3", ['price'] = 60500, ['tipo'] = "carros" },
	["casco"] = { ['name'] = "Casco", ['price'] = 161000, ['tipo'] = "carros" },
	["cheetah"] = { ['name'] = "Cheetah", ['price'] = 425000, ['tipo'] = "carros" },
	["coquette2"] = { ['name'] = "Coquette2", ['price'] = 163000, ['tipo'] = "carros" },
	["feltzer3"] = { ['name'] = "Feltzer3", ['price'] = 170000, ['tipo'] = "carros" },
	["gt500"] = { ['name'] = "Gt500", ['price'] = 179000, ['tipo'] = "carros" },
	["infernus2"] = { ['name'] = "Infernus2", ['price'] = 250000, ['tipo'] = "carros" },
	["jb700"] = { ['name'] = "Jb700", ['price'] = 220000, ['tipo'] = "carros" },
	["mamba"] = { ['name'] = "Mamba", ['price'] = 300000, ['tipo'] = "carros" },
	["manana"] = { ['name'] = "Manana", ['price'] = 130000, ['tipo'] = "carros" },
	["monroe"] = { ['name'] = "Monroe", ['price'] = 183000, ['tipo'] = "carros" },
	["peyote"] = { ['name'] = "Peyote", ['price'] = 150000, ['tipo'] = "carros" },
	["pigalle"] = { ['name'] = "Pigalle", ['price'] = 250000, ['tipo'] = "carros" },
	["rapidgt3"] = { ['name'] = "Rapidgt3", ['price'] = 185000, ['tipo'] = "carros" },
	["retinue"] = { ['name'] = "Retinue", ['price'] = 32000, ['tipo'] = "carros" },
	["stinger"] = { ['name'] = "Stinger", ['price'] = 191000, ['tipo'] = "carros" },
	["stingergt"] = { ['name'] = "Stingergt", ['price'] = 203000, ['tipo'] = "carros" },
	["torero"] = { ['name'] = "Torero", ['price'] = 160000, ['tipo'] = "carros" },
	["tornado"] = { ['name'] = "Tornado", ['price'] = 150000, ['tipo'] = "carros" },
	["tornado2"] = { ['name'] = "Tornado2", ['price'] = 160000, ['tipo'] = "carros" },
	["tornado6"] = { ['name'] = "Tornado6", ['price'] = 250000, ['tipo'] = "carros" },
	["turismo2"] = { ['name'] = "Turismo2", ['price'] = 250000, ['tipo'] = "carros" },
	["ztype"] = { ['name'] = "Ztype", ['price'] = 400000, ['tipo'] = "carros" },
	["adder"] = { ['name'] = "Adder", ['price'] = 620000, ['tipo'] = "carros" },
	["autarch"] = { ['name'] = "Autarch", ['price'] = 760000, ['tipo'] = "carros" },
	["banshee2"] = { ['name'] = "Banshee2", ['price'] = 1100000, ['tipo'] = "carros" },
	["bullet"] = { ['name'] = "Bullet", ['price'] = 400000, ['tipo'] = "carros" },
	["cheetah2"] = { ['name'] = "Cheetah2", ['price'] = 240000, ['tipo'] = "carros" },
	["entityxf"] = { ['name'] = "Entityxf", ['price'] = 460000, ['tipo'] = "carros" },
	["fmj"] = { ['name'] = "Fmj", ['price'] = 520000, ['tipo'] = "carros" },
	["gp1"] = { ['name'] = "Gp1", ['price'] = 1500000, ['tipo'] = "carros" },
	["infernus"] = { ['name'] = "Infernus", ['price'] = 470000, ['tipo'] = "carros" },
	["nero"] = { ['name'] = "Nero", ['price'] = 450000, ['tipo'] = "carros" },
	["nero2"] = { ['name'] = "Nero2", ['price'] = 1500000, ['tipo'] = "carros" },
	["osiris"] = { ['name'] = "Osiris", ['price'] = 460000, ['tipo'] = "carros" },
	["penetrator"] = { ['name'] = "Penetrator", ['price'] = 480000, ['tipo'] = "carros" },
	["pfister811"] = { ['name'] = "Pfister811", ['price'] = 600000, ['tipo'] = "carros" },
	["reaper"] = { ['name'] = "Reaper", ['price'] = 620000, ['tipo'] = "carros" },
	["sc1"] = { ['name'] = "Sc1", ['price'] = 495000, ['tipo'] = "carros" },
	["sultanrs"] = { ['name'] = "Sultan RS", ['price'] = 350000, ['tipo'] = "carros" },
	["t20"] = { ['name'] = "T20", ['price'] = 850000, ['tipo'] = "carros" },
	["tempesta"] = { ['name'] = "Tempesta", ['price'] = 1100000, ['tipo'] = "carros" },
	["turismor"] = { ['name'] = "Turismor", ['price'] = 620000, ['tipo'] = "carros" },
	["tyrus"] = { ['name'] = "Tyrus", ['price'] = 620000, ['tipo'] = "carros" },
	["vacca"] = { ['name'] = "Vacca", ['price'] = 450000, ['tipo'] = "carros" },
	["visione"] = { ['name'] = "Visione", ['price'] = 690000, ['tipo'] = "carros" },
	["voltic"] = { ['name'] = "Voltic", ['price'] = 440000, ['tipo'] = "carros" },
	["zentorno"] = { ['name'] = "Zentorno", ['price'] = 2500000, ['tipo'] = "carros" },
	["sadler"] = { ['name'] = "Sadler", ['price'] = 480000, ['tipo'] = "carros" },
	["bison"] = { ['name'] = "Bison", ['price'] = 335000, ['tipo'] = "carros" },
	["bison2"] = { ['name'] = "Bison2", ['price'] = 180000, ['tipo'] = "carros" },
	["bobcatxl"] = { ['name'] = "Bobcatxl", ['price'] = 430000, ['tipo'] = "carros" },
	["burrito"] = { ['name'] = "Burrito", ['price'] = 200000, ['tipo'] = "carros" },
	["burrito2"] = { ['name'] = "Burrito2", ['price'] = 150000, ['tipo'] = "carros" },
	["burrito3"] = { ['name'] = "Burrito3", ['price'] = 249000, ['tipo'] = "carros" },
	["burrito4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["mule4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["pounder"] = { ['name'] = "Pounder", ['price'] = 1700000, ['tipo'] = "carros" },
	["mule2"] = { ['name'] = "Mule 2", ['price'] = 550000, ['tipo'] = "carros" },
	["mule"] = { ['name'] = "Mule", ['price'] = 550000, ['tipo'] = "carros" },
	["pounder2"] = { ['name'] = "Pounder 2", ['price'] = 1500000, ['tipo'] = "carros" },
	["rallytruck"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros" },
	["minivan"] = { ['name'] = "Minivan", ['price'] = 191000, ['tipo'] = "carros" },
	["minivan2"] = { ['name'] = "Minivan2", ['price'] = 220000, ['tipo'] = "carros" },
	["paradise"] = { ['name'] = "Paradise", ['price'] = 260000, ['tipo'] = "carros" },
	["pony"] = { ['name'] = "Pony", ['price'] = 260000, ['tipo'] = "carros" },
	["pony2"] = { ['name'] = "Pony2", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo"] = { ['name'] = "Rumpo", ['price'] = 100000, ['tipo'] = "carros" },
	["rumpo2"] = { ['name'] = "Rumpo2", ['price'] = 260000, ['tipo'] = "carros" },
	["rumpo3"] = { ['name'] = "Rumpo3", ['price'] = 350000, ['tipo'] = "carros" },
	["surfer"] = { ['name'] = "Surfer", ['price'] = 138000, ['tipo'] = "carros" },
	["youga"] = { ['name'] = "Youga", ['price'] = 200000, ['tipo'] = "carros" },
	["huntley"] = { ['name'] = "Huntley", ['price'] = 249000, ['tipo'] = "carros" },
	["landstalker"] = { ['name'] = "Landstalker", ['price'] = 289000, ['tipo'] = "carros" },
	["mesa"] = { ['name'] = "Mesa", ['price'] = 150000, ['tipo'] = "carros" },
	["patriot"] = { ['name'] = "Patriot", ['price'] = 480000, ['tipo'] = "carros" },
	["radi"] = { ['name'] = "Radi", ['price'] = 260000, ['tipo'] = "carros" },
	["rocoto"] = { ['name'] = "Rocoto", ['price'] = 268000, ['tipo'] = "carros" },
	["tyrant"] = { ['name'] = "Tyrant", ['price'] = 690000, ['tipo'] = "carros" },
	["entity2"] = { ['name'] = "Entity2", ['price'] = 1400000, ['tipo'] = "carros" },
	["cheburek"] = { ['name'] = "Cheburek", ['price'] = 170000, ['tipo'] = "carros" },
	["hotring"] = { ['name'] = "Hotring", ['price'] = 300000, ['tipo'] = "carros" },
	["jester3"] = { ['name'] = "Jester3", ['price'] = 155000, ['tipo'] = "carros" },
	["jester2"] = { ['name'] = "Jester2", ['price'] = 680000, ['tipo'] = "carros" },
	["flashgt"] = { ['name'] = "Flashgt", ['price'] = 330000, ['tipo'] = "carros" },
	["ellie"] = { ['name'] = "Ellie", ['price'] = 100000, ['tipo'] = "carros" },
	["michelli"] = { ['name'] = "Michelli", ['price'] = 30000, ['tipo'] = "carros" },
	["fagaloa"] = { ['name'] = "Fagaloa", ['price'] = 320000, ['tipo'] = "carros" },
	["dominator"] = { ['name'] = "Dominator", ['price'] = 217000, ['tipo'] = "carros" },
	["dominator2"] = { ['name'] = "Dominator2", ['price'] = 230000, ['tipo'] = "carros" },
	["dominator3"] = { ['name'] = "Dominator3", ['price'] = 252000, ['tipo'] = "carros" },
	["issi3"] = { ['name'] = "Issi3", ['price'] = 65000, ['tipo'] = "carros" },
	["taipan"] = { ['name'] = "Taipan", ['price'] = 620000, ['tipo'] = "carros" },
	["gb200"] = { ['name'] = "Gb200", ['price'] = 174000, ['tipo'] = "carros" },
	["stretch"] = { ['name'] = "Stretch", ['price'] = 2650000, ['tipo'] = "carros" },
	["guardian"] = { ['name'] = "Guardian", ['price'] = 650000, ['tipo'] = "carros" },
	["kamacho"] = { ['name'] = "Kamacho", ['price'] = 238000, ['tipo'] = "carros" },
	["neon"] = { ['name'] = "Neon", ['price'] = 930000, ['tipo'] = "carros" },
	["cyclone"] = { ['name'] = "Cyclone", ['price'] = 2000000, ['tipo'] = "carros" },
	["italigtb"] = { ['name'] = "Italigtb", ['price'] = 600000, ['tipo'] = "carros" },
	["italigtb2"] = { ['name'] = "Italigtb2", ['price'] = 610000, ['tipo'] = "carros" },
	["vagner"] = { ['name'] = "Vagner", ['price'] = 680000, ['tipo'] = "carros" },
	["xa21"] = { ['name'] = "Xa21", ['price'] = 2900000, ['tipo'] = "carros" },
	["tezeract"] = { ['name'] = "Tezeract", ['price'] = 920000, ['tipo'] = "carros" },
	["nimbus"] = { ['name'] = "Nimbus", ['price'] = 920000, ['tipo'] = "work" },
	["shamal"] = { ['name'] = "Shamal", ['price'] = 920000, ['tipo'] = "work" },
	["dune"] = { ['name'] = "Dune", ['price'] = 59000, ['tipo'] = "work" },
	["prototipo"] = { ['name'] = "Prototipo", ['price'] = 1030000, ['tipo'] = "carros" },
	["patriot2"] = { ['name'] = "Patriot2", ['price'] = 3000000, ['tipo'] = "carros" },
	["swinger"] = { ['name'] = "Swinger", ['price'] = 199000, ['tipo'] = "carros" },
	["clique"] = { ['name'] = "Clique", ['price'] = 360000, ['tipo'] = "carros" },
	["deveste"] = { ['name'] = "Deveste", ['price'] = 2500000, ['tipo'] = "carros" },
	["deviant"] = { ['name'] = "Deviant", ['price'] = 370000, ['tipo'] = "carros" },
	["impaler"] = { ['name'] = "Impaler", ['price'] = 170000, ['tipo'] = "carros" },
	["italigto"] = { ['name'] = "Italigto", ['price'] = 730000, ['tipo'] = "carros" },
	["schlagen"] = { ['name'] = "Schlagen", ['price'] = 359000, ['tipo'] = "carros" },
	["toros"] = { ['name'] = "Toros", ['price'] = 465000, ['tipo'] = "carros" },
	["tulip"] = { ['name'] = "Tulip", ['price'] = 114000, ['tipo'] = "carros" },
	["vamos"] = { ['name'] = "Vamos", ['price'] = 110000, ['tipo'] = "carros" },
	["freecrawler"] = { ['name'] = "Freecrawler", ['price'] = 280000, ['tipo'] = "carros" },
	["fugitive"] = { ['name'] = "Fugitive", ['price'] = 69000, ['tipo'] = "carros" },
	["glendale"] = { ['name'] = "Glendale", ['price'] = 120000, ['tipo'] = "carros" },
	["intruder"] = { ['name'] = "Intruder", ['price'] = 67000, ['tipo'] = "carros" },
	["le7b"] = { ['name'] = "Le7b", ['price'] = 700000, ['tipo'] = "carros" },
	["lurcher"] = { ['name'] = "Lurcher", ['price'] = 150000, ['tipo'] = "carros" },
	["lynx"] = { ['name'] = "Lynx", ['price'] = 340000, ['tipo'] = "carros" },
	["phoenix"] = { ['name'] = "Phoenix", ['price'] = 250000, ['tipo'] = "carros" },
	["premier"] = { ['name'] = "Premier", ['price'] = 56000, ['tipo'] = "carros" },
	["raptor"] = { ['name'] = "Raptor", ['price'] = 300000, ['tipo'] = "carros" },
	["sheava"] = { ['name'] = "Sheava", ['price'] = 700000, ['tipo'] = "carros" },
	["z190"] = { ['name'] = "Z190", ['price'] = 195000, ['tipo'] = "carros" },
	["benson"] = { ['name'] = "Benson", ['price'] = 700000, ['tipo'] = "carros" },
	["packer"] = { ['name'] = "Packer", ['price'] = 670000, ['tipo'] = "work" },
	["phantom"] = { ['name'] = "Scania 113H", ['price'] = 670000, ['tipo'] = "work" },
	["stockade"] = { ['name'] = "Carro Forte", ['price'] = 670000, ['tipo'] = "work" },
	-- NOVA DLC
	["club"] = { ['name'] = "Club", ['price'] = 19000, ['tipo'] = "carros" },
	["coquette4"] = { ['name'] = "Coquette 4", ['price'] = 1500000, ['tipo'] = "carros" },
	["glendale2"] = { ['name'] = "Glendale 2", ['price'] = 220000, ['tipo'] = "carros" },
	["landstalker2"] = { ['name'] = "Landstalker 2", ['price'] = 380000, ['tipo'] = "carros" },
	["manana2"] = { ['name'] = "Manana 2", ['price'] = 150000, ['tipo'] = "carros" },
	["penumbra2"] = { ['name'] = "Penumbra 2", ['price'] = 184000, ['tipo'] = "carros" },
	["peyote3"] = { ['name'] = "Peyote 3", ['price'] = 320000, ['tipo'] = "carros" },
	["tigon"] = { ['name'] = "Tigon", ['price'] = 1750000, ['tipo'] = "carros" },
	["yosemite3"] = { ['name'] = "Yosemite 3", ['price'] = 500000, ['tipo'] = "carros" },
	["youga3"] = { ['name'] = "Youga 3", ['price'] = 950000, ['tipo'] = "carros" },
	--MOTOS
	
	["akuma"] = { ['name'] = "Akuma", ['price'] = 106000, ['tipo'] = "motos" },
	["avarus"] = { ['name'] = "Avarus", ['price'] = 80000, ['tipo'] = "motos" },
	["bagger"] = { ['name'] = "Bagger", ['price'] = 99000, ['tipo'] = "motos" },
	["bati"] = { ['name'] = "Bati", ['price'] = 116000, ['tipo'] = "motos" },
	["bati2"] = { ['name'] = "Bati 2 ", ['price'] = 118000, ['tipo'] = "motos" },
	["bf400"] = { ['name'] = "BF400", ['price'] = 400000, ['tipo'] = "motos" },
	["carbonrs"] = { ['name'] = "Carbon RS", ['price'] = 172000, ['tipo'] = "motos" },
	["chimera"] = { ['name'] = "Chimera", ['price'] = 200000, ['tipo'] = "motos" },
	["cliffhanger"] = { ['name'] = "Cliffhanger", ['price'] = 260000, ['tipo'] = "motos" },
	["daemon2"]  = { ['name'] = "Daemon 2", ['price'] = 95000, ['tipo'] = "motos" },
	["defiler"] = { ['name'] = "Defiler", ['price'] = 130000, ['tipo'] = "motos" },
	["diablous"] = { ['name'] = "Diablous", ['price'] = 218000, ['tipo'] = "motos" },
	["diablous2"] = { ['name'] = "Diablous 2", ['price'] = 230000, ['tipo'] = "motos" },
	["double"] = { ['name'] = "Double", ['price'] = 145000, ['tipo'] = "motos" },
	["enduro"] = { ['name'] = "Enduro", ['price'] = 19000, ['tipo'] = "motos" },
	["esskey"] = { ['name'] = "Esskey", ['price'] = 13000, ['tipo'] = "motos" },
	["faggio"] = { ['name'] = "Faggio", ['price'] = 7000, ['tipo'] = "motos" },
	["faggio2"] = { ['name'] = "Faggio 2", ['price'] = 4900, ['tipo'] = "motos" },
	["faggio3"] = { ['name'] = "Faggio 3", ['price'] = 4000, ['tipo'] = "motos" },
	["fcr"] = { ['name'] = "FCR", ['price'] = 120000, ['tipo'] = "motos" },
	["fcr2"] = { ['name'] = "FCR 2", ['price'] = 160000, ['tipo'] = "motos" },
	["gargoyle"] = { ['name'] = "Gargoyle", ['price'] = 98000, ['tipo'] = "motos" },
	["hakuchou"] = { ['name'] = "Hakuchou", ['price'] = 299000, ['tipo'] = "motos" },
	["hakuchou2"] = { ['name'] = "Hakuchou 2", ['price'] = 650000, ['tipo'] = "motos" },
	["hexer"] = { ['name'] = "Hexer", ['price'] = 99000, ['tipo'] = "motos" },
	["innovation"] = { ['name'] = "Innovation", ['price'] = 130000, ['tipo'] = "motos" },
	["lectro"] = { ['name'] = "Lectro", ['price'] = 85000, ['tipo'] = "motos" },
	["manchez"] = { ['name'] = "Manchez", ['price'] = 26000, ['tipo'] = "motos" },
	["nemesis"] = { ['name'] = "Nemesis", ['price'] = 15500, ['tipo'] = "motos" },
	["nightblade"] = { ['name'] = "Nightblade", ['price'] = 145000, ['tipo'] = "motos" },
	["pcj"] = { ['name'] = "PCJ", ['price'] = 17000, ['tipo'] = "motos" },
	["ruffian"] = { ['name'] = "Ruffian", ['price'] = 91000, ['tipo'] = "motos" },
	["sanchez"] = { ['name'] = "Sanchez", ['price'] = 23000, ['tipo'] = "motos" },
	["sanchez2"] = { ['name'] = "Sanchez 2", ['price'] = 31000, ['tipo'] = "motos" },
	["sovereign"] = { ['name'] = "Sovereign", ['price'] = 285000, ['tipo'] = "motos" },
	["thrust"] = { ['name'] = "Thrust", ['price'] = 105000, ['tipo'] = "motos" },
	["vader"] = { ['name'] = "Vader", ['price'] = 89000, ['tipo'] = "motos" },
	["vindicator"] = { ['name'] = "Vindicator", ['price'] = 119000, ['tipo'] = "motos" },
	["vortex"] = { ['name'] = "Vortex", ['price'] = 125000, ['tipo'] = "motos" },
	["wolfsbane"] = { ['name'] = "Wolfsbane", ['price'] = 103000, ['tipo'] = "motos" },
	["zombiea"] = { ['name'] = "Zombie A", ['price'] = 94000, ['tipo'] = "motos" },
	["zombieb"] = { ['name'] = "Zombie B", ['price'] = 108000, ['tipo'] = "motos" },
	["shotaro"] = { ['name'] = "Shotaro", ['price'] = 1100000, ['tipo'] = "motos" },
	["ratbike"] = { ['name'] = "Ratbike", ['price'] = 350000, ['tipo'] = "motos" },
	["blazer"] = { ['name'] = "Blazer", ['price'] = 68000, ['tipo'] = "carros" },
	["blazer4"] = { ['name'] = "Blazer4", ['price'] = 72000, ['tipo'] = "carros" },
	["blazer5"] = { ['name'] = "Blazer4", ['price'] = 78000, ['tipo'] = "carros" },

	--TRABALHO

	["youga2"] = { ['name'] = "Youga2", ['price'] = 1000, ['tipo'] = "work" },
	["felon2"] = { ['name'] = "Felon Conversível", ['price'] = 144000, ['tipo'] = "carros" },
	
	-- Emergência
	["as350pc"] = { ['name'] = "Pelicano Policia Civil", ['price'] = 1000, ['tipo'] = "work" },
	["ram"] = { ['name'] = "Dodge RAM PCERJ", ['price'] = 1000, ['tipo'] = "work" },
	["sprintersamu"] = { ['name'] = "Mercedes Sprinter SAMU", ['price'] = 1000, ['tipo'] = "work" },
	["samumav"] = { ['name'] = "Helicóptero SAMU", ['price'] = 1000, ['tipo'] = "work" },
	["motosamu"] = { ['name'] = "Moto SAMU", ['price'] = 1000, ['tipo'] = "work" },
		
	----------------------------------------------------------------------------------------------------
	["seasparrow"] = { ['name'] = "Paramédico Helicóptero Água", ['price'] = 1000, ['tipo'] = "work" },
	["greenbird3"] = { ['name'] = "Paradiso G7 1600LD (Eucatur)", ['price'] = 1000, ['tipo'] = "work" },
	["bus"] = { ['name'] = "Ônibus Urbano", ['price'] = 1000, ['tipo'] = "work" },
	["mi4"] = { ['name'] = "Caio Apache SPTrans", ['price'] = 1000, ['tipo'] = "work" },
	["airbus"] = { ['name'] = "Ônibus Vila Rica", ['price'] = 1000, ['tipo'] = "work" },
	["coach"] = { ['name'] = "Paradiso G7 1800DD (Util)", ['price'] = 1000, ['tipo'] = "work" },
	["flatbed"] = { ['name'] = "Reboque", ['price'] = 1000, ['tipo'] = "work" },
	["towtruck"] = { ['name'] = "Guincho", ['price'] = 1000, ['tipo'] = "work" },
	["towtruck2"] = { ['name'] = "Guincho 2", ['price'] = 1000, ['tipo'] = "work" },
	["ratloader"] = { ['name'] = "Lenhador", ['price'] = 55000, ['tipo'] = "work" },
	["ratloader2"] = { ['name'] = "Ratloader2", ['price'] = 1000, ['tipo'] = "work" },
	["rubble"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["taxi"] = { ['name'] = "Taxi", ['price'] = 1000, ['tipo'] = "work" },
	["boxville4"] = { ['name'] = "Caminhão", ['price'] = 1000, ['tipo'] = "work" },
	["trash2"] = { ['name'] = "Lixeiro", ['price'] = 1000, ['tipo'] = "work" },
	["trash"] = { ['name'] = "Lixeiro", ['price'] = 1000, ['tipo'] = "work" },
	["tiptruck"] = { ['name'] = "Tiptruck", ['price'] = 1000, ['tipo'] = "work" },
	["scorcher"] = { ['name'] = "Scorcher", ['price'] = 1000, ['tipo'] = "work" },
	["serv_electricscooter"] = { ['name'] = "Patinete Elétrico", ['price'] = 1000, ['tipo'] = "work" },
	["tribike"] = { ['name'] = "Tribike", ['price'] = 1000, ['tipo'] = "work" },
	["tribike2"] = { ['name'] = "Tribike2", ['price'] = 1000, ['tipo'] = "work" },
	["tribike3"] = { ['name'] = "Tribike3", ['price'] = 1000, ['tipo'] = "work" },
	["fixter"] = { ['name'] = "Fixter", ['price'] = 1000, ['tipo'] = "work" },
	["cruiser"] = { ['name'] = "Cruiser", ['price'] = 1000, ['tipo'] = "work" },
	["bmx"] = { ['name'] = "Bmx", ['price'] = 1000, ['tipo'] = "work" },
	["dinghy"] = { ['name'] = "Dinghy", ['price'] = 1000, ['tipo'] = "work" },
	["jetmax"] = { ['name'] = "Jetmax", ['price'] = 1000, ['tipo'] = "work" },
	["marquis"] = { ['name'] = "Marquis", ['price'] = 1000, ['tipo'] = "work" },
	["seashark3"] = { ['name'] = "Seashark3", ['price'] = 1000, ['tipo'] = "work" },
	["speeder"] = { ['name'] = "Speeder", ['price'] = 1000, ['tipo'] = "work" },
	["speeder2"] = { ['name'] = "Speeder2", ['price'] = 1000, ['tipo'] = "work" },
	["squalo"] = { ['name'] = "Squalo", ['price'] = 1000, ['tipo'] = "work" },
	["suntrap"] = { ['name'] = "Suntrap", ['price'] = 1000, ['tipo'] = "work" },
	["toro"] = { ['name'] = "Toro", ['price'] = 1000, ['tipo'] = "work" },
	["toro2"] = { ['name'] = "Toro2", ['price'] = 1000, ['tipo'] = "work" },
	["tropic"] = { ['name'] = "Tropic", ['price'] = 1000, ['tipo'] = "work" },
	["tropic2"] = { ['name'] = "Tropic2", ['price'] = 1000, ['tipo'] = "work" },
	["tug"] = { ['name'] = "Barco Pesqueiro", ['price'] = 1000, ['tipo'] = "work" },
	["hauler"] = { ['name'] = "Man TGX v8", ['price'] = 1000, ['tipo'] = "work" },
	["packer"] = { ['name'] = "Caminhão Packer", ['price'] = 1000, ['tipo'] = "work" },
	["supervolito"] = { ['name'] = "Supervolito", ['price'] = 1000, ['tipo'] = "work" },
	["supervolito2"] = { ['name'] = "Supervolito2", ['price'] = 1000, ['tipo'] = "work" },
	["cuban800"] = { ['name'] = "Cuban800", ['price'] = 1000, ['tipo'] = "work" },
	["mammatus"] = { ['name'] = "Mammatus", ['price'] = 1000, ['tipo'] = "work" },
	["vestra"] = { ['name'] = "Vestra", ['price'] = 1000, ['tipo'] = "work" },
	["velum2"] = { ['name'] = "Velum2", ['price'] = 1000, ['tipo'] = "work" },
	["buzzard2"] = { ['name'] = "Buzzard2", ['price'] = 1000, ['tipo'] = "work" },
	["frogger"] = { ['name'] = "Frogger", ['price'] = 1000, ['tipo'] = "work" },
	["maverick"] = { ['name'] = "Maverick", ['price'] = 1000, ['tipo'] = "work" },
	["tanker2"] = { ['name'] = "Gas", ['price'] = 1000, ['tipo'] = "work" },
	["armytanker"] = { ['name'] = "Diesel", ['price'] = 1000, ['tipo'] = "work" },
	["tvtrailer"] = { ['name'] = "Show", ['price'] = 1000, ['tipo'] = "work" },
	["trailerlogs"] = { ['name'] = "Woods", ['price'] = 1000, ['tipo'] = "work" },
	["tr4"] = { ['name'] = "Cars", ['price'] = 1000, ['tipo'] = "work" },
	["speedo"] = { ['name'] = "Speedo", ['price'] = 200000, ['tipo'] = "carros" },
	["speedo4"] = { ['name'] = "Speedo 4", ['price'] = 230000, ['tipo'] = "carros" },
	["primo2"] = { ['name'] = "Primo2", ['price'] = 63000, ['tipo'] = "carros" },
	["faction2"] = { ['name'] = "Faction2", ['price'] = 200000, ['tipo'] = "work" },
	["chino2"] = { ['name'] = "Chino2", ['price'] = 72500, ['tipo'] = "work" },
	["tornado5"] = { ['name'] = "Tornado5", ['price'] = 200000, ['tipo'] = "work" },
	["daemon"] = { ['name'] = "Daemon", ['price'] = 86000, ['tipo'] = "motos" },
	["deathbike"] = { ['name'] = "Deathbike", ['price'] = 400000, ['tipo'] = "motos" },
	["sanctus"] = { ['name'] = "Sanctus", ['price'] = 180000, ['tipo'] = "motos" },
	["gburrito"] = { ['name'] = "GBurrito", ['price'] = 200000, ['tipo'] = "work" },
	["slamvan2"] = { ['name'] = "Slamvan2", ['price'] = 200000, ['tipo'] = "work" },
	["stafford"] = { ['name'] = "Stafford", ['price'] = 95000, ['tipo'] = "work" },
	["cog55"] = { ['name'] = "Cog55", ['price'] = 107000, ['tipo'] = "work" },
	["superd"] = { ['name'] = "Superd", ['price'] = 127000, ['tipo'] = "carros" },
	["btype"] = { ['name'] = "Btype", ['price'] = 200000, ['tipo'] = "work" },
	["tractor2"] = { ['name'] = "Tractor2", ['price'] = 1000, ['tipo'] = "work" },
	["rebel"] = { ['name'] = "Rebel", ['price'] = 1000, ['tipo'] = "work" },
	["flatbed3"] = { ['name'] = "Plataforma", ['price'] = 1000, ['tipo'] = "work" },
	["volatus"] = { ['name'] = "Volatus", ['price'] = 500000, ['tipo'] = "work" },
	["cargobob2"] = { ['name'] = "Cargo Bob", ['price'] = 500000, ['tipo'] = "work" },
	["cargobob"] = { ['name'] = "Cargo Bob", ['price'] = 500000, ['tipo'] = "work" },
	["mixer"] = { ['name'] = "Betoneira", ['price'] = 500000, ['tipo'] = "work" },

	--VEICULOS POLICIAIS
	["fbi"] = { ['name'] = "Descaracterizada", ['price'] = 1000, ['tipo'] = "work" },
	["fbi2"] = { ['name'] = "Descaracterizada 2", ['price'] = 1000, ['tipo'] = "work" },
	["police4"] = { ['name'] = "Descaracterizada 3", ['price'] = 1000, ['tipo'] = "work" },
	["sheriff2"] = { ['name'] = "Viatura Off-road", ['price'] = 1000, ['tipo'] = "work" },
	["polmav"] = { ['name'] = "Águia", ['price'] = 1000, ['tipo'] = "work" },
	["riot"] = { ['name'] = "Blindado", ['price'] = 1000, ['tipo'] = "work" },
	["pbus"] = { ['name'] = "Onibus da Policia", ['price'] = 1000, ['tipo'] = "work" },
	["police3"] = { ['name'] = "Viatura 3", ['price'] = 1000, ['tipo'] = "work" },
	["police2"] = { ['name'] = "Viatura 2", ['price'] = 1000, ['tipo'] = "work" },
	["police"] = { ['name'] = "Viatura", ['price'] = 1000, ['tipo'] = "work" },
	["policeb"] = { ['name'] = "Motocicleta", ['price'] = 1000, ['tipo'] = "work" },
	["policet"] = { ['name'] = "Descaracterizada 4", ['price'] = 1000, ['tipo'] = "work" },
	["ambulance"] = { ['name'] = "Ambulância", ['price'] = 1000, ['tipo'] = "work" },
	["policeb1"] = { ['name'] = "Hakuchou", ['price'] = 1000, ['tipo'] = "work" },
	["policeb2"] = { ['name'] = "BF400", ['price'] = 1000, ['tipo'] = "work" },
	["polmav2"] = { ['name'] = "Arcanjo", ['price'] = 1000, ['tipo'] = "work" },

	--CARROS DIMOND
	["caracara2"] = { ['name'] = "Caracara", ['price'] = 370000, ['tipo'] = "carros" },
	["drafter"] = { ['name'] = "Drafter", ['price'] = 215000, ['tipo'] = "carros" },
	["dynasty"] = { ['name'] = "Dynasty", ['price'] = 450000, ['tipo'] = "carros" },
	["emerus"] = { ['name'] = "Emerus", ['price'] = 450000, ['tipo'] = "carros" },
	["gauntlet3"] = { ['name'] = "Gauntlet 3", ['price'] = 450000, ['tipo'] = "carros" },
	["gauntlet4"] = { ['name'] = "Gauntlet 4", ['price'] = 255000, ['tipo'] = "carros" },
	["hellion"] = { ['name'] = "Hellion", ['price'] = 200000, ['tipo'] = "carros" },
	["issi7"] = { ['name'] = "Issi 7", ['price'] = 335000, ['tipo'] = "carros" },
	["jugular"] = { ['name'] = "Jugular", ['price'] = 305000, ['tipo'] = "carros" },
	["krieger"] = { ['name'] = "Krieger", ['price'] = 450000, ['tipo'] = "carros" },
	["locust"] = { ['name'] = "Locust", ['price'] = 450000, ['tipo'] = "carros" },
	["nebula"] = { ['name'] = "Nebula", ['price'] = 450000, ['tipo'] = "carros" },
	["neo"] = { ['name'] = "Neo", ['price'] = 450000, ['tipo'] = "carros" },
	["novak"] = { ['name'] = "Novak", ['price'] = 212000, ['tipo'] = "carros" },
	["paragon"] = { ['name'] = "Paragon", ['price'] = 316000, ['tipo'] = "carros" },
	["paragon2"] = { ['name'] = "Paragon Blindado", ['price'] = 450000, ['tipo'] = "carros" },
	["peyote2"] = { ['name'] = "Peyote 2", ['price'] = 450000, ['tipo'] = "carros" },
	["rrocket"] = { ['name'] = "R Rocket", ['price'] = 970000, ['tipo'] = "motos" },
	["s80"] = { ['name'] = "S80", ['price'] = 450000, ['tipo'] = "carros" },
	["thrax"] = { ['name'] = "Thrax", ['price'] = 450000, ['tipo'] = "carros" },
	["zion3"] = { ['name'] = "Zion 3", ['price'] = 450000, ['tipo'] = "carros" },
	
	--CARROS CAYO
	["alkonost"] = { ['name'] = "Alkonost", ['price'] = 100000, ['tipo'] = "avioes" },
	["annihilator2"] = { ['name'] = "Annihilator 2", ['price'] = 100000, ['tipo'] = "avioes" },
	["avisa"] = { ['name'] = "Avisa", ['price'] = 100000, ['tipo'] = "barcos" },
	["brioso2"] = { ['name'] = "Brioso 2", ['price'] = 31000, ['tipo'] = "carros" },
	["dinghy5"] = { ['name'] = "Dinghy 5", ['price'] = 100000, ['tipo'] = "barcos" },
	["italirsx"] = { ['name'] = "Itali RSX", ['price'] = 100000, ['tipo'] = "carros" },
	["kosatka"] = { ['name'] = "Kosatka", ['price'] = 100000, ['tipo'] = "barcos" },
	["longfin"] = { ['name'] = "Longfin", ['price'] = 100000, ['tipo'] = "barcos" },
	["manchez2"] = { ['name'] = "Manchez 2", ['price'] = 38000, ['tipo'] = "carros" },
	["patrolboat"] = { ['name'] = "Patrol Boat", ['price'] = 100000, ['tipo'] = "barcos" },
	["seasparrow2"] = { ['name'] = "Seasparrow 2", ['price'] = 100000, ['tipo'] = "avioes" },
	["seasparrow3"] = { ['name'] = "Seasparrow 3", ['price'] = 100000, ['tipo'] = "avioes" },
	["slamtruck"] = { ['name'] = "Slamtruck", ['price'] = 100000, ['tipo'] = "carros" },
	["squaddie"] = { ['name'] = "Squaddie", ['price'] = 100000, ['tipo'] = "carros" },
	["toreador"] = { ['name'] = "Toreador", ['price'] = 100000, ['tipo'] = "carros" },
	["verus"] = { ['name'] = "Verus", ['price'] = 810000, ['tipo'] = "carros" },
	["vetir"] = { ['name'] = "Vetir", ['price'] = 499000, ['tipo'] = "carros" },
	["veto"] = { ['name'] = "Veto", ['price'] = 100000, ['tipo'] = "carros" },
	["veto2"] = { ['name'] = "Veto 2", ['price'] = 100000, ['tipo'] = "carros" },
	["weevil"] = { ['name'] = "Fusca", ['price'] = 27000, ['tipo'] = "carros" },
	["winky"] = { ['name'] = "Winky", ['price'] = 92000, ['tipo'] = "carros" },

	--CARROS ATUALIZAÇÃO
	["asbo"] = { ['name'] = "Asbo", ['price'] = 100000, ['tipo'] = "carros" },
	["everon"] = { ['name'] = "Everon", ['price'] = 100000, ['tipo'] = "carros" },
	["formula"] = { ['name'] = "Formula", ['price'] = 100000, ['tipo'] = "carros" },
	["formula2"] = { ['name'] = "Formula 2", ['price'] = 100000, ['tipo'] = "carros" },
	["furia"] = { ['name'] = "Furia", ['price'] = 100000, ['tipo'] = "carros" },
	["imorgon"] = { ['name'] = "Imorgon", ['price'] = 100000, ['tipo'] = "carros" },
	["jb7002"] = { ['name'] = "JB700", ['price'] = 100000, ['tipo'] = "carros" },
	["kanjo"] = { ['name'] = "Kanjo", ['price'] = 100000, ['tipo'] = "carros" },
	["komoda"] = { ['name'] = "Komoda", ['price'] = 100000, ['tipo'] = "carros" },
	["outlaw"] = { ['name'] = "Outlaw", ['price'] = 100000, ['tipo'] = "carros" },
	["rebla"] = { ['name'] = "Rebla", ['price'] = 395000, ['tipo'] = "carros" },
	["retinue2"] = { ['name'] = "Retinue 2", ['price'] = 100000, ['tipo'] = "carros" },
	["stryder"] = { ['name'] = "Stryder", ['price'] = 295000, ['tipo'] = "carros" },
	["sugoi"] = { ['name'] = "Sugoi", ['price'] = 300000, ['tipo'] = "carros" },
	["sultan2"] = { ['name'] = "Sultan 2", ['price'] = 100000, ['tipo'] = "carros" },
	["vagrant"] = { ['name'] = "Vagrant", ['price'] = 100000, ['tipo'] = "carros" },
	["vstr"] = { ['name'] = "VSTR", ['price'] = 100000, ['tipo'] = "carros" },
	["yosemite2"] = { ['name'] = "Yosemite 2", ['price'] = 100000, ['tipo'] = "carros" },
	["zhaba"] = { ['name'] = "Zhaba", ['price'] = 100000, ['tipo'] = "carros" },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleGlobal()
	return vehglobal
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLENAME
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleName(vname)
	return vehglobal[vname].name
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEPRICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehiclePrice(vname)
	return vehglobal[vname].price
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.vehicleType(vname)
	return vehglobal[vname].tipo
end

function vRP.openChest2(source,name,max_weight,cb_close,cb_in,cb_out)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		local identity = vRP.getUserIdentity(user_id)
		if data.inventory then
			if not chests[name] then
				local close_count = 0
				local chest = { max_weight = max_weight }
				chests[name] = chest 
				local cdata = vRP.getSData("chest:"..name)
				chest.items = json.decode(cdata) or {}

				local menu = { name = "Baú" }
				local cb_take = function(idname)
					local citem = chest.items[idname]
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					if amount > 0 and amount <= citem.amount then
						local new_weight = vRP.getInventoryWeight(user_id)+vRP.getItemWeight(idname)*amount
						if new_weight <= vRP.getInventoryMaxWeight(user_id) then
							vRP.giveInventoryItem(user_id,idname,amount)
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[RETIROU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							citem.amount = citem.amount - amount

							if citem.amount <= 0 then
								chest.items[idname] = nil
							end

							if cb_out then
								cb_out(idname,amount)
							end
							vRP.closeMenu(source)
						else
							TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.")
						end
					else
						TriggerClientEvent("Notify",source,"negado","Valor inválido.")
					end
				end

				local ch_take = function(player,choice)
					local weight = vRP.computeItemsWeight(chest.items)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",chest.items,cb_take)

					submenu.onclose = function()
						close_count = close_count - 1
						vRP.openMenu(player,menu)
					end
					close_count = close_count + 1
					vRP.openMenu(player,submenu)
				end

				local cb_put = function(idname)
					local amount = vRP.prompt(source,"Quantidade:","")
					amount = parseInt(amount)
					local new_weight = vRP.computeItemsWeight(chest.items)+vRP.getItemWeight(idname)*amount
					if new_weight <= max_weight then
						if amount > 0 and vRP.tryGetInventoryItem(user_id,idname,amount) then
							SendWebhookMessage(webhookbaucasa,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList(idname).." \n[QUANTIDADE]: "..vRP.format(parseInt(amount)).." \n[BAU]: "..name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							local citem = chest.items[idname]

							if citem ~= nil then
								citem.amount = citem.amount + amount
							else
								chest.items[idname] = { amount = amount }
							end

							if cb_in then
								cb_in(idname,amount)
							end
							vRP.closeMenu(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Baú cheio.")
					end
				end

				local ch_put = function(player,choice)
					local weight = vRP.computeItemsWeight(data.inventory)
					local submenu = build_itemlist_menu(string.format("%.2f",weight).." / "..max_weight.."kg",data.inventory,cb_put)

					submenu.onclose = function()
						close_count = close_count-1
						vRP.openMenu(player,menu)
					end

					close_count = close_count+1
					vRP.openMenu(player,submenu)
				end

				menu["Retirar"] = { ch_take }
				menu["Colocar"] = { ch_put }

				menu.onclose = function()
					if close_count == 0 then
						vRP.setSData("chest:"..name,json.encode(chest.items))
						chests[name] = nil
						if cb_close then
							cb_close()
						end
					end
				end
				vRP.openMenu(source,menu)
			else
				TriggerClientEvent("Notify",source,"importante","O baú está sendo utilizado no momento.")
			end
		end
	end
end

function vRP.clearInventory(user_id)
    local data = vRP.getUserDataTable(user_id)
    if data then
        data.inventory = {}
    end
end

