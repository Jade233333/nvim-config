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
                "bash"
            },
            highlight = {
                enable = true,
            },
        })
    end,
}
