require("config.keymaps")
require("config.lazy")
require("config.vim-options")
vim.opt.clipboard = "unnamedplus"

function CreateFileInCurrentDir()
    local current_dir = vim.fn.expand('%:p:h')
    local filename = vim.fn.input('Nazwa nowego pliku: ')
    vim.cmd('edit ' .. current_dir .. '/' .. filename)
end

vim.api.nvim_set_keymap('n', '<leader>nf', ':lua CreateFileInCurrentDir()<CR>', { noremap = true, silent = true })





