return {
  "3rd/image.nvim",
  build = false,
  config = function()
    local image = require("image")
    local keymaps = require("nihilc.keymaps")

    image.setup({
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        typst = {
          enabled = true,
          filetypes = { "typst" },
        },
      },
    })
    keymaps.set({
      {
        lhs = "<leader>ui",
        rhs = function()
          if image.is_enabled() then
            image.disable()
          else
            image.enable()
          end
        end,
        desc = "UI Toggle image",
      },
    })
  end,
}
