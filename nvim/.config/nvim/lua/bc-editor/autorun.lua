local utils = require("utils")

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("venga", { clear = true }),
  pattern = { "*.tex" },
  callback = function()
    vim.fn.jobstart({ "tectonic", "index.tex" }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        print("Running tectonic...")
        if data then
          print(vim.inspect(data))
        end
      end,
    })
  end,
})

-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   group = vim.api.nvim_create_augroup("guardar_sesion", { clear = true }),
--   pattern = { "*" },
--   callback = function()
--     vim.cmd("mksession! ses.vim")
--   end,
-- })

-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = vim.api.nvim_create_augroup("cargar_sesion", { clear = true }),
--   pattern = { "*" },
--   callback = function()
--     vim.cmd("source ses.vim")
--     -- local filename = vim.api.nvim_buf_get_name(0)
--     -- filename = filename:gsub("([%.]+)", " ")
--     -- local splitted = utils.split_str(filename)
--     -- local filetype = splitted[#splitted]
--     -- local set_ft_command = "bufdo set filetype=" .. filetype
--     -- print(set_ft_command)
--     local set_ft_command = "windo e!"
--     print("###########################")
--     print(set_ft_command)
--     print("###########################")
--
--     vim.cmd(set_ft_command)
--   end,
-- })
