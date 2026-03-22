-- Intro
-- leader dd to show floating diagnostics
-- leader df to show auto fix

vim.keymap.set(
  "n",
  "<leader>dd",
  vim.diagnostic.open_float,
  { desc = "Show diagnostics under cursor" }
)

vim.keymap.set(
  "n",
  "<leader>df",
  vim.lsp.buf.code_action,
  { desc = "Fix diagnostic with code action" }
)
