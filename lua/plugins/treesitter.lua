return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "markdown",
                    "markdown_inline",
                    "lua",
                    "python",
                    "c",
                    "cpp",
                    "go",
                    "rust",
                    "javascript",
                    "typescript",
                    "typst",
                    "latex",
                    "bash"
                },
                highlight = {
                    enable = true,
                },
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]]"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["[["] = "@function.outer",
                        },
                        goto_next_end = {
                            ["]["] = "@function.outer",
                        },
                        goto_previous_end = {
                            ["[]"] = "@function.outer",
                        },
                    },
                },
            })
            -- folding settings
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldlevel = 99
        end,
    }
}
