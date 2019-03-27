call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar
Plug 'tpope/vim-surround' "descripcion del plugin
Plug 'flazz/vim-colorschemes' "color schemes para nvim
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'

call plug#end()

" Coonfiguraciones y mappings
set termguicolors
set background=dark
colorscheme NeoSolarized
set noshowmode "No mostrar el modo actual (ya lo muestra la barra de estado
set number relativenumber

let g:NERDTreeChDirMode = 2 " Cambia el directorio actual al nodo padre actual
let g:airline#extensions#tabline#enabled = 1 "mostrar buffers (como pestañas=
let g:airline#extensions#tabline#fnamemomd = ':t' "Mostrar solo el nombre del archivo
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Abrir/Cerrar NERDTree con <F2>
map <F2> :NERDTreeToggle<CR>

" Ctrl + j remap a ESC
inoremap <F8> <Esc>
vnoremap <F8> <Esc>
