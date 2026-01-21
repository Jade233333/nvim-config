vim.api.nvim_create_user_command(
  'Lazypush',
  function(opts)
    -- opts.args is the raw argument string
    vim.cmd('!lazypush ' .. vim.fn.shellescape(opts.args))
  end,
  {
    desc = 'lazypush pass through',
    nargs = '*',
  }
)
