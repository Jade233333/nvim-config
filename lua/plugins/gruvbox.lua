return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.o.background = "dark"
    require("gruvbox").setup({
      -- contrast = "hard", -- key line
      -- transparent_mode = true, -- optional (matches terminal bg)
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}

