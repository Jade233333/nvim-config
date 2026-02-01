local function insert_shell_date()
  -- exact format like: Fri Jan 30 17:26:22 CST 2026
  -- (CST/EST/etc depends on your system TZ)
  local s = vim.fn.system("date"):gsub("%s+$", "") -- trim trailing newline

  -- insert at cursor in insert-mode or normal-mode
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(line:sub(1, col) .. s .. line:sub(col + 1))
  vim.api.nvim_win_set_cursor(0, { row, col + #s })
end

vim.keymap.set({ "n", "i" }, "<leader>r", function()
  if vim.fn.mode() == "i" then
    -- keep you in insert mode; insert at cursor without leaving insert
    -- (temporarily leave to run logic cleanly)
    vim.cmd("stopinsert")
    insert_shell_date()
    vim.cmd("startinsert")
  else
    insert_shell_date()
  end
end, { desc = "Insert `date` output at cursor" })

