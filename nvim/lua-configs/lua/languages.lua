--[[
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
]] --
vim.cmd("autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab expandtab expandtab")
vim.cmd("autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType tex setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType plaintext setlocal tabstop=2 shiftwidth=2 expandtab expandtab")

vim.cmd("autocmd FileType go setlocal tabstop=4 shiftwidth=4")
vim.cmd("autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab")
vim.cmd("autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab")
vim.cmd("autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab")

-- PYTHON
vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python")

-- HASKELL
-- GODOT
-- RUST
vim.api.nvim_set_var("rustfmt_autosave", 1)

-- TEX
vim.api.nvim_set_var("tex_conceal", "")
--autocmd FileType tex let b:coc_pairs = [["$", "$"]]
--autocmd FileType tex let b:coc_pairs_disabled=["'", "\"", "`"]
--autocmd FileType markdown let b:coc_pairs_disabled=["'", "\"", "`"]
