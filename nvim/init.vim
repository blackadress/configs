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
syntax on
let base16colorspace=256

set ignorecase
set smartcase

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
inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"---------------------------------------------------------------------------
"rust.vim
let g:rustfmt_autosave = 1
" Abrir/Cerrar NERDTree con <F2>
map <F2> :NERDTreeToggle<CR>

" Alt + j remap a ESC
inoremap <F8> <Esc>
vnoremap <F8> <Esc>
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>

"Cargo shorcuts
nnoremap ,cb :!cargo build<CR>
nnoremap ,cr :!cargo run<CR>
nnoremap ,cbr :!cargo build --release<CR>
