" Disable compression shit
" let loaded_gzip        = 1
" let g:loaded_tarPlugin = 1
" let g:loaded_tar       = 1
" let g:loadedZipPlugin  = 1
" let g:loaded_zip       = 1

set nocompatible
runtime macros/matchit.vim
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'ciaranm/detectindent'
Bundle 'vim-scripts/DrawIt'
Bundle 'junegunn/vim-easy-align'
Bundle 'tpope/vim-fugitive'
Bundle 'jamessan/vim-gnupg'
Bundle 'sjl/gundo.vim'
Bundle 'paradigm/vim-multicursor'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'dbakker/vim-projectroot'
Bundle 'tpope/vim-repeat'
Bundle 'mhinz/vim-rfc'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-unimpaired'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vinarise'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ReekenX/vim-rename2'

" Syntax
Bundle 'amdt/vim-niji'
Bundle 'guns/vim-clojure-static'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/Cpp11-Syntax-Support'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'vim-scripts/ebnf.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'jimenezrick/vimerl'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/haskell.vim'
Bundle 'vim-scripts/jam.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/JSON.vim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'juvenn/mustache.vim'
Bundle 'programble/ooc.vim'
Bundle 'petdance/vim-perl'
Bundle 'uarun/vim-protobuf'
Bundle 'vim-scripts/rfc-syntax'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tonyseek/rust.vim'

syntax enable
filetype plugin indent on
colorscheme darkblood

set exrc
set secure
set viminfo+=!

" Fix keys
if &term =~ "rxvt"
	exec "set <kPageUp>=\<ESC>[5^"
	exec "set <kPageDown>=\<ESC>[6^"
endif

nnoremap <F1> :call NumbersToggle()<CR>
imap <F1> <C-o>:call NumbersToggle()<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set invcul cul?<CR>
imap <F3> <C-o>:set invcul cul?<CR>

nnoremap <F4> :set invcursorcolumn cursorcolumn?<CR>
imap <F4> <C-o>:set invcursorcolumn cursorcolumn?<CR>

nnoremap <F5> :call ColorColumnToggle()<CR>
imap <F5> <C-o>:call ColorColumnToggle()<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-c> :redraw!<CR>
imap <C-c> <C-o>:redraw!<CR>

function! ColorColumnToggle()
	if &colorcolumn
		set colorcolumn=
	else
		set colorcolumn=80
	endif
endfunction

augroup cline
	au!
	au WinLeave * set nocursorline
	au WinEnter * set cursorline

	au InsertEnter * set nocursorline
	au InsertLeave * set cursorline

	au VimEnter * set cursorline
augroup END

au VimResized * :wincmd =

set shell=zsh
set mouse=
set directory=~/.vim/tmp/swap
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set backup
set undofile
set undolevels=1000
set undoreload=10000
set noerrorbells
set novisualbell
set magic
set hidden
set shortmess=atI
set wildignore+=*.o,*.obj,.git,*.a,*.so,*.lo,*.class,*.beam,deps/*,Mnesia.*,*.hi,vendor/*,copycat/*
let mapleader="ò"
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw
set synmaxcol=800
set clipboard=unnamed
set nonu
set rnu

set fileencodings=utf-8,latin1
set encoding=utf-8
set termencoding=utf-8
set guifont=Terminus\ 8

set helplang=en
set history=1000
set hlsearch
set incsearch
set sidescroll=1
set scrolloff=3
set nowrap

set autoindent
set smartindent
set preserveindent
set smarttab
set smartcase
set shiftwidth=2
set ts=2
set noexpandtab
set modeline
set tildeop
set cpoptions+=$

set wildmode=longest:full
set wildmenu

" Status line
let s:last_window_id = 0
function StatusLine:id(winnr)
	let r = getwinvar(a:winnr, 'window_id')

	if empty(r)
		let r = s:last_window_id
		let s:last_window_id += 1

		call setwinvar(a:winnr, 'window_id', r)
	endif

	" Without this condition it triggers unneeded statusline redraw
	if getwinvar(a:winnr, '&statusline') isnot# '%!StatusLine:render('.r.')'
		call setwinvar(a:winnr, '&statusline', '%!StatusLine:render('.r.')')
	endif

	return r
endfunction

function StatusLine:git()
	if !exists('b:git_dir')
		return
	endif

	let b:git_head = fugitive#head(7)

  let cd  = exists('*haslocaldir') && haslocaldir() ? 'lcd ' : 'cd '
	let dir = getcwd()

  try
		let root = b:git_dir

		if match(root, '\.git$') != -1
			let root = root[0:-5]
		endif

		let full = expand('%:p')
		let rel  = full[strlen(root) : strlen(full)]

		execute cd.root

		let status = system('git status --porcelain --ignored -- ' . shellescape(full))
		if strlen(l:status) != 1
			let b:git_status = l:status[0:2]
		endif

		let diff = system('git branch -v -v | grep "^\*.*[.*?: .*?]" | sed -e "s@^.*\[[A-Za-z]*/[A-Za-z]*: \(.*[0-9][0-9]*\)\]*.*\$@\1@"')
		if strlen(l:diff)
			let b:git_diff = split(l:diff)
		else
			let b:git_diff = []
		endif

		return b:git_status
  finally
    execute cd.'`=dir`'
  endtry
