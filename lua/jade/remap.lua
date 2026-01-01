vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>l", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move by visual line when lines wrap.
vim.keymap.set({ "n", "x" }, "j", "gj")
vim.keymap.set({ "n", "x" }, "k", "gk")

vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format({ async = true })
end)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
    noremap =
        true
})
