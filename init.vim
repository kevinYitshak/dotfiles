"kevinYitshak

" let g:python3_host_prog='/home/kevin/miniconda3/bin/python3'

set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent on

"------------------------------------------------------------------------------------------------------------------------
"specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

"------------------------------------------------------------------------------------------------------------------------
" COLORSCHEMES
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
"------------------------------------------------------------------------------------------------------------------------
" AIRLINE
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'hardcoreplayers/dashboard-nvim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
"------------------------------------------------------------------------------------------------------------------------
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugs'}

Plug 'kien/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" --------- adding the following three plugins for Latex ---------
Plug 'lervag/vimtex'
" Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'

call plug#end()
"------------------------------------------------------------------------------------------------------------------------


" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


let mapleader = ";"
imap <A-q> <Esc>

" Splits open at the bottom and right, which is non-retarded, unlike vim
" defaults.
set splitbelow
set splitright

"Line number
set number
set relativenumber

"Highlight search
set nohlsearch
set incsearch

"Indentation
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4

set cursorline

set showmatch
set undolevels=100
set ruler
set backspace=indent,eol,start

set clipboard+=unnamedplus
" set go+=a
set foldmethod=indent
set foldlevel=99
" Enable autocompletion
" set wildmode=list,full

set showtabline=2
set noshowmode
set noswapfile
set ignorecase
set smartcase
set path+=**

"Use windows clipboard if yanked
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif


" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

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

noremap <C-k> {
noremap <C-j> }
noremap <C-h> ^
noremap <C-l> $
noremap fi *

"Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"mouse
silent! set ttymouse=xterm2
set mouse=a

nnoremap <C-t> :tabnew
nnoremap <C-b> :bdelete<cr>
"------------------------------------------------------------------------------------------------------------------------

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
"-----------------------------------------------------------------------------------------------------------------------

set t_Co=256
" Important!!
if has('termguicolors')
	set termguicolors
endif

" COLORSCHEME

set background=dark
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

" set background=dark
" colorscheme forest-night

set cursorline
"------------------------------------------------------------------------------------------------------------------------

" TagBar
let g:tagbar_width = 25
let g:tagbar_iconchars = ['↠', '↡']
map <leader>t :TagbarToggle<CR>

"------------------------------------------------------------------------------------------------------------------------

"AIRLINE

" let g:airline_theme='gruvbox_material' "gruvbox_material, base16, luna, deus theme, powerlineish theme, murmur
" let g:airline_solarized_bg='dark'
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#show_close_button=0
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline_skip_empty_sections = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

"-------------------------------------------------------------------------------------------------------------------------

"VIM-COMMENTARY
map <C-c> gcc

"VIM-EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"-------------------------------------------------------------------------------------------------------------------------
"LINTERS

let g:ale_linters = {'python': ['flake8']}
" let g:ale_lint_on_text_changed = 'never'

"FIXERS
let g:ale_fixers = {
			\	'*': ['remove_trailing_lines', 'trim_whitespace'],
			\	'python': ['black', 'isort']
			\}

let g:ale_fix_on_save = 1

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

" FZF
" nnoremap <silent> <leader>f :FZF<cr>
" nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <A-f> :Files<cr>
nnoremap <silent> <A-b> :Buffers<cr>
nnoremap <silent> <A-t> :Tags<cr>
" let g:fzf_layout = { 'right': '~35' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"-------------------------------------------------------------------------------------------------------------------------

"INDENT
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['┊']
"-------------------------------------------------------------------------------------------------------------------------

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map ej <Plug>(easymotion-j)
map ek <Plug>(easymotion-k)
map ew <Plug>(easymotion-w)
map eb <Plug>(easymotion-b)
"-------------------------------------------------------------------------------------------------------------------------

"Semshi syntax highlighting

let g:semshi#filetypes=['python']
let g:semshi#excluded_hl_groups=['local']
let g:semshi#error_sign=v:false
" nmap <silent> <leader>n :Semshi goto name next<CR>
" nmap <silent> <leader>N :Semshi goto name prev<CR>

