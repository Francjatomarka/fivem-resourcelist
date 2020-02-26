name 'Resource List'
author 'glitchdetector'
version '1.0'
contact 'https://forum.cfx.re/u/glitchdetector'

description 'Tracks started resources'
game 'common'
fx_version 'adamant'
server_script 'sv_list.lua'
server_only 'rrerr'

server_exports {
    'GetActiveResourceList',
    'GetDeactivatedResourceList',
    'GetAllResources',
}
