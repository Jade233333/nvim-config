vim.filetype.add({
    extension = {
        mustache = 'html',
    },
})

-- Enable wrapping for typst and markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typst", "markdown", "tex" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})
