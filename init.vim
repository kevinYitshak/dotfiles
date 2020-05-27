" KevinYitshak
let g:python3_host_prog='/home/kevin/miniconda3/bin/python3'

set nocompatible              " be iMproved, required
filetype off                  " required
" set nocp

let mapleader = ";"
imap <A-q> <Esc><cr>

set splitbelow
set splitright
set number
set relativenumber

set hlsearch
nnoremap \ :noh<cr>
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set showmatch
set undolevels=500
set ruler
set backspace=indent,eol,start
set cursorline
set clipboard+=unnamed
set go+=a
set foldmethod=indent
set foldlevel=99
set wildmode=list,full
set noswapfile
set incsearch
set ignorecase
set smartcase
set path+=**


"VIM inbuilt autocomplete
" ^x^n for JUST this file
" ^x^f for filenames
" ^x^] for tags only
" ^n for anything specified
" ^n and ^p to scroll up and down

"mouse
silent! set ttymouse=xterm2
set mouse=n

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"Vundle
Plugin 'VundleVim/Vundle.vim'

"FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"COLORSCHEMES
Plugin 'lifepillar/vim-gruvbox8'
" Plugin 'lifepillar/vim-solarized8'
" Plugin 'KeitaNakamura/neodark.vim'

"AIRLINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"PYTHON
Plugin 'Chiel92/vim-autoformat'
Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plugin 'psf/black', { 'branch': 'stable'  }
" Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-commentary'

let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['┊']

"Async autocomplete
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

" Autocompletion and lsp
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"MISC
" Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ryanoasis/vim-devicons'

Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()            " required
filetype plugin indent on    " required
"-------------------------------------------------------------------------------------------------------------------------
"Semshi syntax highlighting

let g:semshi#filetypes=['python']
let g:semshi#excluded_hl_groups=['local']
let g:semshi#error_sign=v:false
nmap <silent> <leader>n :Semshi goto name next<CR>
nmap <silent> <leader>N :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

"-------------------------------------------------------------------------------------------------------------------------
"MAKE TAGS

let g:gutentags_modules=['ctags', 'gtags_cscope']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" makes tag in the current directory
" in folder name called tag.
" ^] to jump to tag
" g^] to list all tags
" ^t to jump back up the tag stack
" All of your Plugins must be added before the following line


" Auto format
noremap fo :Autoformat<cr>

"AIRLINE
let g:airline_theme='base16' "base16, luna, deus theme, powerlineish theme, murmur
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
"-------------------------------------------------------------------------------------------------------------------------

set t_Co=256

" COLORSCHEME
set background=dark
let g:gruvbox_filetype_hi_groups=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_transp_bg=0
colorscheme gruvbox8


" colorscheme neodark
" let g:neodark#terminal_transparent = 1
" let g:neodark#solid_vertsplit = 1
" let g:neodark#background = '#202020'


" set background=dark
" colorscheme solarized8_flat
" let g:solarized_extra_hi_groups=1
" let g:solarized_old_cursor_style=1
" let g:solarized_statusline=1
" let g:solarized_termtrans=0
set termguicolors
set cursorline
"-------------------------------------------------------------------------------------------------------------------------


" RainbowParanthesis
let g:rainbow_active=1
let g:rainbow_ctermfgs = ['green', 'yellow', 'cyan', 'magenta', 'red']
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"-------------------------------------------------------------------------------------------------------------------------


"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map ej <Plug>(easymotion-j)
map ek <Plug>(easymotion-k)
map ew <Plug>(easymotion-w)
map eb <Plug>(easymotion-b)
"-------------------------------------------------------------------------------------------------------------------------

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Spell-check set to <leader>o, 'o' for 'orthography':
map 1s :setlocal spell! spelllang=en_us<cr>
"-------------------------------------------------------------------------------------------------------------------------

"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=0
"let g:syntastic_auto_loc_list=0
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq =0
"let g:syntastic_python_flake8_exe = 'python3 -m flake8'
"let g:syntastic_python_checkers = [ 'flake8']
"let g:syntastic_python_flake8_args='--ignore=E501,E128,E225,E226'
"let g:syntastic_error_symbol = '✗✗'
"let g:syntastic_style_error_symbol = '✠✠'
"let g:syntastic_warning_symbol = '∆∆'
"let g:syntastic_style_warning_symbol = '≈≈'
"nnoremap <A-c> :SyntasticCheck<cr>
"nnoremap <A-s> :SyntasticToggleMode<cr>
"-------------------------------------------------------------------------------------------------------------------------

" Black
" let g:black_fast=0
" autocmd BufWritePre *.py execute ':Black'
"-------------------------------------------------------------------------------------------------------------------------

"Window Navigation
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>
map * <Nop>

noremap <A-k> {
noremap <A-j> }
noremap <A-h> ^
noremap <A-l> $
noremap fi *

"Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
"-------------------------------------------------------------------------------------------------------------------------

" Python Highlighting
let python_highlight_all = 1
let python_highlight_builtin_objs = 1
let python_highlight_builtin_funcs = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1
let python_highlight_doctests = 1
"-------------------------------------------------------------------------------------------------------------------------

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
"-------------------------------------------------------------------------------------------------------------------------

" FZF
" nnoremap <silent> <leader>f :FZF<cr>
" nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <A-f> :Files<cr>
nnoremap <silent> <A-b> :Buffers<cr>
nnoremap <silent> <A-t> :Tags<cr>
" let g:fzf_layout = { 'right': '~35' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"-------------------------------------------------------------------------------------------------------------------------

"VIM-COMMENTARY
map c gcc
"-------------------------------------------------------------------------------------------------------------------------
