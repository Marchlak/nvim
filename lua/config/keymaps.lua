-- Ustawienie leader key
vim.g.mapleader = " "

-- Mapowanie klawiszy
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>aa', 'ggVG', { noremap = true, silent = true })

function CreateFileInCurrentDir()
    local current_dir = vim.fn.expand('%:p:h')
    local filename = vim.fn.input('Nazwa nowego pliku: ')
    vim.cmd('edit ' .. current_dir .. '/' .. filename)
end

vim.api.nvim_set_keymap('n', '<leader>nf', ':lua CreateFileInCurrentDir()<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':b#<CR>', { noremap = true, silent = true })








