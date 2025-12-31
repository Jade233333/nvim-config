vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldlevel = 99
    end,
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'markdown', 'lua', 'python' },
    callback = function()
        vim.treesitter.start()
    end,
})
