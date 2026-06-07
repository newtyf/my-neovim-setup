return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#BFBFEC" })

      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = {
            "",
            "⠀⠀⠀⠲⣦⣤⣀⣀⠀⠀⠀⣀⣀⣠⣤⣀⣀⠀⢀⣀⣠⣤⣶⣶⠟⠀⠀⠀",
            "⠀⠀⠀⠀⠙⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠈⢿⣿⣿⠻⣿⣿⣿⣿⣿⣿⣿⠟⢻⣿⣿⡿⠃⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠲⣶⣶⣾⣿⣿⠀⢨⠙⢿⣿⣿⠏⣅⠀⢸⣿⣿⣷⣾⠟⠁⠀⠀⠀",
            "⠀⠀⠀⠀⠈⠻⢿⣿⣿⢷⣶⣶⣾⣿⣿⣶⣶⣾⠟⣿⣿⣿⣋⠀⠀⠀⠀⠀",
            "⠀⠀⢀⣀⣀⠐⢶⣿⣿⣧⠁⠀⠋⠁⠈⠋⠀⢀⣾⣿⣿⡿⣷⣶⠀⠀⠀⠀",
            "⠀⠀⣼⣿⣿⣷⣤⣙⣿⣿⣷⣶⣶⣴⣴⣴⣶⣿⣿⣿⠟⣡⣿⣿⣧⣄⣀⡀",
            "⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⡿⠿⣿⣿⣿⣿",
            "⣿⡿⠛⠿⠟⠉⠉⠉⠸⠋⠀⠻⡿⣿⣿⣿⣿⠻⠇⠀⠀⠈⠀⠀⠈⠉⢸⠃",
            "⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⢿⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "",
          },
          shortcut = {
            {
              icon = "  ", desc = "Find File", key = "f",
              action = function() require("telescope.builtin").find_files() end,
            },
            { icon = "  ", desc = "New File",     key = "n", action = "enew" },
            {
              icon = "  ", desc = "Recent Files", key = "r",
              action = function() require("telescope.builtin").oldfiles() end,
            },
            { icon = "  ", desc = "Quit",         key = "q", action = "qa" },
          },
          packages = { enable = true },
          project = { enable = true, limit = 5 },
          mru = { enable = true, limit = 5 },
          footer = {},
        },
      })
    end,
  },
}
