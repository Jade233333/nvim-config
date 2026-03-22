
-- Intro
-- leader t.. to call time related function
-- tt for Sat Mar 21 00:24:50 CDT 2026
-- t1 for h1 header
-- t2 for h2 header
-- td for 2026-03-21 
--
-- Todo
-- 1. clean up, might make it into a module

local function insert_shell_date()
    local time = os.date("%a %b %d %H:%M:%S %Z %Y")
    vim.cmd("normal! a" .. time)
    vim.cmd("normal! o")
end

local function insert_markdown_h2_date()
    local time = os.date("%a %b %d %H:%M:%S %Z %Y")
    vim.cmd("normal! i## " .. time .. "\n")
    vim.cmd("normal! o")
end

local function insert_date_only()
    local date = os.date("%Y-%m-%d")
    vim.cmd("normal! i" .. date)
    vim.cmd("normal! o")
end

local function insert_markdown_h1_date_only()
    local date = os.date("%Y-%m-%d")
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
