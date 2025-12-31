return {
  'plasticboy/vim-markdown',
  ft = { 'markdown' },
  init = function()
      -- ensure not folding markdown; do not need
    vim.g.vim_markdown_folding_disabled = 1
  end,
}
