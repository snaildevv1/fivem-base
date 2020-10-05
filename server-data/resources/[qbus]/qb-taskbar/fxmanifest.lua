fx_version 'adamant'

game 'gta5'

description '[QBus] Notify'
authors 'QBus Developers'
converter 'snaildev'
version '0.0.1'

client_script {
  "client.lua",
}

ui_page 'html/index.html'

files {
  "html/index.html",
  "html/scripts.js",
  "html/css/style.css"
}

export {
    "taskBar",
    "closeGuiFail"
}