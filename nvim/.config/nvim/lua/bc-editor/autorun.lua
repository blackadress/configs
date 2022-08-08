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
