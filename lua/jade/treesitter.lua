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
        'latex',
    },
    callback = function() vim.treesitter.start() end,
})

vim.keymap.set({ "n", "x", "o" }, "]]", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
    require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
