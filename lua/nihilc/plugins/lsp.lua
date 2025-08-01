return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    mason.setup({
      ui = { border = "single" },
    })
    mason_lspconfig.setup({
      ensure_installed = {
        -- Web
        "html",
        "cssls",
        "ts_ls",
        "jsonls",
        -- Languages
        "bashls",
        "pyright",
        "lua_ls",
        "gopls",
        "tinymist",
        -- Docs / Config
        "marksman",
      },
      automatic_installation = false,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })
    require("lspconfig").nixd.setup({
      cmd = { "nixd" },
      capabilities = capabilities,
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "nixfmt" }, -- alejandra or nixfmt or nixpkgs-fmt
          },
        },
      },
    })

    vim.diagnostic.config({
      float = {
        style = "minimal",
        border = "single",
        source = true,
        header = "",
        prefix = function(diagnostic)
          local severity = vim.diagnostic.severity
          local severity_map = {
            [severity.ERROR] = { text = "E", hl = "DiagnosticError" },
            [severity.WARN] = { text = "W", hl = "DiagnosticWarn" },
            [severity.INFO] = { text = "I", hl = "DiagnosticInfo" },
            [severity.HINT] = { text = "H", hl = "DiagnosticHint" },
          }
          return severity_map[diagnostic.severity].text .. ": ", severity_map[diagnostic.severity].hl
        end,
      },
      virtual_text = true,
    })

    local autocmd = require("nihilc.autocmd")
    local keymaps = require("nihilc.keymaps")
    autocmd.create("LspAttach", {
      group = autocmd.group,
      callback = function(e)
        local opts = { buffer = e.buf }
        keymaps.set({
          {
            lhs = "K",
            rhs = function()
              vim.lsp.buf.hover({ border = "single" })
            end,
            desc = "Hover Symbol",
            opts = opts,
          },
          {
            lhs = "L",
            rhs = function()
              vim.lsp.buf.signature_help({ border = "single" })
            end,
            desc = "Hover Signature Symbol",
            opts = opts,
          },
          { lhs = "gd", rhs = vim.lsp.buf.definition, desc = "Go Definition", opts = opts },
          { lhs = "gD", rhs = vim.lsp.buf.declaration, desc = "Go Declaration", opts = opts },
          { lhs = "gr", rhs = vim.lsp.buf.references, desc = "Go References", opts = opts },
          { lhs = "gi", rhs = vim.lsp.buf.implementation, desc = "Go Implementation", opts = opts },
          { lhs = "<leader>lr", rhs = vim.lsp.buf.rename, desc = "Lsp Rename", opts = opts },
          { lhs = "<leader>la", rhs = vim.lsp.buf.code_action, desc = "Lsp Code Action", opts = opts },
          { lhs = "<leader>ld", rhs = vim.diagnostic.open_float, desc = "Lsp Diagnostics", opts = opts },
          {
            lhs = "]d",
            rhs = function()
              vim.diagnostic.jump({ count = 1, float = true })
            end,
            desc = "Next Diagnostic",
            opts = opts,
          },
          {
            lhs = "[d",
            rhs = function()
              vim.diagnostic.jump({ count = -1, float = true })
            end,
            desc = "Prev Diagnostic",
            opts = opts,
          },
        })
      end,
    })
  end,
}
