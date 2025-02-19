local servers = {
  "lua_ls",                -- Lua
  "jdtls",                 -- Java
  "clangd",                -- C++
  "html",                  -- HTML
  "cssls",                 -- CSS
  "tailwindcss",           -- Tailwind
  "gradle_ls",             -- Gradle, Groovy
  "kotlin_language_server", -- Kotlin
  "lemminx",               -- XML
  "jsonls",                -- JSON
  "bashls",                -- Bash
  "pylsp"                 -- Python
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- vim.diagnostic.config({
      --   virtual_text = false,
      --   signs = true,
      --   underline = true,
      --   update_in_insert = false,
      --   float = {
      --     show_header = true,
      --     border = "rounded",
      --     source = "always",
      --     prefix = "",
      --   },
      -- })

      require("mason-lspconfig").setup_handlers({
        function(server)
          lspconfig[server].setup({ capabilities = capabilities })
        end,
        ["jdtls"] = function() end,
        ["pylsp"] = function()
          lspconfig.pylsp.setup({
            capabilities = capabilities,
            settings = {
              pylsp = {
                plugins = {
                  pycodestyle = {
                    maxLineLength = 160,  -- Zwiększenie limitu długości linii do 160 znaków
                  },
                },
              },
            },
          })
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}
