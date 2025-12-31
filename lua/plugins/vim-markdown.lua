return {
  'plasticboy/vim-markdown',
  ft = { 'markdown' },
  init = function()
    vim.g.vim_markdown_folding = 1
  end,
}
