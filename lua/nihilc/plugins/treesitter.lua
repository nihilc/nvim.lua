return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        -- Web
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "jsonc",
        -- Languages
        "bash",
        "python",
        "lua",
        "go",
        -- Docs / Config
        "latex",
        "markdown",
        "markdown_inline",
        "vimdoc",
        "make",
        "yaml",
        "toml",
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-j>',
          node_decremental = '<c-k>',
          scope_incremental = false
        },
      },
    })
  end
}
