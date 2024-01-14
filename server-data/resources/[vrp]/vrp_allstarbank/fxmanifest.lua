fx_version 'adamant'
game 'gta5'


ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"client/html/debounce.min.js",
	"client/html/assets/logo.png",
	"client/html/sweetalert2.all.min.js"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/main.lua"
}
