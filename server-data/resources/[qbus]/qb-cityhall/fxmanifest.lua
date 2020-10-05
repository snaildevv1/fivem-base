fx_version 'adamant'

game 'gta5'

description '[QBus] CityHall'
authors 'QBus Developers'
converter 'snaildev'
version '0.0.1'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/main.lua",
    "config.lua"
}

client_scripts {
	"client/main.lua",
    "config.lua"
}

ui_page "html/index.html"

files {
    "html/*.js",
    "html/*.html",
    "html/*.css",
    "html/img/*.png",
    "html/img/*.jpg"
}