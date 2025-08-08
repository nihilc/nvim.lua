return {
  {
    "navarasu/onedark.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        transparent = true,
        highlights = {
          ["NormalFloat"] = { bg = "none" },
          ["FloatBorder"] = { bg = "none" },
          ["TelescopePromptBorder"] = { fg = "$grey" },
          ["TelescopePreviewBorder"] = { fg = "$grey" },
          ["TelescopeResultsBorder"] = { fg = "$grey" },
          ["NvimTreeIndentMarker"] = { fg = "$bg1" },
        },
      })
      require("onedark").load()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            IblIndent = { fg = colors.palette.sumiInk4 },
            NvimTreeIndentMarker = { fg = colors.palette.sumiInk4 },
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
