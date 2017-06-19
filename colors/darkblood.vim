" Author: meh.

hi clear

if exists("syntax on")
	syntax reset
endif

let g:colors_name = "darkblood"

" make stuff more readable
set fillchars=stl:┴,stlnc:┴,vert:│,fold:\ 
set listchars=tab:·\ ,trail:░,extends:»,precedes:«
set list

if &term =~ "rxvt"
  silent !echo -ne "\033]12;\#404040\007"
  let &t_SI = "\033]12;\#b21818\007"
  let &t_EI = "\033]12;\#404040\007"
  autocmd VimLeave * :silent !echo -ne "\033]12;\#b21818\007"

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
endif

if &term =~ "cancer"
  silent !echo -ne "\0235cursor:bg:\#404040\0234"
  let &t_SI = "\235cursor:bg:-\234"
  let &t_EI = "\235cursor:bg:\#404040\234"
  autocmd VimLeave * :silent !echo -ne "\0235cursor:bg:-\0234"
endif

" General colors
hi Normal        cterm=NONE      ctermfg=251       ctermbg=NONE
hi Directory     cterm=NONE      ctermfg=red       ctermbg=NONE
hi ErrorMsg      cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi NonText       cterm=NONE      ctermfg=darkgray  ctermbg=NONE
hi SpecialKey    cterm=NONE      ctermfg=236       ctermbg=NONE
hi LineNr        cterm=NONE      ctermfg=darkgrey  ctermbg=NONE
hi IncSearch     cterm=bold      ctermfg=232       ctermbg=darkred
hi Search        cterm=bold      ctermfg=232       ctermbg=darkred
hi Visual        cterm=NONE      ctermfg=white     ctermbg=darkred
hi VisualNOS     cterm=NONE      ctermfg=white     ctermbg=darkred
hi MoreMsg       cterm=bold      ctermfg=white     ctermbg=NONE
hi Question      cterm=bold      ctermfg=white     ctermbg=NONE
hi WarningMsg    cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi WildMenu      cterm=NONE      ctermfg=white     ctermbg=NONE
hi TabLine       cterm=underline ctermfg=white     ctermbg=NONE
hi TabLineSel    cterm=underline ctermfg=white     ctermbg=darkred
hi TabLineFill   cterm=underline ctermfg=white     ctermbg=NONE
hi DiffAdd       cterm=NONE      ctermfg=white     ctermbg=darkgreen
hi DiffChange    cterm=underline ctermfg=NONE      ctermbg=NONE
hi DiffDelete    cterm=NONE      ctermfg=white     ctermbg=darkred
hi DiffText      cterm=NONE      ctermfg=white     ctermbg=NONE
hi SignColumn    cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi VertSplit     cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi CursorColumn  cterm=NONE      ctermfg=NONE      ctermbg=233
hi CursorLineNr  cterm=NONE      ctermfg=NONE      ctermbg=233
hi CursorLine    cterm=NONE      ctermfg=NONE      ctermbg=233
hi ColorColumn   cterm=NONE      ctermfg=NONE      ctermbg=233
hi Cursor        cterm=NONE      ctermfg=white     ctermbg=darkred
hi Title         cterm=bold      ctermfg=white     ctermbg=NONE
hi Pmenu         cterm=NONE      ctermfg=NONE      ctermbg=233
hi PmenuSel      cterm=bold      ctermfg=white     ctermbg=darkred
hi PmenuSbar     cterm=NONE      ctermfg=233       ctermbg=233
hi PmenuThumb    cterm=NONE      ctermfg=darkred   ctermbg=darkred
hi Folded        cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi FoldColumn    cterm=NONE      ctermfg=darkred   ctermbg=NONE
hi MatchParen    cterm=reverse   ctermfg=NONE      ctermbg=NONE

" Status line
hi StatusLine    cterm=NONE ctermfg=darkred ctermbg=NONE
hi StatusLineNC  cterm=NONE ctermfg=darkred ctermbg=black
hi ModeMsg       cterm=bold ctermfg=white   ctermbg=NONE

hi User1 cterm=bold ctermfg=white ctermbg=NONE
hi User2 cterm=NONE ctermfg=white ctermbg=NONE
hi User3 cterm=bold ctermfg=237   ctermbg=NONE
hi User4 cterm=bold ctermfg=220   ctermbg=NONE
hi User5 cterm=bold ctermfg=34    ctermbg=NONE
hi User6 cterm=bold ctermfg=160   ctermbg=NONE

" tty
if &term =~ "linux"
	hi TabLine       cterm=NONE ctermfg=white ctermbg=NONE
	hi TabLineSel    cterm=NONE ctermfg=white ctermbg=darkred
	hi TabLineFill   cterm=NONE ctermfg=white ctermbg=NONE
	hi StatusLine    cterm=NONE ctermfg=black ctermbg=darkred
	hi StatusLineNC  cterm=NONE ctermfg=white ctermbg=NONE
