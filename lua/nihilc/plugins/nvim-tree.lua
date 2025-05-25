return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  config = function()
    local nvimtree = require("nvim-tree")
    local keymaps = require("nihilc.keymaps")

    nvimtree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      filters = {
        dotfiles = true,
        custom = { "node_modules", "\\.cache", "\\.git", "dist" },
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            relative = "editor",
            border = "single",
            width = 35,
            height = 25,
            row = 0,
            col = 999,
          },
        },
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
      diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = false,
        debounce_delay = 500,
        severity = {
          min = vim.diagnostic.severity.WARN,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        },
      },
      actions = {
        change_dir = {
          enable = true,
          global = true,
          restrict_above_cwd = false,
        },
      },
      renderer = {
        root_folder_label = function(path)
          return "../" .. vim.fn.fnamemodify(path, ":t")
        end,
        group_empty = false,
        highlight_git = false,
        special_files = {
          "Makefile",
          "README.md",
          "readme.md",
          "TODO.md",
          "todo.md",
          "LICENSE",
          "dockerfile",
          "Dockerfile",
        },
        indent_markers = {
          enable = true,
          icons = {
            corner = "┖",
            edge = "┃",
            item = "┃",
            bottom = "━",
            none = " ",
          },
        },
        icons = {
          git_placement = "signcolumn",
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "U",
              staged = "S",
              unmerged = "M",
              renamed = "R",
              untracked = "?",
              deleted = "D",
              ignored = "I",
            },
          },
        },
      },
    })

    keymaps.set({
      {
        lhs = "<leader>e",
        rhs = function()
          vim.cmd("NvimTreeFindFileToggle")
        end,
        desc = "Explorer",
      },
    })
  end,
}
