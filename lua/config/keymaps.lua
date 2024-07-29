-- Ustawienie leader key
vim.g.mapleader = " "

-- Mapowanie klawiszy
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>aa', 'ggVG', { noremap = true, silent = true })


