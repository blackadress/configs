call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar
" Plug 'tpope/vim-surround' 
Plug 'flazz/vim-colorschemes' "color schemes para nvim
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine' "mostrar guias de indentacion
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" theme-color
Plug 'danilo-augusto/vim-afterglow'

" cliente de lenguaje

" live preview LaTex

" Soporte sintactico de lenguaje

call plug#end()

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
" tabs especificos para js, css y html
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 expandtab
" tabs especificos para latex, python y rust
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

"latex evitar concealment de caracteres utf8
let g:tex_conceal = ""

"omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


" rust.vim

" Abrir/Cerrar NERDTree con <F4>
map <F4> :NERDTreeToggle<CR>

" Alt + j remap a ESC
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>
" Ctrl + j remap a ESC
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" localleader
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" Shortcut para mostrar <Space> y <Tab>
nnoremap <F5> :set list!<CR>
vnoremap <F5> <Esc>:set list!<CR>a
inoremap <F5> <Esc>:set list!<CR>a

"Cargo shorcuts
nnoremap ,cb :!cargo build<CR>
nnoremap ,cr :!cargo run<CR>
nnoremap ,cbr :!cargo build --release<CR>

" compilar LaTex
nnoremap ,p :!pdflatex %<CR>

" Tratamiento de colores

" Configuraciones visuales
" Colores
set termguicolors
" let g:afterglow_inherit_background=1
let g:afterglow_italic_comments=1
colorscheme afterglow
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE
