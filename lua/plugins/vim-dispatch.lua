return {
  "tpope/vim-dispatch",
  config = function ()
    -- Definiowanie skrótu klawiszowego do uruchamiania BrowserSync
    vim.api.nvim_set_keymap('n', '<leader>bs', ':Dispatch browser-sync start --server --files "*"<CR>', { noremap = true, silent = true })
  end
}

