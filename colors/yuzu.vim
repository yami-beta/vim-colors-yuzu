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

let s:black     = [ '#2e2930', '235' ] " 紫黒
let s:white     = [ '#c0c6c9', '251' ] " 灰青
let s:red       = [ '#c85179', '168' ] " 中紅
let s:blue      = [ '#007bbb', '32' ]  " 紺碧
let s:yellow    = [ '#d9a62e', '178' ] " 櫨染
let s:green     = [ '#00a381', '36' ]  " 花緑青
let s:magenta   = [ '#aa4c8f', '132' ] " 梅紫
let s:cyan      = [ '#00a3af', '37' ]  " 浅葱色
let s:gray      = [ '#7b7c7d', '244' ] " 鉛色
let s:dark_gray = [ '#393f4c', '238' ] " 藍鉄
let s:dark_blue = [ '#165e83', '24' ]  " 藍色

function! s:highlight(group, fg, bg, ...)
  let opts = get(a:, 1, '')
  let highlight_ary = []

  if type(a:fg) == v:t_list
    let highlight_ary += ['ctermfg='.a:fg[1]] + ['guifg='.a:fg[0]]
  elseif a:fg ==# 'NONE'
    let highlight_ary += ['ctermfg=NONE'] + ['guifg=NONE']
  endif
  if type(a:bg) == v:t_list
    let highlight_ary += ['ctermbg='.a:bg[1]] + ['guibg='.a:bg[0]]
  elseif a:bg ==# 'NONE'
    let highlight_ary += ['ctermbg=NONE'] + ['guibg=NONE']
  endif

  execute 'highlight! '.a:group.' term=NONE '.join(highlight_ary, ' ').' '.opts
endfunction

call s:highlight('Normal', s:white, s:black)
call s:highlight('Comment', s:gray, '')
call s:highlight('Constant', s:yellow, '')
call s:highlight('String', s:cyan, '')
hi! link Number String
hi! link Boolean String
hi! link Float String
hi! link Character String
hi! link Delimiter String

call s:highlight('Identifier', s:blue, '')
call s:highlight('Function', s:yellow, '')
hi! link Title Function

call s:highlight('Statement', s:green, '', 'gui=NONE')
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement

call s:highlight('Label', s:green, '')

call s:highlight('PreProc', s:green, '')
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

call s:highlight('Type', s:blue, '', 'gui=NONE')
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

call s:highlight('Special', s:blue, '')
hi! link SpecialChar Special
hi! link Tag Special
call s:highlight('Delimiter', s:yellow, '')
hi! link SpecialComment Delimiter
hi! link Debug Delimiter

call s:highlight('Visual', '', s:dark_blue)
call s:highlight('Search', s:white, s:red)
hi! link IncSearch Search
call s:highlight('Underlined', s:yellow, '', 'cterm=underline gui=underline')
call s:highlight('MatchParen', s:white, s:red)

hi! link LineNr Comment
call s:highlight('CursorLine', '', s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('CursorColumn', '', s:dark_gray, 'cterm=NONE gui=NONE')
call s:highlight('CursorLineNr', s:yellow, s:dark_gray)
call s:highlight('SpecialKey', s:dark_gray, '', 'cterm=NONE gui=NONE')

hi! link NonText SpecialKey
call s:highlight('Cursor', s:black, s:yellow)
call s:highlight('Directory', s:yellow, '')
call s:highlight('Pmenu', s:white, s:dark_gray)
call s:highlight('PmenuSel', s:black, s:yellow)
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
call s:highlight('DiffDelete', s:red, 'NONE')
call s:highlight('DiffText', s:blue, 'NONE')
hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete

call s:highlight('Error', s:white, s:red, 'cterm=bold gui=bold')
call s:highlight('ErrorMsg', s:red, 'NONE')
call s:highlight('WarningMsg', s:red, '')
call s:highlight('Question', s:yellow, '')

call s:highlight('MoreMsg', s:gray, '', 'cterm=bold gui=bold')
call s:highlight('ModeMsg', s:gray, '', 'cterm=bold gui=bold')
" hi! Operator
call s:highlight('SignColumn', s:yellow, 'NONE')
" hi! Special
call s:highlight('SpellBad', '', '', 'gui=undercurl guisp='.s:blue[0])
call s:highlight('SpellCap', '', '', 'gui=undercurl guisp='.s:green[0])
call s:highlight('SpellLocal', '', '', 'gui=undercurl guisp='.s:yellow[0])
call s:highlight('SpellRare', '', '', 'gui=undercurl guisp='.s:red[0])
" hi! Structure

" Ruby
call s:highlight('rubyAttribute', s:yellow, '')
call s:highlight('rubyLocalVariableOrMethod', s:green, '')
call s:highlight('rubyGlobalVariable', s:green, '')
call s:highlight('rubyInstanceVariable', s:green, '')
call s:highlight('rubyKeyword', s:green, '')
call s:highlight('rubyKeywordAdMethod', s:green, '', 'cterm=bold gui=bold')
call s:highlight('rubyClassDeclaration', s:green, '', 'cterm=bold gui=bold')
call s:highlight('rubyClass', s:green, '', 'cterm=bold gui=bold')
call s:highlight('rubyNumber', s:green, '')

" JavaScript
call s:highlight('jsBuiltins', s:yellow, '')
call s:highlight('jsFunction', s:green, '', 'cterm=bold gui=bold')
call s:highlight('jsGlobalObjects', s:blue, '')
call s:highlight('jsAssignmentExps', s:green, '')

" HTML
call s:highlight('htmlLink', s:green, '', 'cterm=underline gui=underline')
call s:highlight('htmlStatement', s:green, '')
call s:highlight('htmlSpecialTagName', s:green, '')

" Go
call s:highlight('goBuiltins', s:yellow, '')
call s:highlight('goMethodCall', s:yellow, '')
call s:highlight('goVarAssign', s:green, '')
call s:highlight('goVarDefs', s:green, '')

" PHP
call s:highlight('phpStructure', s:green, '')
hi! link phpVarSelector Normal
hi! link phpIdentifier Normal
