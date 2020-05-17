	"KevinYitshak
	set nocompatible              " be iMproved, required
	filetype off                  " required

	let mapleader = ";"
	set splitbelow
	set splitright
	set number
	set relativenumber
	set encoding=utf-8

	set hlsearch
	nnoremap \ :noh<cr>
	set autoindent
	set smartindent
	set smarttab
	set softtabstop=4
	set showmatch
	set undolevels=500
	set ruler
	set backspace=indent,eol,start
	set t_Co=256
	" set cursorline
	set clipboard+=unnamed
	set go+=a
	set foldmethod=indent
	set foldlevel=99
	set wildmode=list,full
	set noswapfile

	set incsearch
	" set viminfo='100,<50,s10,h

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdtree'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'kien/rainbow_parentheses.vim'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'nvie/vim-flake8'
	" Plugin 'vim-python/python-syntax'
	Plugin 'morhetz/gruvbox'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'majutsushi/tagbar'
	Plugin 'tpope/vim-commentary'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'junegunn/fzf'
	Plugin 'junegunn/fzf.vim'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line

	"colorscheme
	:set bg=dark
	let g:gruvbox_contrast_light='medium'
	let g:gruvbox_bold=0
	let g:gruvbox_italic=1
	let g:gruvbox_hls_cursor='orange'
	colorscheme gruvbox
	set cursorline
	hi CursorLine term=bold cterm=bold guibg=Grey40


	"NERDTREE
	" autocmd vimenter * NERDTree
	" autocmd StdinReadPre * let s:std_in=1
	" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	let NERDTreeQuitOnOpen = 1
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1
	let NERDTreeAutoDeleteBuffer = 1
	" nnoremap 1n :NERDTreeToggle<Enter>
	let NERDTreeWinSize=21

	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	"TAG BAR
	let g:tagbar_width=30
	let g:tagbar_zoomwidth=0
	let g:tagbar_autoclose=0
	let g:tagbar_compact=1
	let g:tagbar_show_linenumbers=1
	nnoremap <A-t> :NERDTreeToggle <CR> :TagbarToggle <CR>

	"mouse
	silent! set ttymouse=xterm2
	set mouse=n

	"YCM
	let g:ycm_autoclose_preview_window_after_completion=1
	" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

	" RainbowParanthesis
	let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['black',       'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

	let g:rbpt_max = 16
	let g:rbpt_loadcmd_toggle = 0
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces


	"Easymotion
	let g:EasyMotion_do_mapping = 0 " Disable default mappings

	" Jump to anywhere you want with minimal keystrokes, with just one key binding.
	" `s{char}{label}`
	nmap s <Plug>(easymotion-overwin-f)
	" or
	" `s{char}{char}{label}`
	" Need one more keystroke, but on average, it may be more comfortable.
	nmap s <Plug>(easymotion-overwin-f2)

	" Turn on case-insensitive feature
	let g:EasyMotion_smartcase = 1

	" JK motions: Line motions
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
	map <Leader>w <Plug>(easymotion-w)
	map <Leader>b <Plug>(easymotion-b)


	" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

	" Spell-check set to <leader>o, 'o' for 'orthography':
	map 2s :setlocal spell! spelllang=en_us<CR>

	" Comment
	map c gcc

	"Syntastic
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list=0
	let g:syntastic_auto_loc_list=1
	let g:syntastic_check_on_open=0
	let g:syntastic_check_on_wq =0
	nnoremap 1c :SyntasticCheck<CR>
	nnoremap 1s :SyntasticToggleMode<CR>


	"Window Navigation
	map 1h <C-w>h
	map 1j <C-w>j
	map 1k <C-w>k
	map 1l <C-w>l

	map $ <Nop>
	map ^ <Nop>
	map { <Nop>
	map } <Nop>
	noremap <A-k> {
	noremap <A-j> }
	noremap <A-h> ^
	noremap <A-l> $

	"" Vmap for maintain Visual Mode after shifting > and <
	vmap < <gv
	vmap > >gv

	" Python Highlighting
	" let python_highlight_all = 1
	" let python_highlight_builtin_objs = 1
	" let python_highlight_builtin_funcs = 1
	" let python_highlight_exceptions = 1
	" let python_highlight_string_formatting = 1
	" let python_highlight_string_format = 1
	" let python_highlight_string_templates = 1
	" let python_highlight_indent_errors = 1
	" let python_highlight_space_errors = 1
	" let python_highlight_doctests = 1

	" syn keyword pythonNone	    None
	" syn keyword pythonBoolean	False True
	" syn keyword pythonKeyword	as assert del exec global
	" syn keyword pythonBranch	break continue
	" syn keyword pythonKeyword	lambda nonlocal pass print return with yield
	" syn keyword pythonClassStatement	class nextgroup=pythonClassname skipwhite
	" syn keyword pythonFuncStatement	def cdef nextgroup=pythonFunction skipwhite
	" syn keyword pythonConditional	elif else if
	" syn keyword pythonRepeat	for while
	" syn keyword pythonOperator	and in is not or
	" syn keyword pythonException	except finally raise try
	" syn keyword pythonInclude	from import
	" syn match   pythonFunction	"\h\w*" display contained
	" syn match   pythonClassname	"\h\w*\((\h\w*)\)\?" display contained

	" syn match   pythonComment	"#.*$" display contains=pythonTodo,@Spell
	" syn match   pythonRun		"\%^#!.*$"
	" syn match   pythonCoding	"\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
	" syn keyword pythonTodo		TODO FIXME XXX contained

	" syn match   pythonDecorator	"@" display nextgroup=pythonDottedName skipwhite

	" syn match   pythonDot        "\." display containedin=pythonDottedName


	let g:airline_theme='base16' "base16, luna, deus theme, powerlineish theme, murmur
	let g:airline_solarized_bg='dark'
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#show_close_button=0
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#ale#enabled = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline_skip_empty_sections = 1
	" vim-airline
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	if !exists('g:airline_powerline_fonts')
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		let g:airline_left_sep          = '▶'
		let g:airline_left_alt_sep      = '»'
		let g:airline_right_sep         = '◀'
		let g:airline_right_alt_sep     = '«'
		let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
		let g:airline#extensions#readonly#symbol   = '⊘'
		let g:airline#extensions#linecolumn#prefix = '¶'
		let g:airline#extensions#paste#symbol      = 'ρ'
		let g:airline_symbols.linenr    = '␊'
		let g:airline_symbols.branch    = '⎇'
		let g:airline_symbols.paste     = 'ρ'
		let g:airline_symbols.paste     = 'Þ'
		let g:airline_symbols.paste     = '∥'
		let g:airline_symbols.whitespace ='Ξ'
	else

		let g:airline#extensions#tabline#left_sep = ''
		let g:airline#extensions#tabline#left_alt_sep = ''

		" powerline symbols
		let g:airline_left_sep = ''
		let g:airline_left_alt_sep = ''
		let g:airline_right_sep = ''
		let g:airline_right_alt_sep = ''
		let g:airline_symbols.branch = ''
		let g:airline_symbols.readonly = ''
		let g:airline_symbols.linenr = ''
	endif

	"" no one is really happy until you have this shortcuts
	cnoreabbrev W! w!
	cnoreabbrev Q! q!
	cnoreabbrev Qall! qall!
	cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev wQ wq
	cnoreabbrev WQ wq
	cnoreabbrev W w
	cnoreabbrev Q q
	cnoreabbrev Qall qall"
