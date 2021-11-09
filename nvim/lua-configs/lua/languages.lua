vim.cmd("autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab")
-- vim.cmd("autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType javascript setlocal tabstop=2 shiftwidth=2")
-- vim.cmd("autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType typescript setlocal tabstop=2 shiftwidth=2")
vim.cmd("autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType plaintext setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab")

-- HTML, CSS
-- vim.g.user_emmet_install_global = 0
vim.cmd("autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab")

-- PYTHON
vim.cmd("autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab")
vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python")

-- HASKELL
vim.cmd("autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 expandtab")

-- GODOT
-- GO
vim.cmd("autocmd FileType go setlocal tabstop=4 shiftwidth=4")

-- RUST
vim.cmd("autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab")

-- TEX
vim.cmd("autocmd FileType tex setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.api.nvim_set_var("tex_conceal", "")
