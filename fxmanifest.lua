-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

-- Resource Information
author 'EnderDevelopment'
description 'Food Preparation Minigame System for ESX'
version '1.0.0'

-- What to run
client_scripts {
    'client/main.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'server/main.lua'
}

-- NUI Default Page
ui_page 'html/index.html'

-- Files included in resource
files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}

-- Dependencies
dependency 'es_extended'