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

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        vim.keymap.set('n', '<leader>fs', function()
            local file = vim.fn.expand('%:p')
            local line = vim.fn.line('.')
            local pdf = vim.fn.expand('%:p:r') .. '.pdf'
            vim.fn.jobstart({
                'sioyek',
                '--reuse-window',
                '--forward-search-file', file,
                '--forward-search-line', tostring(line),
                pdf
            })
        end, { buffer = true })
    end,
})
