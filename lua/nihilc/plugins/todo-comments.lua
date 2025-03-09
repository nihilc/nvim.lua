return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo = require("todo-comments")
    local keymaps = require("nihilc.keymaps")

    todo.setup({
      signs = false,
    })
    keymaps.set({
      {
        lhs = "<leader>ft",
        rhs = function()
          vim.cmd("TodoTelescope")
        end,
        desc = "Find Todos",
      },
      { lhs = "]t", rhs = todo.jump_next, desc = "Next Todo" },
      { lhs = "[t", rhs = todo.jump_prev, desc = "Prev Todo" },
    })
  end,
}
