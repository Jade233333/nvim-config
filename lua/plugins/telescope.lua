return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>" },
      { "<leader>g", "<cmd>Telescope live_grep<cr>" },
    },
     }
