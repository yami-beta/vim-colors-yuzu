scriptencoding utf-8

let s:black     = [ '#2e2930', '235' ] " 紫黒
let s:white     = [ '#c0c6c9', '251' ] " 灰青
let s:red       = [ '#a22041', '125' ] " 真紅
let s:blue      = [ '#007bbb', '32' ]  " 紺碧
let s:yellow    = [ '#d9a62e', '178' ] " 櫨染
let s:green     = [ '#38b48b', '72' ]  " 翡翠色
let s:magenta   = [ '#c85179', '168' ] " 中紅
let s:cyan      = [ '#00a3af', '37' ]  " 浅葱色
let s:gray      = [ '#7b7c7d', '244' ] " 鉛色
let s:dark_gray = [ '#393f4c', '238' ] " 藍鉄
let s:dark_blue = [ '#165e83', '24' ]  " 藍色


let s:p                 = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:black, s:yellow ], [ s:white, s:dark_gray ] ]
let s:p.normal.right    = [ [ s:dark_gray, s:gray ], [ s:gray, s:dark_gray ] ]
let s:p.inactive.right  = [ [ s:black, s:dark_gray ], [ s:gray, s:black ] ]
let s:p.inactive.left   = [ [ s:gray, s:black ], [ s:gray, s:black ] ]
let s:p.insert.left     = [ [ s:white, s:magenta ], [ s:white, s:dark_gray ] ]
let s:p.visual.left     = [ [ s:white, s:dark_blue ], [ s:white, s:dark_gray ] ]
let s:p.replace.left    = [ [ s:white, s:red ], [ s:white, s:dark_gray ] ]
let s:p.normal.middle   = [ [ s:gray, s:black ] ]
let s:p.inactive.middle = [ [ s:gray, s:black ] ]
let s:p.tabline.left    = [ [ s:white, s:dark_gray ] ]
let s:p.tabline.tabsel  = [ [ s:white, s:black ] ]
let s:p.tabline.middle  = [ [ s:white, s:dark_gray ] ]
let s:p.tabline.right   = copy(s:p.tabline.tabsel)
let s:p.normal.error    = [ [ s:white, s:red ] ]
let s:p.normal.warning  = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#yuzu#palette = lightline#colorscheme#flatten(s:p)
