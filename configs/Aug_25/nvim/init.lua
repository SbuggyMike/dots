-- appearance
vim.cmd.colorscheme("evening")
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"})

-- line numbers
vim.opt.number = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

-- spelling

vim.opt.spell = true
