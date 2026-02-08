-- Enable wrapping for typst and markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typst", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})
