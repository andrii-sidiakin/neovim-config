"
"
"

" we require more colors
if !has('gui_running') && &t_Co < 256
    finish
endif

" setup background 
set background=dark
"set background=light

" reset highlighting and syntax
hi clear
if exists('syntax_on')
    syntax reset
endif

" set colorscheme name
let g:colors_name = 'mytheme'

" on how to configure cursor
" > https://vim.fandom.com/wiki/Configuring_the_cursor
if 0
    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
endif

" 
hi DEBUG_COLOR      guibg=#ff7777 guifg=#77ff77

" setup base colors
hi Normal           guibg=#161821 guifg=#c6c8d1
hi EndOfBuffer      guibg=#161821 guifg=#c6c8d1
hi NonText          guibg=#161821 guifg=#444b71

hi VertSplit        guibg=#12141c guifg=#1e2132
hi LineNr           guibg=#12141c guifg=#444b71
hi CursorLine       guibg=#1e2132
hi CursorLineNR     guibg=#1e2132 guifg=#b0c4de
hi ColorColumn      guibg=#1e2132
hi CursorColumn     guibg=#1e2132
hi StatusLine       guibg=#b0c4de guifg=#2b2f40  " in focus
hi StatusLineNC     guibg=#818596 guifg=#2b2f40  " not it focus
hi SignColumn       guibg=#12141c
hi Delimiter        guibg=NONE     " commas, braces, bpackets, ...
hi Directory        guifg=#7e9ec9

hi Visual           guibg=#2b2f40

hi Search           guibg=#d0d071
hi MatchParen       guibg=#3b5735

hi Identifier       guifg=#b0c4de " ligher
hi Type             guifg=#7e9ec9 " #8ca9cf
hi Statement        guifg=#84b0c6 "#84a0c6
hi! link PreProc     Statement
hi Function         guifg=#cc9977 "#e2a478
hi Special          guifg=#b4be82
hi Error            guibg=NONE guifg=#e27878
hi Comment          guifg=#818596
hi Constant         guifg=#a693c7

hi DiffAdd          guibg=NONE guifg=#b4be82
hi DiffChange       guibg=NONE guifg=#e2a478
hi DiffDelete       guibg=NONE guifg=#e27878

hi Folded           guibg=#12141c guifg=#b0c4de " #444b71

hi Pmenu            guibg=#282834
"hi PmenuSel         guibg=#00ff00
"hi PmenuSbar        guibg=#00fff0

hi Title            guifg=#b4be82


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"  News-0.10
"  BREAKING CHANGES:
"  These Nvim specific highlight groups are now defined in a meaningfully different way and might need an update:
"   hl-FloatBorder is linked to hl-NormalFloat instead of hl-WinSeparator.
"   hl-NormalFloat is not linked to hl-Pmenu.
"   hl-WinBar has different background.
"   hl-WinBarNC is similar to hl-WinBar but not bold.
"   hl-WinSeparator is linked to hl-Normal instead of hl-VertSplit.

" hi! link FloatBorder       DEBUG_COLOR
" hi! link NormalFloat       DEBUG_COLOR
hi NormalFloat      guibg=#282834
" hi! link WinBar            DEBUG_COLOR
"hi! link WinBarNC          DEBUG_COLOR
"hi! link WinSeparator     DEBUG_COLOR
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"hi Todo             guibg=NONE guifg=#e27878 " #edabab
hi! link Todo DiagnosticInfo

hi! link ErrorMsg Error
hi! link DiagnosticError Error
hi! link DiagnosticHint Comment

" 
" Plugins

" NeoTree
hi NeoTreeGitUntracked  guifg=#bbaba0
hi NeoTreeTitleBar      guibg=#161821
hi NeoTreeFloatTitle    guibg=#161821
hi NeoTreeFloatBorder   guibg=#161821
hi NeoTreeRootName      gui=bold
hi! link NeoTreeGitAdded DiffAdd
hi! link NeoTreeGitConflict Error
hi! link NeoTreeGitDeleted DiffDelete
hi! link NeoTreeGitIgnored Comment
hi! link NeoTreeGitModified DiffChange
hi! link NeoTreeGitUntracked Normal

"


" TreeSitter
hi! link @text.note Todo
hi! link @text.warning DiagnosticWarn
hi! link @text.danger DiagnosticError

" illuminate
hi def IlluminatedWordText guibg=#211f16
hi def IlluminatedWordRead guibg=#182116
hi def IlluminatedWordWrite guibg=#211618

