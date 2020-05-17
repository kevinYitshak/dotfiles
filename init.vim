"KevinYitshak

set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'lifepillar/vim-solarized8'

"AIRLINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"PYTHON
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-python/python-syntax'
" Plugin 'psf/black', { 'branch': 'stable'  }
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'

" VISTA & LSP
Plugin 'liuchengxu/vista.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

"MISC
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ryanoasis/vim-devicons'

" Plugin 'mhinz/vim-startify'
" Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

set t_Co=256

"COLORSCHEME
set background=dark
let g:gruvbox_filetype_hi_groups=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_transp_bg=1
colorscheme gruvbox8

" set background=dark
" colorscheme solarized8_flat
" let g:solarized_extra_hi_groups=1
" let g:solarized_old_cursor_style=1
" let g:solarized_statusline=1
" let g:solarized_termtrans=0
set termguicolors
set cursorline


" RainbowParanthesis
let g:rainbow_active=1
let g:rainbow_ctermfgs = ['green', 'yellow', 'cyan', 'magenta', 'red']
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
map ej <Plug>(easymotion-j)
map ek <Plug>(easymotion-k)
map ew <Plug>(easymotion-w)
map eb <Plug>(easymotion-b)


" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Spell-check set to <leader>o, 'o' for 'orthography':
map 1s :setlocal spell! spelllang=en_us<cr>

" Comment
map c gcc

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq =0
let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'
let g:syntastic_python_checkers = [ 'pyflakes', 'pep8', 'flake8', 'pylint']
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
nnoremap <A-c> :SyntasticCheck<cr>
nnoremap <A-s> :SyntasticToggleMode<cr>

" Black
" let g:black_fast=0
" autocmd BufWritePre *.py execute ':Black'

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

" FZF
" nnoremap <silent> <leader>f :FZF<cr>
" nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <A-f> :Files<cr>
nnoremap <silent> <A-b> :Buffers<cr>
let g:fzf_layout = { 'right': '~35' }


" Autocompletion and lsp
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
set completeopt+=preview
nnoremap <leader>v :Vista!!<cr>

let g:lsp_diagnostics_enabled = 0
let g:vista_executive_for = {
			\ 'python': 'vim_lsp',
			\ }
let g:vista_ignore_kinds = ['Variable']
let g:airline#extensions#vista#enabled = '0'
let g:vista_icon_indent = ["╰▸ ", "├▸ "]
let g:vista_fzf_preview = ['right:40%']
let g:vista_stay_on_open=0
let g:vista_diable_statusline=1
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it
" as you wish.
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }

" function! NearestMethodOrFunction() abort
"	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" ------------------------------------------------------------------------------------------------------------

"NOT IN USE

" Use deoplete.
" let g:deoplete#enable_at_startup = 1


" ACK
"let g:ackprg = 'ag --nogroup --nocolor --column'
"map <leader>ac :Ack<Space>

" Jedi-Vim
" let g:jedi#auto_initialization=1
" let g:jedi#goto_command = "gc"
" let g:jedi#goto_definitions_command = "gd"
" let g:jedi#completions_enabled=1
"

" NERDTREE
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeAutoDeleteBuffer = 1
" " nnoremap 1n :NERDTreeToggle<Enter>
" let NERDTreeWinSize=21
" let g:webdevicons_enable_nerdtree = 1
" nnoremap <A-t> :NERDTreeToggle<cr>


"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""TAG BAR
"let g:tagbar_width=30
"let g:tagbar_zoomwidth=0
"let g:tagbar_autoclose=0
"let g:tagbar_compact=1
"let g:tagbar_show_linenumbers=1
"let g:tagbar_autofocus=1
"nnoremap <leader>t :TagbarToggle<cr>
