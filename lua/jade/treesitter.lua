vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 
        'lua',
        'bash',
        'sh',
        'python',
        'markdown',
        'c',
        'cpp',
        'typst',
        'yaml',
        'html',
        'css',
        'javascript',
        'typescript',
    },
    callback = function() vim.treesitter.start() end,
})
