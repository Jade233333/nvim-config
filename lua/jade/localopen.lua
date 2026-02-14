local function open_current_file()
  local file = vim.fn.fnameescape(vim.fn.expand('%'))
  vim.cmd('!open ' .. file)
end

vim.keymap.set('n', '<leader><CR>', open_current_file, {
  desc = 'use system open command to open current file',
})
