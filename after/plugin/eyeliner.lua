require("eyeliner").setup({
   highlight_on_key = true,
   dim = true,
})

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#fe8019', bold = true, underline = false })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#fe8019', underline = false })
vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg = '#a89984', underline = false })