endfunction

function StatusLine:entry(current, bufnr)
	let render = ''

	if a:bufnr == -1
		if a:current
			let render .= "%1*!%*"
		else
			let render .= "%3*!%*"
		endif
	else
		let modifiable = getbufvar(a:bufnr, '&modifiable')
		let readonly   = getbufvar(a:bufnr, '&readonly')
		let modified   = getbufvar(a:bufnr, '&modified')

		if modifiable && !readonly && !modified
			if a:current
				let render .= "%1*!%*"
			else
				let render .= "%3*!%*"
			endif
		endif

		if !modifiable || readonly
			if a:current
				let render .= "%1*⭤%*"
			else
				let render .= "%3*⭤%*"
			endif
		endif

		if modified
			if a:current
				let render .= "%1*+%*"
			else
				let render .= "%3*+%*"
			endif
		endif
	endif

	return render
endfunction

function StatusLine:render:help(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	let left .= "["
	let left .= StatusLine:entry(a:current, -1)
	let left .= " %1*%{expand('%:t:r')}%*"
	let left .= "] "

	let right .= " [%1*help%*]"
	let right .= " [%1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine:render:none(winnr)
	return repeat('─', winwidth(a:winnr))
endfunction

function StatusLine:render:normal(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	if strlen(bufname(a:bufnr))
		let entry = StatusLine:entry(a:current, a:bufnr)

		let left .= "["
		let left .= StatusLine:entry(a:current, a:bufnr)
		if strlen(l:entry)
			let left .= " "
		endif
		let left .= "%2*%{substitute(expand('%:h'), expand('$HOME'), '~', 'g')}/%1*%{expand('%:t')}%*"
		let left .= "] "
	else
		let left .= "[" . StatusLine:entry(a:current, a:bufnr) . "] "
	endif

	let git_head   = getbufvar(a:bufnr, 'git_head')
	let git_status = getbufvar(a:bufnr, 'git_status')
	let git_diff   = getbufvar(a:bufnr, 'git_diff')

	if strlen(l:git_head)
		let left .= "["
		if strlen(l:git_status)
			if l:git_status[1] == 'M' && l:git_status[0] != 'M'
				let left .= "%4*%* "
			elseif l:git_status[0] == 'A' || l:git_status[0] == 'M'
				let left .= "%5*%* "
			elseif l:git_status[0] == 'D'
				let left .= "%6*%* "
			else
				let left .= "%1*%* "
			endif
		else
			let left .= "%1*%* "
		endif
		let left .= "%2*" . l:git_head . "%*"

		if len(l:git_diff) == 2
			let left .= ' '

			if l:git_diff[0] == 'ahead'
				let left .= '>> '
			else
				let left .= '<< '
			endif

			let left .= "%2*" . l:git_diff[1] . "%*"
		endif

		let left .= "] "
	endif

	if strlen(getwinvar(a:winnr, '&filetype'))
		let right .= " [%1*⭢⭣ %{&filetype}%* %2*%{&enc}%*]"
	else
		let right .= " [%1*⭢⭣%* %2*%{&enc}%*]"
	endif

	let right .= " [%1* %l%*:%2*%c%* %1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine:render(window_id)
	let winnr   = index(map(range(1, winnr('$')), 'StatusLine:id(v:val)'), a:window_id) + 1
	let bufnr   = winbufnr(l:winnr)
	let current = w:window_id is# a:window_id

	if getwinvar(l:winnr, '&filetype') == 'help'
		return StatusLine:render:help(l:winnr, l:bufnr, l:current)
	elseif bufname(l:bufnr) =~ "NERD_tree" || bufname(l:bufnr) =~ "Tagbar" || getwinvar(l:winnr, '&filetype') == 'startify'
		return StatusLine:render:none(l:winnr)
	else
		return StatusLine:render:normal(l:winnr, l:bufnr, l:current)
	endif
endfunction

function StatusLine:new()
	call map(range(1, winnr('$')), 'StatusLine:id(v:val)')
endfunction

autocmd BufWritePost * call StatusLine:git()
autocmd BufReadPost *  call StatusLine:git()
autocmd WinEnter *  call StatusLine:git()
autocmd VimEnter * call StatusLine:git()

set showmode
set laststatus=2
set statusline=%!StatusLine:new()
call StatusLine:new()

" Commands
command! -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | DISPLAY=:0.0 xclip
command! -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>
command! -nargs=1 IndentationLocal silent setlocal ts=<args> shiftwidth=<args>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Disable arrows to learn to stop using them
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <S-H> :tabprevious<CR>
map <silent> <S-L> :tabnext<CR>

" Windows
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-j> :wincmd j<CR>

" Other mappings
nmap <Leader>f :CommandT<CR>
nmap <Leader>b :CommandTBuffer<CR>
nmap <Leader>t :CommandTTag<CR>
nmap <Leader>r :CommandTFlush<CR>
nmap <Leader>y :YcmShowDetailedDiagnostic<CR>

nmap <Leader>s :mksession! .vim.session<CR>
nmap <Leader>n :nohlsearch<CR>

nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>U :GundoToggle<CR>
nmap <Leader>Y :YcmDiags<CR>
nmap <Leader>R :YcmCompleter ClearCompilationFlagCache<CR>:YcmForceCompileAndDiagnostics<CR>
nmap <Leader>S :SyntasticCheck<CR>

vnoremap <silent> <Enter> :EasyAlign<CR>

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" NERDTree
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/']

" Syntastic
let g:syntastic_enable_signs         = 1
let g:syntastic_error_symbol         = '!!'
let g:syntastic_style_error_symbol   = '!¡'
let g:syntastic_warning_symbol       = '??'
let g:syntastic_style_warning_symbol = '?¿'

let c_no_curly_error = 1

let g:syntastic_c_checker          = "clang"
let g:syntastic_c_compiler_options = "-std=c11"

let g:syntastic_cpp_checker          = "clang"
let g:syntastic_cpp_compiler_options = "-std=c++11"

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['elixir', 'javascript'] }

" You Complete Me
let g:ycm_global_ycm_extra_conf     = $HOME . '/.vim/ycm.py'
let g:ycm_extra_conf_vim_data       = ['&filetype', 'g:syntastic_c_compiler_options', 'g:syntastic_cpp_compiler_options']
let g:ycm_key_invoke_completion     = '<Leader><Leader><Tab>'

let g:ycm_key_list_select_completion   = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Leader><Tab>', '<Up>']

let g:ycm_min_num_of_chars_for_completion = 3

set completeopt=menuone

let g:ycm_filetype_blacklist = {
	\ 'notes' : 1,
	\ 'markdown' : 1,
	\ 'text' : 1,
	\ 'gitcommit': 1,
	\ 'mail': 1,
\}

" gitgutter
let g:gitgutter_all_on_focusgained = 0
let g:gitgutter_eager = 0

" au VimEnter * GitGutterEnable
" au WinEnter * call GitGutter(expand('%:p'))

" Signify
let g:signify_sign_overwrite = 1

" Rainbows
let g:niji_darkblood_colours = [
	\ ['255', '255'],
	\ ['253', '253'],
	\ ['251', '251'],
	\ ['249', '249'],
	\ ['247', '247'],
	\ ['245', '245'],
	\ ['243', '243'],
	\ ['241', '241'],
	\ ['239', '239'],
	\ ['237', '237'],
	\ ['235', '235'],
	\]

" Command-T
let g:CommandTMaxFiles          = 100000
let g:CommandTMaxDepth          = 100
let g:CommandTNeverShowDotFiles = 1

" cctree
let g:CCTreeUsePerl        = 1
let g:CCTreeUseUTF8Symbols = 1

" Clojure
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent            = 1
let g:clojure_fuzzy_indent_patterns   = "with.*,def.*,let.*,case.*"

" ri
nnoremap <Leader>ri :call ri#OpenSearchPrompt(0)<CR>
nnoremap <Leader>RI :call ri#OpenSearchPrompt(1)<CR>
nnoremap <Leader>RK :call ri#LookupNameUnderCursor()<CR>

" startify
let g:startify_skiplist = [
             \ 'COMMIT_EDITMSG',
             \ $VIMRUNTIME .'/doc',
             \ 'bundle/.*/doc' ,
             \ 'vimpager'
             \ ]

" vimshell
let g:vimshell_environment_term       = 'rxvt-256color'
let g:vimshell_scrollback_limit       = 10240

autocmd FileType vimshell
	\ nnoremap <silent> <C-k> :wincmd k<CR>

autocmd FileType int-*
	\ nnoremap <silent> <C-k> :wincmd k<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1
let g:vinarise_detect_large_file_size = -1

autocmd FileType vinarise
	\  nmap <buffer> <C-l> :wincmd l<CR>
	\| nmap <buffer> <C-c> <Plug>(vinarise_redraw)
