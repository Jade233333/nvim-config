vim.keymap.set("n", "<leader>e", function()
  local log_dir = vim.fn.expand("~/r1j1/log")
  local date = os.date("%Y-%m-%d")
  local file_path = log_dir .. "/" .. date .. ".md"

  -- ensure directory exists
  vim.fn.mkdir(log_dir, "p")

  -- create file if it doesn't exist
  if vim.fn.filereadable(file_path) == 0 then
    vim.fn.writefile({}, file_path)
  end

  -- open file
  vim.cmd("edit " .. file_path)

  -- last line
  vim.cmd("normal! G")
end, { desc = "Open daily log" })
