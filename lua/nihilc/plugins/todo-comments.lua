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
        desc = "Find Todos",
        lhs = "<leader>ft",
        rhs = function() vim.cmd("TodoTelescope") end
      },
      {
        desc = "Next Todo",
        lhs = "]t",
        rhs = todo.jump_next
      },
      {
        desc = "Prev",
        lhs = "[t",
        rhs = todo.jump_prev
      },
    })
  end
}