" nmap <silent> <leader>c :Semshi goto class next<CR>
" nmap <silent> <leader>C :Semshi goto class prev<CR>

" nmap <silent> <leader>fu :Semshi goto function next<CR>
" nmap <silent> <leader>Fu :Semshi goto function prev<CR>

"-----------------------------------------------------------------------------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"----------------------------------------------------------------------------------------------------------------------
"VIMTEX
let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Open my bibliography file in split
" map <leader>b :vsp<space>$BIB<CR>
" map <leader>r :vsp<space>$REFER<CR>
"----------------------------------------------------------------------------------------------------------------------

"COC-Explorer
nmap <leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"----------------------------------------------------------------------------------------------------------------------

function! CocCurrentFunction()"{{{
	return get(b:, 'coc_current_function', '')
endfunction"}}}
function! Devicons_Filetype()"{{{
	" return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}

function! Tab_num(n) abort"{{{
	return a:n." \ue0bb"
endfunction"}}}

set laststatus=2  " Basic
let g:lightline = {
			\ 'colorscheme': 'gruvbox_material',
			\ }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf529"
let g:lightline#ale#indicator_errors = "\uf00d"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.active = {
			\ 'left': [ [ 'mode', 'paste' ],
			\           [ 'readonly', 'filename', 'modified', 'fileformat', 'devicons_filetype' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
			\           [ 'coc_status' ] ]
			\ }
let g:lightline.inactive = {
			\ 'left': [ [ 'filename' , 'modified', 'fileformat', 'devicons_filetype' ]],
			\ 'right': [ [ 'lineinfo' ] ]
			\ }
let g:lightline.tabline = {
			\ 'left': [ ['vim_logo', 'tabs'] ],
			\ }
let g:lightline.tab = {
			\ 'active': [ 'tabnum', 'filename', 'modified' ]
			\ }

let g:lightline.tab_component = {
			\ }
let g:lightline.tab_component_function = {
			\ 'filename': 'lightline#tab#filename',
			\ 'modified': 'lightline#tab#modified',
			\ 'readonly': 'lightline#tab#readonly',
			\ 'tabnum': 'Tab_num'
			\ }
let g:lightline.component = {
			\ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
			\ 'vim_logo': "\ue7c5",
			\ 'mode': '%{lightline#mode()}',
			\ 'absolutepath': '%F',
			\ 'relativepath': '%f',
			\ 'filename': '%F',
			\ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
			\ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
			\ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
			\ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
			\ 'modified': '%M',
			\ 'bufnum': '%n',
			\ 'paste': '%{&paste?"PASTE":""}',
			\ 'readonly': '%R',
			\ 'charvalue': '%b',
			\ 'charvaluehex': '%B',
			\ 'percent': '%2p%%',
			\ 'percentwin': '%P',
			\ 'spell': '%{&spell?&spelllang:""}',
			\ 'lineinfo': '%2p%% %3l:%-2v',
			\ 'line': '%l',
			\ 'column': '%c',
			\ 'close': '%999X X ',
			\ 'winnr': '%{winnr()}'
			\ }
let g:lightline.component_function = {
			\ 'devicons_filetype': 'Devicons_Filetype',
			\ 'devicons_fileformat': 'Devicons_Fileformat',
			\ 'coc_status': 'coc#status',
			\ 'coc_currentfunction': 'CocCurrentFunction'
			\ }
let g:lightline.component_expand = {
			\ 'linter_checking': 'lightline#ale#checking',
			\ 'linter_warnings': 'lightline#ale#warnings',
			\ 'linter_errors': 'lightline#ale#errors',
			\ 'linter_ok': 'lightline#ale#ok',
			\ }
let g:lightline.component_type = {
			\ 'linter_warnings': 'warning',
			\ 'linter_errors': 'error',
			\ }
"----------------------------------------------------------------------------------------------------------------------
