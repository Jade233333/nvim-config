return {
  "henry-hsieh/riscv-asm-vim",
  ft = { "riscv_asm" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "riscv_asm",
      callback = function()
        vim.bo.commentstring = "# %s"
      end,
    })
  end,
}
