vim.cmd("autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab")
vim.cmd("autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab expandtab expandtab")
vim.cmd("autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType plaintext setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.cmd("autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab")


-- PYTHON
vim.cmd("autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab")
vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python")

-- HASKELL
vim.cmd("autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 expandtab")

-- GODOT
-- GO
vim.cmd("autocmd FileType go setlocal tabstop=4 shiftwidth=4")
-- VIM-GO
vim.cmd('let g:go_highlight_build_constraints = 1')
vim.cmd('let g:go_highlight_extra_types = 1')
vim.cmd('let g:go_highlight_fields = 1')
vim.cmd('let g:go_highlight_functions = 1')
vim.cmd('let g:go_highlight_methods = 1')
vim.cmd('let g:go_highlight_operators = 1')
vim.cmd('let g:go_highlight_structs = 1')
vim.cmd('let g:go_highlight_types = 1')

-- RUST
vim.cmd("autocmd FileType rust setlocal tabstop=4 shiftwidth=4 expandtab")
vim.api.nvim_set_var("rustfmt_autosave", 1)

-- TEX
vim.cmd("autocmd FileType tex setlocal tabstop=2 shiftwidth=2 expandtab expandtab")
vim.api.nvim_set_var("tex_conceal", "")
--autocmd FileType tex let b:coc_pairs = [["$", "$"]]
--autocmd FileType tex let b:coc_pairs_disabled=["'", "\"", "`"]
--autocmd FileType markdown let b:coc_pairs_disabled=["'", "\"", "`"]
