local cfg = {}

cfg.items = {
	["ferramenta"] = { "Ferramenta",0.3 },
	["encomenda"] = { "Encomenda",1.2 },
	["sacodelixo"] = { "Saco de Lixo",2 },
	["reciclaveis"] = { "Recicláveis",1 },
	["garrafavazia"] = { "Garrafa Vazia",0.2 },
	["garrafadeleite"] = { "Garrafa de Leite",0.5 },
	["tora"] = { "Tora de Madeira",0.6 },
	["alianca"] = { "Aliança",0 },
	["bandagem"] = { "Bandagem",0.7 },
	["dorflex"] = { "Dorflex",0 },
	["cicatricure"] = { "Cicatricure",0 },
	["dipiroca"] = { "Dipiroca",0 },
	---------------------------------------------------------
	--[ Remédios ]-------------------------------------------
	---------------------------------------------------------
	["Paracetamol"] = { "paracetamil",0.2 },
	["Voltarem"] = { "voltarom",0.2 },
	["Tandrilax"] = { "trandrylux",0.2 },
	["Dorflex"] = { "dorfrex",0.2 },
	["Buscopam"] = { "buscopom",0.2 },
	---------------------------------------------------------
	--[ Receitas ]-------------------------------------------
	---------------------------------------------------------
	["r-paracetamil"] = { "Receituário Paracetamil",0.0 },
	["r-voltarom"] = { "Receituário Voltarom",0.0 },
	["r-trandrylux"] = { "Receituário Trandrylux",0.0 },
	["r-dorfrex"] = { "Receituário Dorfrex",0.0 },
	["r-buscopom"] = { "Receituário Buscopom",0.0 },
	---------------------------------------------------------
	["Advil"] = { "Nocucedin",0 },
	["Paracetamol"] = { "Paracetanal",0 },
	["Dramin"] = { "Decupramim",0 },
	["Buscopam"] = { "Buscopau",0 },
	["Novalgina"] = { "Navagina",0 },
	["Anador"] = { "Analdor",0 },
	["Losartana"] = { "Sefodex",0 },
	["Anlodipino"] = { "Nokusin",0 },
	["glicoanal"] = { "Glicoanal",0 },
	["batata"] = { "Batata",0.4 },
	["cerveja"] = { "Cerveja",0.7 },
	["tequila"] = { "Tequila",0.7 },
	["quimico"] = { "Produto Químico",0.3 },
	["vodka"] = { "Vodka",0.7 },
	["whisky"] = { "Whisky",0.7 },
	["conhaque"] = { "Conhaque",0.7 },
	["absinto"] = { "Absinto",0.7 },
	["dinheirosujo"] = { "Dinheiro Sujo",0 },
	["dinheirofalso"] = { "Dineiro Sujo",0 },
	["repairkit"] = { "Kit de Reparos",3 },
	["repairkitdois"] = { "Kit de Reparo",3 },
	["algemas"] = { "Algemas",1 },
	["projetodearmas"] = { "Projeto de Armas",0.5 },
	["capuz"] = { "Capuz",0.5 },
	["lockpick"] = { "Lockpick",5 },
	["masterpick"] = { "Masterpick",10 },
	["pneus"] = { "Pneus", 10 },
	["militec"] = { "Militec-1",0.8 },
	["carnedecormorao"] = { "Carne de Cormorão",0.7 },
	["carnedecorvo"] = { "Carne de Corvo",0.7 },
	["carnedeaguia"] = { "Carne de Águia",0.8 },
	["carnedecervo"] = { "Carne de Cervo",0.9 },
	["carnedecoelho"] = { "Carne de Coelho",0.7 },
	["carnedecoyote"] = { "Carne de Coyote",1 },
	["carnedelobo"] = { "Carne de Lobo",1 },
	["carnedepuma"] = { "Carne de Puma",1.3 },
	["carnedejavali"] = { "Carne de Javali",1.4 },
	["amora"] = { "Amora",0.2 },
	["cereja"] = { "Cereja",0.2 },
	["isca"] = { "Isca",0.2 },
	["dourado"] = { "Dourado",0.6 },
	["corvina"] = { "Corvina",0.6 },
	["salmao"] = { "Salmão",0.6 },
	["pacu"] = { "Pacu",0.6 },
	["pintado"] = { "Pintado",0.6 },
	["pirarucu"] = { "Pirarucu",0.6 },
	["tilapia"] = { "Tilápia",0.6 },
	["tucunare"] = { "Tucunaré",0.6 },
	["lambari"] = { "Lambari",0.6 },
	["cacao"] = { "Cação",1.3 },
	["arraia"] = { "Arraia",1.3 },
	["cherne"] = { "Cherne",1.3 },
	["caranha"] = { "Caranha",1.3 },
	["pargo"] = { "Pargo",1.3 },
	["badejo"] = { "Badejo",1.3 },
	["viola"] = { "Viola",1.3 },
	["budiao"] = { "Budião",1.3 },
	["piava"] = { "Piava",1.3 },
	["energetico"] = { "Energético",0.3 },
	["mochila"] = { "Mochila",0 },
	["adubo"] = { "Adubo",0.8 },
	["fertilizante"] = { "Fertilizante",0.8 },
	-- Maconha -----------------------------------------------------------------
	["maconha"] = { "Maconha",0.5 },
	["ramosdemaconha"] = { "Ramos de Maconha",0.5 },
	["maconhanaoprocessada"] = { "Maconha não Processada",0.5 },
	["maconhamisturada"] = { "Maconha Misturada",0.5 },
	["baseado"] = { "Baseado",0.5 },
	["seda"] = { "Papel de Seda",0.05 },
	["receita1"] = { "Receita Médica",0.0 },
	["receita2"] = { "Receita Médica",0.0 },
	-- Anfetamina ---------------------------------------------------------------
	["acidobateria"] = { "Ácido de bateria",0.5 },
	["anfetamina"] = { "Anfetamina",0.5 },
	["cristal"] = { "Cristal de Metanfetamina",0.5 },
	["metanfetamina"] = { "Metanfetamina",0.5 },
	["pipe"] = { "Pipe",0.05 },
	-- Ecstasy -----------------------------------------------------------------
	["ocitocina"] = { "Ocitocina Sintética",0.5 },
	["ociacido"] = { "Ácido Anf. Desidratado",0.5 },
	["primaecstasy"] = { "Matéria Prima - Ecstasy",0.5 },
	["ecstasy"] = { "Ecstasy",0.5 },
	["glicerina"] = { "Glicerina",0.05 },
	-- Cocaína -----------------------------------------------------------------
	["folhadecoca"] = { "Folha de Cocaina",0.5 },
	["pastadecoca"] = { "Pasta de Cocaina",0.5 },
	["cocamisturada"] = { "Cocaína Misturada",0.5 },
	["cocaina"] = { "Cocaína",0.5 },
	["ziplock"] = { "Saco ZipLock",0.1 },
	-- LSD -----------------------------------------------------------------
	["fungo"] = { "Fungo",0.5 },
    ["dietilamina"] = { "Dietilamina",0.5 },
    ["lsd"] = { "LSD",0.5 },
	--[[--------------------------------------------------------------------------
	-- Lavagem de Dinheiro -----------------------------------------------------
	["impostoderenda"] = { "Imposto de Renda",0.2 },
	["impostoderendafalso"] = { "Imposto de Renda Falso",0.2 },]]
	----------------------------------------------------------------------------
	-- Lavagem de Dinheiro -----------------------------------------------------
	["notarecebimento"] = { "Nota de Recebimento",0.2 },
	["notarecebimentofalso"] = { "Nota de Recebimento Falsa",0.2 },
    ----------------------------------------------------------------------------
	-- Bratva Munições ---------------------------------------------------------
	["capsula"] = { "Cápsula",0.03 },
	["polvora"] = { "Pólvora",0.03 },
	["detonador"] = { "Detonador",0.03 },
	["ferramentas"] = { "Ferramentas Pesadas",10.00 },
    ----------------------------------------------------------------------------
	["carregador"] = { "Carregador",0.1 },
	["mira"] = { "Mira",0.1 },
	["silenciador"] = { "Silenciador",0.1 },
	["xratao"] = { "X-Ratão",0.1 },
	["celular"] = { "Celular",0.1 },
	["grip"] = { "Grip.png",0.1 },
	["capsula"] = { "Cápsula",0.03 },
	["polvora"] = { "Pólvora",0.03 },
	["orgaos"] = { "Órgãos",1.2 },
	["etiqueta"] = { "Etiqueta",0 },
	["pendrive"] = { "Pendrive",0.1 },
	["relogioroubado"] = { "Relógio Roubado",0.3 },
	["pulseiraroubada"] = { "Pulseira Roubada",0.2 },
	["anelroubado"] = { "Anel Roubado",0.2 },
	["colarroubado"] = { "Colar Roubado",0.2 },
	["brincoroubado"] = { "Brinco Roubado",0.2 },
	["carteiraroubada"] = { "Carteira Roubada",0.2 },
	["tabletroubado"] = { "Tablet Roubado",0.2 },
	["sapatosroubado"] = { "Sapatos Roubado",0.2 },
	["vibradorroubado"] = { "Vibrador Roubado",0.2 },
	["perfumeroubado"] = { "Perfume Roubado",0.2 },
	["armacaodearma"] = { "Armacao de Arma",0.8 },
	-----------------------------
	-- FARM YAKUZA
	-----------------------------
	["celular"] = { "Celular",0.0 },
	["celulardesbloqueado"] = { "Celular Desbloqueado",0.2 },
	["celularroubado"] = { "Celular Roubado",0.2 },
	-----------------------------
	-- FARM BRATVA
	-----------------------------
	["tecido"] = { "Tecido",0.4 },
	["colete"] = { "Colete Balístico", 5.0},
	-----------------------------
	["pecadeferro"] = { "Peça de Ferro",0.08 },
	["logsinvasao"] = { "Logs de Invasão",0.1 },
	["keysinvasao"] = { "Keys para Invasão",1.0 },
	["pendriveinformacoes"] = { "Pendrive com Informações",0.1 },
	["acessodeepweb"] = { "Acesso á DeepWeb",1.0 },
	["diamante"] = { "Min. Diamante",0.90 },
	["ouro"] = { "Min. Ouro",0.75 },
	["bronze"] = { "Min. Bronze",0.60 },
	["ferro"] = { "Min. Ferro",0.60 },
	["rubi"] = { "Min. Rubi",0.75 },
	["esmeralda"] = { "Min. Esmeralda",0.90 },
	["safira"] = { "Min. Safira",0.25 },
	["topazio"] = { "Min. Topazio",0.90 },
	["ametista"] = { "Min. Ametista",0.60 },
	["diamante2"] = { "Diamante",0.30 },
	["ouro2"] = { "Ouro",0.25 },
	["bronze2"] = { "Bronze",0.20 },
	["ferro2"] = { "Ferro",0.30 },
	["rubi2"] = { "Rubi",0.25 },
	["esmeralda2"] = { "Esmeralda",0.30 },
	["safira2"] = { "Safira",0.25 },
	["topazio2"] = { "Topazio",0.30 },
	["ametista2"] = { "Ametista",0.20 },
	["ingresso"] = { "Ingresso",0.1 },
	["radio"] = { "Radio",1.0 },
	["serra"] = { "Serra",5.0 },
	["furadeira"] = { "Furadeira",5.0 },
	["c4"] = { "C-4",5.0 },
	["roupas"] = { "Roupas",0.8 },
	["graos"] = { "Graos",0.5 },
	["graosimpuros"] = { "Graos Impuros",0.5 },
	["xerelto"] = { "Xerelto",0.1 },
  	["coumadin"] = { "Coumadin",0.1 },
	["identidade"] = { "Identidade",0 },
	["keycard"] = { "Keycard",0.1 },
	["laranja"] = { "Laranja",0.8 },
	["nitro"] = { "Óxido Nitroso",5.0 },
	["tartaruga"] = { "Filhote de Tartaruga",1.0 },
	["carnedetartaruga"] = { "Carne de Tartaruga",0.5 },
	["agua"] = { "agua",0.8 },
	["placa"] = { "Placa",1.0 },
	["aneldecompromisso"] = { "Anel de Compromisso",1.0 },
	["colardeperolas"] = { "Colar de Pérolas",1.0 },
	["pulseiradeouro"] = { "Pulseira de Ouro",1.0 },
	["chocolate"] = { "Chocolate",1.0 },
	["pirulito"] = { "Pirulito",1.0 },
	["buque"] = { "Buquê de Flores",1.0 },
	["projetoassaultrifle"] = { "Certificado de Importação Ak-47", 0.1},
	["projetoassaultsmg"] = { "Certificado de Importação SMG", 0.1},
	["projetobullpuprifle"] = { "Certificado de Importação QBZ", 0.1},
	["projetocarbinerifle"] = { "Certificado de Importação M4A1", 0.1},
	["projetocombatpdw"] = { "Certificado de Importação MPX", 0.1},
	["projetocombatpistol"] = { "Certificado de Importação Glock 19", 0.1},
	["projetogusenberg"] = { "Certificado de Importação Thompson", 0.1},
	["projetopistol"] = { "Certificado de Importação M1911", 0.1},
	["projetopumpshotgun"] = { "Certificado de Importação Shotgun", 0.1},
	["projetosawnoffshotgun"] = { "Certificado de Importação Shot Cano Serrado", 0.1},
	["projetosmg"] = { "Certificado de Importação MP5", 0.1},
	-- Comidas
	["water"] = { "Garrafa de Água",1.0 },
	["paraflu"] = { "Fluído de Radiador",2.0 },
	
}

local function load_item_pack(name)
	local items = module("cfg/item/"..name)
	if items then
		for k,v in pairs(items) do
			cfg.items[k] = v
		end
	end
end

load_item_pack("armamentos")

return cfg