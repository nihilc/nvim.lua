return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  config = function()
    local tp = require("typst-preview")
    local keymaps = require("nihilc.keymaps")

    tp.setup({
      -- invert_colors = "auto",
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat",
      },
    })

    keymaps.set({
      { lhs = "<leader>tp", rhs = "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview" },
      { lhs = "<leader>ts", rhs = "<cmd>TypstPreviewSyncCursor<cr>", desc = "Typst Sync" },
    })
  end,
}
