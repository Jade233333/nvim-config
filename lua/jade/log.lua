-- Intro
-- leader e to create a daily log file in log/ folder
-- auto name the file with date
-- auto generate h1 with date
-- auto generate h2 with system "date" command every time called
--
-- Todo
-- 1. replace system date with lua function

-- Create new daily log file if it doesn't exist
local function create_new_log_file(file_path, date)
  if vim.fn.filereadable(file_path) == 0 then
    local header = string.format("# %s", date)
    vim.fn.writefile({header, ""}, file_path)
  end
end

-- copy of the function from time.lua
local function insert_markdown_h2_date()
    local time = vim.fn.system("date"):gsub("%s+$", "")
    vim.cmd("normal! i## " .. time .. "\n")
    vim.cmd("normal! o")
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
  vim.cmd("normal! 2o")

  insert_markdown_h2_date()
end

vim.keymap.set("n", "<leader>e", open_daily_log, { desc = "Open daily log" })
