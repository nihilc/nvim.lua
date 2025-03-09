return {
  "catgoose/nvim-colorizer.lua",
  opts = {
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = false,
      AARRGGBB = false,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = false, -- TODO: enable when configure lsp
      mode = "virtualtext",
      virtualtext = "■",
    },
  },
}
