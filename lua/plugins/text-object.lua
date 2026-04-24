return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
        vim.g.no_plugin_maps = true

        -- Or, disable per filetype (add as you like)
        -- vim.g.no_python_maps = true
        -- vim.g.no_ruby_maps = true
        -- vim.g.no_rust_maps = true
        -- vim.g.no_go_maps = true
    end,
    config = function()
        -- for movement [[]][]][
        local move = require("nvim-treesitter-textobjects.move")

        local function map(key, dir, query)
            local fn = ({
                next_start = "goto_next_start",
                next_end   = "goto_next_end",
                prev_start = "goto_previous_start",
                prev_end   = "goto_previous_end",
            })[dir]
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move[fn](query, "textobjects")
            end)
        end

        -- f = function, c = class, p = parameter, l = loop, i = conditional
        map("]]", "next_start", { "@function.outer", "@class.outer" })
        map("[[", "prev_start", { "@function.outer", "@class.outer" })
        map("][", "next_end", { "@function.outer", "@class.outer" })
        map("[]", "prev_end", { "@function.outer", "@class.outer" })

        map("]f", "next_start", "@function.outer")
        map("[f", "prev_start", "@function.outer")
        map("]c", "next_start", "@class.outer")
        map("[c", "prev_start", "@class.outer")
        map("]p", "next_start", "@parameter.inner")
        map("[p", "prev_start", "@parameter.inner")
        map("]l", "next_start", "@loop.outer")
        map("[l", "prev_start", "@loop.outer")
        map("]i", "next_start", "@conditional.outer")
        map("[i", "prev_start", "@conditional.outer")
    end,
}
