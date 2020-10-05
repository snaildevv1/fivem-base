fx_version 'adamant'

game 'gta5'

description '[QBus] Notify'
authors 'QBus Developers'
converter 'snaildev'
version '0.0.1'

client_scripts {
	'client/main.lua'
}

ui_page {
    'html/ui.html',
}

files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
}

exports {
	'SendAlert',
	'DoShortHudText',
	'DoHudText',
	'DoLongHudText',
	'DoCustomHudText',
	'PersistentHudText',
}