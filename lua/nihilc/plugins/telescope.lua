return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local keymaps = require("nihilc.keymaps")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "build", "**.pdf" },
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            height = 0.8,
            width = 80,
            prompt_position = "top",
            mirror = true,
          },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            ["<m-p>"] = require("telescope.actions.layout").toggle_preview,
          },
          n = {
            ["<m-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
    })

    keymaps.set({
      { lhs = "<leader>ff", rhs = builtin.find_files, desc = "Find Files" },
      { lhs = "<leader>fF", rhs = builtin.git_files, desc = "Find Files (Git Files)" },
      { lhs = "<leader>fb", rhs = builtin.buffers, desc = "Find Buffer" },
      { lhs = "<leader>fg", rhs = builtin.live_grep, desc = "Live Grep" },
      {
        lhs = "<leader>fG",
        rhs = function()
          local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if git_root and #git_root > 0 then
            builtin.live_grep({
              cwd = git_root,
              prompt_title = "Live Grep (Git Root)",
            })
          end
        end,
        desc = "Live Grep (Git Root)",
      },
      {
        lhs = "<leader>fw",
        rhs = function()
          local word = vim.fn.expand("<cword>")
          local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if git_root and #git_root > 0 then
            builtin.grep_string({
              cwd = git_root,
              search = word,
            })
          else
            builtin.grep_string({
              search = word,
            })
          end
        end,
        desc = "Find Current word",
      },
      {
        lhs = "<leader>fW",
        rhs = function()
          local word = vim.fn.expand("<cWORD>")
          local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if git_root and #git_root > 0 then
            builtin.grep_string({
              cwd = git_root,
              search = word,
            })
          else
            builtin.grep_string({
              search = word,
            })
          end
        end,
        desc = "Find Current WORD",
      },
      {
        mode = "v",
        lhs = "<leader>fg",
        rhs = function()
          local get_selection = function()
            return vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { mode = vim.fn.mode() })
          end
          builtin.live_grep({
            default_text = table.concat(get_selection()),
          })
        end,
        desc = "Live Grep",
      },
      { lhs = "<leader>ht", rhs = builtin.help_tags, desc = "Help Tags" },
      { lhs = "<leader>hk", rhs = builtin.keymaps, desc = "Help Keymaps" },
    })
  end,
}
