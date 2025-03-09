return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local neogit = require("neogit")
    local keymaps = require("nihilc.keymaps")

    neogit.setup({})
    keymaps.set({
      { lhs = "<leader>gg", rhs = neogit.open, desc = "Git Status" },
    })
  end,
}
