vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'markdown', 'lua', 'python' },
    callback = function()
        vim.treesitter.start()
    end,
})
