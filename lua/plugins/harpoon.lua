local plugin = { 
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = {{ "nvim-lua/plenary.nvim" }}
}

function plugin.config()
  local harpoon = require("harpoon")
  harpoon:setup()

  vim.keymap.set("n", "<leader>as", function() harpoon:list():add() end)
  vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

  vim.keymap.set("n", "<C-n>", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end

return plugin
