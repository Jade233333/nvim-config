local function insert_shell_date()
    -- exact format like: Fri Jan 30 17:26:22 CST 2026
    -- (CST/EST/etc depends on your system TZ)
    local s = vim.fn.system("date"):gsub("%s+$", "") -- trim trailing newline

    -- insert at cursor in insert-mode or normal-mode
    vim.cmd("normal! i" .. s)
    vim.cmd("stopinsert")
end

vim.keymap.set(
    { "n" },
    "<leader>r",
    insert_shell_date,
    { desc = "Insert `date` output at cursor" }
)
