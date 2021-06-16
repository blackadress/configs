vim.cmd([[set updatetime=250]])
vim.cmd([[autocmd CursorHoldI * silent! lua require('lspsaga.signaturehelp').signature_help()]])
