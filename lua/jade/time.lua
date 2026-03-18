local function insert_shell_date()
    local time = vim.fn.system("date"):gsub("%s+$", "") -- trim trailing newline
    vim.cmd("normal! a" .. time)
    vim.cmd("normal! o")
end

local function insert_markdown_h2_date()
    local time = vim.fn.system("date"):gsub("%s+$", "")
    vim.cmd("normal! i## " .. time .. "\n")
    vim.cmd("normal! o")
end

local function insert_date_only()
    local date = vim.fn.system("date +%Y-%m-%d"):gsub("%s+$", "")
    vim.cmd("normal! i" .. date)
    vim.cmd("normal! o")
end

local function insert_markdown_h1_date_only()
    local date = vim.fn.system("date +%Y-%m-%d"):gsub("%s+$", "")
    vim.cmd("normal! i# " .. date)
    vim.cmd("normal! o")
end

vim.keymap.set(
    { "n" },
    "<leader>tt",
    insert_shell_date,
    { desc = "Insert `date` output at cursor" }
)

vim.keymap.set(
    { "n" },
    "<leader>t2",
    insert_markdown_h2_date,
    { desc = "Insert `## date` output at cursor" }
)

vim.keymap.set(
    { "n" },
    "<leader>td",
    insert_date_only,
    { desc = "Insert date only (YYYY-MM-DD) at cursor" }
)

vim.keymap.set(
    { "n" },
    "<leader>t1",
    insert_markdown_h1_date_only,
    { desc = "Insert `# date` (date only) at cursor" }
)
