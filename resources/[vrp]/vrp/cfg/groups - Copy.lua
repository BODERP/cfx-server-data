local cfg = {}

cfg.groups = {
	["Admin"] = {
		"admin.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"mod.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Mod"] = {
		"mod.permissao",
		"polpar.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall"
	},
	["Suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "suporte"
		},
		"suporte.permissao",
		"ticket.permissao",
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret"
	},
	["Blips"] = {
		"blips.permissao"
	},
	["Juiz"] = {
		_config = {
			title = "Juiz",
			gtype = "job"
		},
		"juiz.permissao",
		"sem.permissao"
	},
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"advogado.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- Policial
	["Policial"] = {
		_config = {
			title = "Policial",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"soldesarg.arsenal",
		"portadp.permissao",
		"player.blips",
		"soldado.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaPolicial"] = {
		_config = {
			title = "Policial em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"soldado.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Sargento
	["Sargento"] = {
		_config = {
			title = "Sargento",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"soldesarg.arsenal",
		"sargento.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaSargento"] = {
		_config = {
			title = "Sargento em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"sargento.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Investigador
	["Investigador"] = {
		_config = {
			title = "Investigador",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"capitaoecoronel.arsenal",
		"capitao.servico",
		"player.blips",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaInvestigador"] = {
		_config = {
			title = "Investigador em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"capitao.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Capitão
	["Capitao"] = {
		_config = {
			title = "Capitão",
			gtype = "job"
		},
		"policia.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tencoronelecoronel.arsenal",
		"tencoronel.servico",
		"pgeral.permissao",
		"sem.permissao"
	},
	["PaisanaCapitao"] = {
		_config = {
			title = "Capitão em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"tencoronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Comandante
	["Comandante"] = {
		_config = {
			title = "Comandante",
			gtype = "job"
		},
		"policia.permissao",
		"comandante.permissao",
		"polpar.permissao",
		"player.blips",
		"portadp.permissao",
		"tenenteecoronel.arsenal",
		"coronel.servico",
		"pgeral.permissao",
		"sem.permissao",
	},
	["PaisanaComandante"] = {
		_config = {
			title = "Comandante em folga",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"coronel.folga",
		"player.blips",
		"sem.permissao"
	},
	-- Pode usar o /add  para recrutar policiais
	["LiderPolicia"] = {
		_config = {
			title = "LiderPolicia",
			gtype = "lider"
		},
		"liderpolicia.permissao",
		"polpar.permissao",
		"portadp.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- HOSPITAL  ---------------------------------------
	-----------------------------------------------------
	["Enfermeiro"] = {
		_config = {
			title = "Enfermeiro",
			gtype = "job"
		},
		"paramedico.permissao",
		"enfermeiro.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaEnfermeiro"] = {
		_config = {
			title = "Enfermeiro em folga",
			gtype = "job"
		},
		"paisanaenfermeiro.permissao",
		"enfermeiro.folga",
		"sem.permissao"
	},
	-- Médico
	["Medico"] = {
		_config = {
			title = "Médico",
			gtype = "job"
		},
		"paramedico.permissao",
		"medico.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaMedico"] = {
		_config = {
			title = "Médico em folga",
			gtype = "job"
		},
		"paisanamedico.permissao",
		"medico.folga",
		"sem.permissao"
	},
	-- Diretor
	["Diretor"] = {
		_config = {
			title = "Diretor do Hospital",
			gtype = "job"
		},
		"paramedico.permissao",
		"diretor.servico",
		"polpar.permissao",
		"sem.permissao"
	}, 
	["PaisanaDiretor"] = {
		_config = {
			title = "Diretor em folga",
			gtype = "job"
		},
		"diretor.folga",
		"sem.permissao"
	},
	-----------------------------------------------------
	------- MECÂNICA ------------------------------------
	-----------------------------------------------------
	["Chefe"] = {
		_config = {
			title = "Chefe Bennys",
			gtype = "job"
		},
		"chefe.permissao",
		"chefe.servico",
		"mecanico.permissao",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["Mecanico"] = {
		_config = {
			title = "Mecânico Bennys",
			gtype = "job"
		},
		"mecanico.permissao",
		"mecanico.servico",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["Ajudante"] = {
		_config = {
			title = "Ajudante Bennys",
			gtype = "job"
		},
		"ajudante.permissao",
		"ajudante.servico",
		"mecanico.permissao",
		"ls.permissao",
		"reparo.permissao",
		"callmec.permissao",
		"sem.permissao"
	},
	["PaisanaMecanico"] = {
		_config = {
			title = "Bennys em folga",
			gtype = "job"
		},
		"mecanico.folga"
	},
	["PaisanaChefe"] = {
		_config = {
			title = "Chefe em folga",
			gtype = "job"
		},
		"chefe.folga"
	},
	["PaisanaAjudante"] = {
		_config = {
			title = "Ajudante em folga",
			gtype = "job"
		},
		"ajudante.folga"
	},
	-----------------------------------------------------
	-- DK -----------------------------------------------
	-----------------------------------------------------
	["DK"] = {
		_config = {
			title = "Drift Kings",
			gtype = "job"
		},
		"desmanche.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- VANILLA-------------------------------------------
	-----------------------------------------------------
	["Vanilla"] = {
		_config = {
			title = "Vanilla",
			gtype = "job"
		},
		"vanilla.permissao",
		"lavagem.permissao",
		"sem.permissao"
	},
	-----------------------------------------------------
	-- VIPS ---------------------------------------------
	-----------------------------------------------------
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"barcos.permissao",
		"mochila.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"platina.permissao",
		"mochila.permissao"
	},
	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"barcos.permissao",
		"heli.permissao",
		"diamante.permissao",
		"mochila.permissao"
	},
	-----------------------------------------------------
	-- TAXISTAS -----------------------------------------
	-----------------------------------------------------
	["PaisanaConvencional"] = {
		_config = {
			title = "Taxista Convencional em folga",
			gtype = "job"
		},
		"convencional.folga"
	},
	["PaisanaExecutivo"] = {
		_config = {
			title = "Taxista Executivo em folga",
			gtype = "job"
		},
		"executivo.folga"
	},
	["PaisanaChefeTaxista"] = {
		_config = {
			title = "Chefe dos taxistas em folga",
			gtype = "job"
		},
		"chefetaxistas.folga"
	},
	["TaxistaConvencional"] = {
		_config = {
			title = "Taxista Convencional",
			gtype = "job"
		},
		"convencional.servico",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["TaxistaExecutivo"] = {
		_config = {
			title = "Taxista Executivo",
			gtype = "job"
		},
		"executivo.servico",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["ChefeTaxistas"] = {
		_config = {
			title = "Chefe dos taxistas",
			gtype = "job"
		},
		"chefetaxistas.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	-----------------------------------------------------
	-- TAXISTAS ILEGAL-----------------------------------
	-----------------------------------------------------
	["PaisanaConvencionalIlegal"] = {
		_config = {
			title = "Taxista Convencional em folga",
			gtype = "job"
		},
		"convencional.folga"
	},
	["PaisanaExecutivoIlegal"] = {
		_config = {
			title = "Taxista Executivo em folga",
			gtype = "job"
		},
		"executivo.folga"
	},
	["TaxistaConvencionalIlegal"] = {
		_config = {
			title = "Taxista Convencional",
			gtype = "job"
		},
		"convencional.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	["TaxistaExecutivoIlegal"] = {
		_config = {
			title = "Taxista Executivo",
			gtype = "job"
		},
		"executivo.servico",
		"lavagem.permissao",
		"taxista.permissao",
		"garagetaxi.permissao"
	},
	-----------------------------------------------------
	-- LIXEIRO -----------------------------------------
	-----------------------------------------------------
	["PaisanaLixeiro"] = {
		_config = {
			title = "Lixeiro em folga",
			gtype = "job"
		},
		"lixeiro.folga"
	},
	["PaisanaChefeLixeiro"] = {
		_config = {
			title = "Chefe dos lixeiros em folga",
			gtype = "job"
		},
		"chefelixeiro.folga"
	},
	["Lixeiro"] = {
		_config = {
			title = "Lixeiro",
			gtype = "job"
		},
		"lixeiro.servico",
		"lixeiro.permissao",
		"garagelixeiro.permissao"
	},
	["ChefeLixeiro"] = {
		_config = {
			title = "Chefe dos lixeiros",
			gtype = "job"
		},
		"chefelixeiro.servico",
		"reciclagem.permissao",
		"lixeiro.permissao",
		"garagelixeiro.permissao"
	},
	-----------------------------------------------------
	-- LIXEIRO ILEGAL-----------------------------------
	-----------------------------------------------------
	["PaisanaLixeiroIlegal"] = {
		_config = {
			title = "Lixeiro em folga",
			gtype = "job"
		},
		"lixeiro.folga"
	},
	["LixeiroIlegal"] = {
		_config = {
			title = "Lixeiro Convencional",
			gtype = "job"
		},
		"lixeiro.servico",
		"lixeiro.permissao",
		"reciclagem.permissao",
		"garagetaxi.permissao"
	},
	-----------------------------------------------------
	-- FACÇÕES ------------------------------------------
	-----------------------------------------------------
	["Helipa"] = { --Maconha
		_config = {
			title = "Helipa",
			gtype = "job"
		},
		"helipa.permissao",
		"ilegal.permissao"
	},
	["Zeronze"] = { --Maconha
		_config = {
			title = "Zeronze",
			gtype = "job"
		},
		"zeronze.permissao",
		"ilegal.permissao"
	},
	["Vidigal"] = { --Cocaína
		_config = {
			title = "Vidigal",
			gtype = "job"
		},
		"vidigal.permissao",
		"ilegal.permissao"
	},
	["Mare"] = { --Ecstasy
		_config = {
			title = "Maré",
			gtype = "job"
		},
		"mare.permissao",
		"ilegal.permissao"
	},
	["Kennedy"] = { --Metanfetamina
		_config = {
			title = "Vila Kennedy",
			gtype = "job"
		},
		"kennedy.permissao",
		"ilegal.permissao"
	},
	["Motoclub"] = {
		_config = {
			title = "Motoclub",
			gtype = "job"
		},
		"motoclub.permissao",
		"municao.permissao",
		"ilegal.permissao"
	},
	["Abutres"] = { --Munição
		_config = {
			title = "Abutres",
			gtype = "job"
		},
		"abutres.permissao",
		"ilegal.permissao"
	},
	["Bratva"] = {
		_config = {
			title = "Bratva",
			gtype = "job"
		},
		"bratva.permissao",
		"municao.permissao",
		"ilegal.permissao"
	},
	["Yakuza"] = {
		_config = {
			title = "Yakuza",
			gtype = "job"
		},
		"yakuza.permissao",
		"lavagem.permissao",
		"ilegal.permissao"
	},
	["Italianos"] = {
		_config = {
			title = "Máfia Italiana",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos2"] = {
		_config = {
			title = "Máfia Italiana 2",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos3"] = {
		_config = {
			title = "Máfia Italiana 3",
			gtype = "job"
		},
		"milicia.permissao",
		"player.blips",
		"ilegal.permissao"
	},
	["Italianos3"] = {
		_config = {
			title = "Máfia Italiana 4",
			"player.blips",
			gtype = "job"
		},
		"milicia.permissao",
		"ilegal.permissao"
	},
	--[[["Fazendeiro"] = {
		_config = {
			title = "Fazendeiro",
			gtype = "job"
		},
		"buscape.permissao"
	},]]
}

cfg.users = {
	[1] = { "Admin" }
}

cfg.selectors = {

}

return cfg