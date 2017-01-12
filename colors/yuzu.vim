" Name:       yuzu.vim
" Author:     yami-beta
" License:    The MIT License (MIT)

scriptencoding utf-8

let g:colors_name = 'yuzu'
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let s:black       = {'cterm': '234', 'gui': '#2e2930'} " 紫黒
let s:white       = {'cterm': '251', 'gui': '#c0c6c9'} " 灰青
let s:red         = {'cterm': '124', 'gui': '#d7003a'} " 紅
let s:blue        = {'cterm': '125', 'gui': '#007bbb'} " 紺碧
let s:yellow      = {'cterm': '25',  'gui': '#d9a62e'} " 櫨染
let s:green       = {'cterm': '70',  'gui': '#38b48b'} " 翡翠色
let s:magenta     = {'cterm': '136', 'gui': '#e7609e'} " 牡丹
let s:cyan        = {'cterm': '37',  'gui': '#00a3af'} " 浅葱色
let s:gray        = {'cterm': '243', 'gui': '#7b7c7d'} " 鉛色
let s:dark_gray   = {'cterm': '238', 'gui': '#474a4d'} " 藍墨茶

function! s:highlight(group, fg, bg, ...)
  let opts = get(a:, 1, '')
  let highlight_ary = []

  if type(a:fg) == v:t_dict
    let highlight_ary += ['ctermfg='.a:fg.cterm] + ['guifg='.a:fg.gui]
  elseif a:fg ==# 'NONE'
    let highlight_ary += ['ctermfg=NONE'] + ['guifg=NONE']
  endif
  if type(a:bg) == v:t_dict
    let highlight_ary += ['ctermbg='.a:bg.cterm] + ['guibg='.a:bg.gui]
  elseif a:bg ==# 'NONE'
    let highlight_ary += ['ctermbg=NONE'] + ['guibg=NONE']
  endif

  execute 'highlight! '.a:group.' term=NONE '.join(highlight_ary, ' ').' '.opts
endfunction

call s:highlight('Normal', s:white, s:black)
call s:highlight('Comment', s:gray, '')
call s:highlight('Constant', s:cyan, '')
hi! link String Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant
hi! link Character Constant
hi! link Delimiter Constant


call s:highlight('Identifier', s:yellow, '')
hi! link Function Identifier
hi! link Title Identifier

call s:highlight('Statement', s:blue, '', 'gui=NONE')
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement

call s:highlight('PreProc', s:blue, '')
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

call s:highlight('Type', s:yellow, '', 'gui=NONE')
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

call s:highlight('Special', s:blue, '')
hi! link SpecialChar Special
hi! link Tag Special
call s:highlight('Delimiter', s:yellow, '')
hi! link SpecialComment Delimiter
hi! link Debug Delimiter

call s:highlight('Visual', '', s:dark_gray)
call s:highlight('Search', s:white, s:magenta)
hi! link IncSearch Search
call s:highlight('Underlined', s:yellow, '', 'cterm=underline gui=underline')
call s:highlight('MatchParen', s:white, s:magenta)

hi! link LineNr Comment
call s:highlight('CursorLine', '', s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('CursorLineNr', s:yellow, s:dark_gray)
call s:highlight('SpecialKey', s:dark_gray, '', 'cterm=NONE gui=NONE')

hi! link NonText SpecialKey
call s:highlight('Cursor', s:white, s:yellow)
call s:highlight('Directory', s:yellow, '')
call s:highlight('Pmenu', s:white, s:dark_gray)
call s:highlight('PmenuSel', s:white, s:yellow)
call s:highlight('PmenuSbar', s:white, s:dark_gray)
call s:highlight('PmenuThumb', s:white, s:gray)

call s:highlight('Folded', s:gray, 'NONE')
call s:highlight('FoldColumn', s:dark_gray, 'NONE')

call s:highlight('WildMenu', s:white, s:gray)
call s:highlight('StatusLine', s:white, s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('StatusLineNC', s:gray, s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('TabLine', s:white, s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('TabLineSel', s:white, s:black, 'cterm=NONE gui=NONE')
hi! link TabLineFill Tabline
call s:highlight('VertSplit', s:dark_gray, s:dark_gray, 'cterm=NONE gui=NONE')

call s:highlight('Todo', s:white, s:blue)
call s:highlight('DiffAdd', s:green, 'NONE')
call s:highlight('DiffChange', s:yellow, 'NONE')
call s:highlight('DiffDelete', s:magenta, 'NONE')
call s:highlight('DiffText', s:blue, 'NONE')
" hi! diffAdded
" hi! diffRemoved
call s:highlight('Error', s:white, s:red, 'cterm=bold gui=bold')
call s:highlight('ErrorMsg', s:red, 'NONE')
call s:highlight('WarningMsg', s:red, '')
call s:highlight('Question', s:yellow, '')

call s:highlight('MoreMsg', s:gray, '', 'cterm=bold gui=bold')
call s:highlight('ModeMsg', s:gray, '', 'cterm=bold gui=bold')
" hi! Operator
call s:highlight('SignColumn', s:yellow, 'NONE')
" hi! Special
call s:highlight('SpellBad', '', '', 'gui=undercurl guisp='.s:blue.gui)
call s:highlight('SpellCap', '', '', 'gui=undercurl guisp='.s:green.gui)
call s:highlight('SpellLocal', '', '', 'gui=undercurl guisp='.s:yellow.gui)
call s:highlight('SpellRare', '', '', 'gui=undercurl guisp='.s:red.gui)
" hi! Structure
