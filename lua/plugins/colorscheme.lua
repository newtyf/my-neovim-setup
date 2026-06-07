return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "medium",
        transparent_mode = false,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
