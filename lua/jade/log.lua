-- Create new daily log file if it doesn't exist
local function create_new_log_file(file_path, date)
  if vim.fn.filereadable(file_path) == 0 then
    local header = string.format("# %s", date)
    vim.fn.writefile({header, ""}, file_path)
  end
end

-- Open daily log file
local function open_daily_log()
  local log_dir = vim.fn.expand("~/r1j1/log")
  local date = os.date("%Y-%m-%d")
  local file_path = log_dir .. "/" .. date .. ".md"

  -- ensure directory exists
  vim.fn.mkdir(log_dir, "p")

  -- create file if it doesn't exist
  create_new_log_file(file_path, date)

  vim.cmd("edit " .. file_path)
  vim.cmd("normal! G")
end

vim.keymap.set("n", "<leader>e", open_daily_log, { desc = "Open daily log" })
