return {
    "henry-hsieh/riscv-asm-vim",
    ft = { "riscv_asm" },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "riscv_asm",
            callback = function()
                vim.g.riscv_asm_all_enable = true
                -- vim.bo.commentstring = "# %s"
            end,
        })
    end,
}
