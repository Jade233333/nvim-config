return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "markdown",
                "markdown_inline",
                "lua",
                "python",
                "c",
                "typst",
                "latex",
                "bash",
                "html",
                "css",
                "javascript",
                "typescript",
            },
            highlight = {
                enable = true,
            },
        })
        -- folding settings
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99
    end,
}
