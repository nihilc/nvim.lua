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
        lhs = "<leader>q",
        rhs = function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        lhs = "<leader>a",
        rhs = function()
          harpoon:list():add()
        end,
        desc = "Harpoon Add",
      },
      {
        lhs = "<leader>n",
        rhs = function()
          harpoon:list():next()
        end,
        desc = "Harpoon Next",
      },
      {
        lhs = "<leader>p",
        rhs = function()
          harpoon:list():prev()
        end,
        desc = "Harpoon Prev",
      },
      {
        lhs = "<leader>1",
        rhs = function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon Prev",
      },
      {
        lhs = "<leader>2",
        rhs = function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon Prev",
      },
      {
        lhs = "<leader>3",
        rhs = function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon Prev",
      },
      {
        lhs = "<leader>4",
        rhs = function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon Prev",
      },
    })
  end,
}
