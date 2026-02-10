local function insert_shell_date()
    local s = vim.fn.system("date"):gsub("%s+$", "") -- trim trailing newline
    vim.cmd("normal! i" .. s)
    vim.cmd("stopinsert")
end

vim.keymap.set(
    { "n" },
    "<leader>t",
    insert_shell_date,
    { desc = "Insert `date` output at cursor" }
)
