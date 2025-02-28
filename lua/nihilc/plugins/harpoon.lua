return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local keymaps = require("nihilc.keymaps")

    harpoon:setup()
    keymaps.set({
      {
        desc = "Harpoon Quick Menu",
        lhs = "<leader>e",
        rhs = function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
      },
      {
        desc = "Harpoon Add",
        lhs = "<leader>a",
        rhs = function() harpoon:list():add() end
      },
      {
        desc = "Harpoon Next",
        lhs = "<leader>n",
        rhs = function() harpoon:list():next() end
      },
      {
        desc = "Harpoon Prev",
        lhs = "<leader>p",
        rhs = function() harpoon:list():prev() end
      },
    })
  end
}
