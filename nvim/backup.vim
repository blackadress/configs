call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar
Plug 'tpope/vim-surround' 
Plug 'flazz/vim-colorschemes' "color schemes para nvim
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine' "mostrar guias de indentacion
Plug 'w0rp/ale'

"cliente de lenguaje
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Soporte semantico de lenguaje
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'

" plugins de complecion
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Soporte sintactico de lenguaje
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

call plug#end()
" Tratamiento de colores

" Configuraciones visuales
set termguicolors
" Colores
set background=dark
colorscheme NeoSolarized

"==================Configuraciones editor ====================================
filetype plugin indent on
set autoindent
set encoding=utf-8
set scrolloff=4
set nojoinspaces
set noshowmode "No mostrar el modo actual (ya lo muestra la barra de estado
set number relativenumber
set hidden " requerido para operaciones modificando multiples buffers como 'rename'
syntax on
let base16colorspace=256

" configuraciones de busqueda
set ignorecase
set smartcase

"tabs
set expandtab
" tabs especificos para js y html
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
" tabs especificos para python y rust
autocmd BufReadPost *.rs setlocal filetype=rust
" autocmd Filetype rust setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype python setlocal tabstop=2 shiftwidth=2 expandtab


" undo permanente
set undodir=~/.config/nvim/undodir
set undofile

" NERDTree
let g:NERDTreeChDirMode = 2 " Cambia el directorio actual al nodo padre actual
" airline
let g:airline#extensions#tabline#enabled = 1 "mostrar buffers (como pestañas)
let g:airline#extensions#tabline#fnamemomd = ':t' "Mostrar solo el nombre del archivo
"indentLine
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" Ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {'rust': ['rls']}

" -----------------------------------ncm2----------------------------------
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"---------------------------------------------------------------------------
" Automaticamente iniciar servidores de lenguaje
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

" rust.vim
let g:rustfmt_autosave = 1
" Abrir/Cerrar NERDTree con <F4>
map <F4> :NERDTreeToggle<CR>

" Alt + j remap a ESC
inoremap <F8> <Esc>
vnoremap <F8> <Esc>
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>

" Shortcut para mostrar <Space> y <Tab>
nnoremap <F5> :set list!<CR>
vnoremap <F5> <Esc>:set list!<CR>a
inoremap <F5> <Esc>:set list!<CR>a

"contextmenu
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
"map K a hover, gd a go definition, <F2> a rename
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"Cargo shorcuts
nnoremap ,cb :!cargo build<CR>
nnoremap ,cr :!cargo run<CR>
nnoremap ,cbr :!cargo build --release<CR>
