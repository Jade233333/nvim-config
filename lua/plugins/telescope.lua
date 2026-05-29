return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = 'Live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'Help tags' },
    },
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('fzf')
    end,
    opts = {
        defaults = {
            vimgrep_arguments = {
                'rg', '--color=never', '--no-heading',
                '--with-filename', '--line-number', '--column',
                '--smart-case', '--hidden',
                '--glob', '!**/.git/*',
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
            },
        },
    },
}
