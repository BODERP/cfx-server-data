cfg = {}
-------------------------------------------------------------------------------------------------------------------------------------
---------CONFIGURAÇÕES
-------------------------------------------------------------------------------------------------------------------------------------
cfg.lavagem = { --Coordenadas dos pontos de Hack
	--{-1053.68,-230.53,44.03}, 
	{106.59,-1305.87,28.77},
}

cfg.lavagemcoord = vector3(106.59,-1305.87,28.77)

cfg.heading = 0.0

cfg.marker = { --Markers dos pontos de Hack
	idmarker = 27,
	x1 = 1.501,
	y1 = 1.5001,
	z1 = 0.5001,
	r = 255,
	g = 0,
	b = 0,
	a = 155,
	pula = 0,
	gira = 1  
}

cfg.blip = {
  id = 521, -- ID DO BLIP
  cor = 1, --COR DO BLIP
  escala = 0.8, --ESCALA DO BLIP(0.0 até 1.0)
  nome = "Lavagem de Dinheiro" --NOME DO BLIP
}

cfg.permissao = "milicia.permissao" --PERMISSÃO PARA USAR A PLATAFORMA

cfg.lavagemporcento = 0.9 

return cfg