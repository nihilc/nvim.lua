return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    local keymaps = require("nihilc.keymaps")

    gitsigns.setup({
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '-' },
        changedelete = { text = '~' },
        untracked = { text = '±' },
      },
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local keys = {
          -- Navigation
          {
            desc = "Next Git Hunk",
            lhs = "]c",
            rhs = function()
              if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
              else
                gitsigns.nav_hunk('next')
              end
            end
          },
          {
            desc = "Prev Git Hunk",
            lhs = "[c",
            rhs = function()
              if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
              else
                gitsigns.nav_hunk('prev')
              end
            end
          },
          -- Actions
          {
            desc = "Git Stage Hunk",
            lhs = "<leader>gs",
            rhs = gitsigns.stage_hunk
          },
          {
            desc = "Git Reset Hunk",
            lhs = "<leader>gr",
            rhs = gitsigns.reset_hunk
          },
          {
            mode = "v",
            desc = "Git Stage Hunk",
            lhs = "<leader>gs",
            rhs = function()
              gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end
          },
          {
            mode = "v",
            desc = "Git Reset Hunk",
            lhs = "<leader>gr",
            rhs = function()
              gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end
          },
          {
            desc = "Git Stage Buffer",
            lhs = "<leader>gS",
            rhs = gitsigns.stage_buffer
          },
          {
            desc = "Git Reset Buffer",
            lhs = "<leader>gR",
            rhs = gitsigns.reset_buffer
          },
          {
            desc = "Git Preview Hunk",
            lhs = "<leader>gv",
            rhs = gitsigns.preview_hunk
          },
          {
            desc = "Git Preview Hunk (inline)",
            lhs = "<leader>gV",
            rhs = gitsigns.preview_hunk_inline
          },
        }
        for _, k in pairs(keys) do
          k.opts = k.opts or {
            buffer = bufnr
          }
        end
        keymaps.set(keys)
      end,
    })
  end,
}
