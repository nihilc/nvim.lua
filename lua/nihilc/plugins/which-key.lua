return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>h", group = "help" },
      { "<leader>u", group = "ui" },
    },
    win = {
      title = true,
    },
    icons = {
      mappings = false,
    },
    show_help = false,
    show_keys = false,
  }
}
