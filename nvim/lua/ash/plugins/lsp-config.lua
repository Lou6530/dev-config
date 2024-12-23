return {
  -- Mason Setup 
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up LSP servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspc = require("lspconfig")
      lspc.ts_ls.setup({
        capabilities = capabilities
      })
      lspc.lua_ls.setup({
        capabilities = capabilities
      })
      vim.keymap.set("n", "<leader>gd", function ()
        vim.lsp.buf.definition()
      end)
    end,
  },
}

