require("config.keymaps")
require("config.lazy")
require("config.vim-options")
vim.opt.clipboard = "unnamedplus"

<<<<<<< HEAD
=======
function CreateFileInCurrentDir()
    local current_dir = vim.fn.expand('%:p:h')
    local filename = vim.fn.input('Nazwa nowego pliku: ')
    vim.cmd('edit ' .. current_dir .. '/' .. filename)
end


vim.api.nvim_set_keymap('n', '<leader>nf', ':lua CreateFileInCurrentDir()<CR>', { noremap = true, silent = true })

>>>>>>> 962d48a057f3a54877468e9ab070e5f35759de0b

