set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" plugins a instalar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'Yggdroot/indentLine' "mostrar guias de indentacion
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vimwiki/vimwiki'

" theme-color
Plug 'romainl/flattened'
Plug 'challenger-deep-theme/vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'sainnhe/edge'
Plug 'morhetz/gruvbox'

Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'wadackel/vim-dogrun'
Plug 'danilo-augusto/vim-afterglow'
Plug 'hachy/eva01.vim'
Plug 'ajmwagar/vim-deus'
Plug 'w0ng/vim-hybrid'

Plug 'glepnir/oceanic-material'

" Soporte sintactico de lenguaje
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'elmcast/elm-vim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'habamax/vim-godot'
Plug 'neovimhaskell/haskell-vim'

call plug#end()


"==================Configuraciones editor ====================================
filetype plugin indent on
set autoindent
set encoding=utf-8
set scrolloff=2
set nojoinspaces
set noshowmode "No mostrar el modo actual ya lo muestra la barra de estado
set number relativenumber
set hidden " requerido para operaciones modificando multiples buffers como 'rename'
set mouse=nvc
"set mouse=a " movimiento dentro de ventanas flotantes
"let base16colorspace=256

" undo permanente
set undodir=~/.config/nvim/undodir
set undofile
set conceallevel=0

" configuraciones de busqueda
set ignorecase
set smartcase

" Tratamiento de colores
" Configuraciones visuales
set termguicolors
lua require'colorizer'.setup()
"syntax enable

set background=dark
colorscheme flattened_dark
" Transparencia de nvim
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
" hi NonText ctermbg=NONE

" configuraciones de encoding
set encoding=UTF-8
set colorcolumn=100

" copy to system clipboard
xnoremap <C-c> "+y

" Leader
nnoremap <Space> <Nop>
let mapleader = " "

" localleader
nnoremap <leader><leader> :nohlsearch<Enter>

 "move line
"xnoremap <A-k> :move '<-2<CR>gv-gv
"xnoremap <C-A-j> :move '>+1<CR>gv-gv

" better indenting
vnoremap < <gv
vnoremap > >gv

" Shortcut para mostrar <Space> y <Tab>
nnoremap <F5> :set list!<CR>
vnoremap <F5> <Esc>:set list!<CR>a
inoremap <F5> <Esc>:set list!<CR>a

"configuraciones de tabs en nvim
nnoremap tn :tabnew<CR>

"buffers en vim

"desplazamiento de tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt


"Vertical split on doc in normal mode
nnoremap sv :vertical split<CR>
nnoremap sa :split<CR>

"Guardar con <C-s>
nnoremap <silent> <C-s> :w<CR>

"Move between windows
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sj <C-w>j
"Swap splits
nnoremap s<left> <C-w>r
nnoremap s<right> <C-w>r

"Rezise window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Alt + j remap a ESC
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>
" Ctrl + j remap a ESC
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"tabs
"set expandtab

autocmd Filetype css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype plaintex setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab

autocmd Filetype go setlocal tabstop=4 shiftwidth=4
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype sql setlocal tabstop=4 shiftwidth=4 expandtab

"omnifuncs
augroup omnifuncs
   autocmd!
   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" Python3 provider
let g:python3_host_prog = '/usr/bin/python'

" Haskell language server
"let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }
"let g:haskell_classic_highlighting = 1
autocmd Filetype haskell setlocal formatprg=hindent
autocmd Filetype haskell nnoremap <C-g> :%!hindent<CR>

function! GodotSettings() abort
  setlocal foldmethod=expr
  setlocal foldlevel=99
  setlocal tabstop=4 shiftwidth=4
endfunction

augroup godot | au!
  au FileType gdscript call GodotSettings()
augroup end

" rust.vim
let g:rustfmt_autosave = 1

" vim-go
"let g:go_highlight_structs = 0
"let g:go_highlight_interfaces = 0
"let g:go_highlight_operators = 0

" latex evitar concealment de caracteres utf8
let g:tex_conceal = ""
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType tex let b:coc_pairs_disabled=["'", "\"", "`"]
autocmd FileType markdown let b:coc_pairs_disabled=["'", "\"", "`"]

" Vim-Wiki configs
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/'}]
                      "\ 'syntax': 'markdown', 'ext': '.md'}]

" airline Configurations
let g:airline#extensions#tabline#enabled = 1 "mostrar buffers (como pestañas)
let g:airline#extensions#tabline#fnamemomd = ':t' "Mostrar solo el nombre del archivo
"let g:airline_theme='solarized'
let g:airline_theme='solarized_flood'

" indentLine configurations
let g:indentLine_fileTypeExclude = ['text', 'help', 'terminal', 'md', 'vimwiki', 'vim']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" NERDTree
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeChDirMode = 2 " Cambia el directorio actual al nodo padre actual
let g:NERDTreeIgnore = ['^node_modules$']
" Abrir/Cerrar NERDTree con <F4>
map <F4> :NERDTreeToggle<CR>
"NERDTree split vertical
let NERDTreeMapPreviewVSplit='sv'
"let NERDTreeMapOpenSplit=''

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
 if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
   NERDTreeFind
   wincmd p
 endif
endfunction

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Toggle comentario
xmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" COC CONFIGURATIONS
let g:coc_global_extensions = [
       \ 'coc-tsserver',
       \ 'coc-snippets',
       \ 'coc-pyright',
       \ 'coc-prettier',
       \ 'coc-pairs',
       \ 'coc-json',
       "\ 'coc-go',
       \ 'coc-eslint',
       \ 'coc-emmet',
       \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use 0 to show documentation in preview window
nnoremap <silent> ) :call <SID>show_documentation()<CR>

function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
   execute 'h '.expand('<cword>')
 else
   call CocAction('doHover')
 endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
 autocmd!
 " Setup formatexpr specified filetype(s).
 autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
 " Update signature help on jump placeholder
 autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