endif

" syntastic
hi SyntasticError   cterm=NONE      ctermfg=white ctermbg=darkred
hi SyntasticWarning cterm=underline ctermfg=white ctermbg=NONE

" Taglist
hi TagListFileName cterm=NONE ctermfg=darkred ctermbg=NONE

" Tagbar
hi TagbarVisibilityPublic cterm=bold ctermfg=white ctermbg=NONE

" ctrlp
hi CtrlPMatch cterm=underline ctermfg=white     ctermbg=NONE
hi CtrlPStats cterm=NONE ctermfg=black ctermbg=darkred

" XML
hi link xmlEndTag Function

" Diff
hi diffIdentical cterm=NONE ctermfg=white ctermbg=NONE
hi diffAdded     cterm=NONE ctermfg=darkgreen ctermbg=NONE

" Python
hi link pythonInclude Statement

" Clojure
hi link clojureKeyword Constant
hi link clojureVariable Identifier
hi link clojureSpecial Keyword

" JavaScript
hi link jsIdentifier Normal

" Java
hi link javaScopeDecl Statement
hi link javaStorageClass Specifier
hi link javaClassDecl Statement
hi link javaMethodDecl Statement
hi link javaExternal Statement

" C
hi link cStructure Keyword
hi link cStorageClass Keyword
hi link Member PreProc
hi link EnumConstant Constant

" C++
hi link cppStructure Keyword
hi link cppStorageClass Keywords

" D
hi link dScopeDecl Statement
hi link dEnum Statement
hi link dStructure Statement
hi link dTypedef Specifier
hi link dStorageClass Specifier
hi link dAttribute Specifier
hi link dAnnotation Statement
hi link dVersionIdentifier Specifier
hi link dTraitsIdentifier Specifier
hi link dDebug Statement

" SASS
hi link sassClass cssClassName
hi link sassClassChar cssClassNameDot

" Rust
hi link rustStorage Specifier
hi link rustSelf    Specifier
hi link rustSigil   Specifier
hi link rustQuestionMark Error

" Kotlin
autocmd Syntax kotlin
	\  hi link ktInclude Statement
	\| hi link ktModifier Statement
	\| hi link ktStructure Specifier

" Haskell
hi link hsModuleName Type
hi link hsType Type
hi link hsStructure Keyword
hi link hsTypedef Keyword
hi link hsModuleStartLabel Keyword
hi link hsImportLabel Keyword
hi link hsVarSym Statement

" gitgutter
hi GitGutterAdd           cterm=NONE ctermfg=2   ctermbg=NONE
hi GitGutterChange        cterm=NONE ctermfg=220 ctermbg=NONE
hi GitGutterDelete        cterm=NONE ctermfg=1   ctermbg=NONE
hi GitGutterChangeDelete  cterm=NONE ctermfg=1   ctermbg=NONE

let g:gitgutter_sign_added="+"
let g:gitgutter_sign_modified="~"
let g:gitgutter_sign_removed="-"
let g:gitgutter_sign_modified_removed="~"

" Signify
highlight SignifySignAdd    cterm=NONE ctermbg=NONE  ctermfg=2
highlight SignifySignDelete cterm=NONE ctermbg=NONE  ctermfg=1
highlight SignifySignChange cterm=NONE ctermbg=NONE  ctermfg=3

let g:signify_sign_add               = '+'
let g:signify_sign_change            = '±'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '^'

" syntax
hi Comment     cterm=NONE ctermfg=darkgrey ctermbg=NONE
hi PreProc     cterm=NONE ctermfg=white    ctermbg=NONE
hi Constant    cterm=NONE ctermfg=darkred  ctermbg=NONE
hi Type        cterm=NONE ctermfg=124      ctermbg=NONE
hi Statement   cterm=bold ctermfg=white    ctermbg=NONE
hi Specifier   cterm=bold ctermfg=124      ctermbg=NONE
hi Identifier  cterm=NONE ctermfg=124      ctermbg=NONE
hi Ignore      cterm=NONE ctermfg=darkgray ctermbg=NONE
hi Special     cterm=NONE ctermfg=darkred  ctermbg=NONE
hi Error       cterm=NONE ctermfg=white    ctermbg=darkred
hi Todo        cterm=NONE ctermfg=white    ctermbg=darkred
hi Underlined  cterm=NONE ctermfg=darkred  ctermbg=NONE
hi Number      cterm=NONE ctermfg=darkred  ctermbg=NONE
hi Function    cterm=NONE ctermfg=white    ctermbg=NONE
hi Define      cterm=bold ctermfg=white    ctermbg=NONE

hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Number          Constant
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Operator        Statement
hi link Include         PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Normal
hi link SpecialComment  Special
hi link Debug           Special
hi link Conditional     Statement
