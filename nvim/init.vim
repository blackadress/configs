call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar
" Plug 'tpope/vim-surround' 
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
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

Plug 'rust-lang/rust.vim'

" plugins de complecion

" Soporte sintactico de lenguaje
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

call plug#end()
" Tratamiento de colores

" Configuraciones visuales
set termguicolors
" Colores
set background=dark
colorscheme adventurous

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
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab


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

" Automaticamente iniciar servidores de lenguaje
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Language Client server
let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'javascript.jsx': ['tcp:127.0.0.1:2089'],
        \ 'python': ['/usr/local/bin/pyls'],
        \}
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"tern
if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature = 1
    let g:tern_request_timeout = 1
    let g:tern_request_timeout = 6000
    let g:tern#command = ["tern"]
    let g:tern#arguments = [" - persistent"]

    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd Filetype javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" rust.vim
let g:rustfmt_autosave = 1
" Abrir/Cerrar NERDTree con <F4>
map <F4> :NERDTreeToggle<CR>

" Alt + j remap a ESC
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" Parentesis y llaves
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

" Shortcut para mostrar <Space> y <Tab>
nnoremap <F5> :set list!<CR>
vnoremap <F5> <Esc>:set list!<CR>a
inoremap <F5> <Esc>:set list!<CR>a

"Cargo shorcuts
nnoremap ,cb :!cargo build<CR>
nnoremap ,cr :!cargo run<CR>
nnoremap ,cbr :!cargo build --release<CR>
