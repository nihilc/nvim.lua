return {
  {
    "navarasu/onedark.nvim",
    enabled = true,
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
  }
}
