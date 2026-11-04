return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      dashboard = {
        preset = {
          header = [[
          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠰⣾⣿⣶⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
          ⠀⠀⠀⠀⣠⣴⣶⣶⣿⠁⠀⠙⠿⣿⣿⣿⡟⠶⠀⠀⠀⠀⠀⢲⣄⠀⠀⠀⠀⠀
          ⠀⢀⣶⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⢻⣿⣧⠀⠀⠀⠀⠀⢀⣾⣿⣿⣦⡀⠀⠀
          ⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⢸⣿⣿⡄⠀⠀⢀⣠⣿⣿⣿⣿⣿⣿⣦⠀
          ⣿⡟⠉⠀⠀⠈⢻⣿⣿⠿⢿⣿⣿⣷⣾⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⡿⢿⣿⣿⣇
          ⢻⠁⠀⠀⠀⠀⠀⠉⣠⣶⡟⠛⣿⣿⣿⣿⣿⣿⣿⠟⠛⣿⣿⣿⠋⠀⣾⣟⢻⣿
          ⠀⠀⠀⠀⠀⠀⠀⠈⠻⠙⢇⣼⣿⣿⣿⣿⣿⣿⣿⡆⠀⠟⠻⠟⠀⠀⣾⣿⠈⡟
          ⠀⠀⠀⠀⠀⣀⣤⣴⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⢸⣿⡿⠇⠀
          ⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢀⣀⡤⠊⠀⠀⠀
          ⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠛⠛⠻⠿⠿⢿⣿⣿⣿⠛⠋⠀⠀⠀⠀⠀
          ⠀⠀⠀⠀⠀⠀⠀⠿⠿⠿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠀⠀⠀⠀⠀⠀⠀
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          -- { icon = " ", title = "Recientes", section = "recent_files", limit = 5, padding = 1 },
          -- { icon = " ", title = "Proyectos", section = "projects", limit = 5, padding = 1 },
          { section = "startup" }, -- muestra plugins cargados y tiempo de inicio
        },
      },
      explorer = { replace_netrw = true }, -- `nvim .` abre el explorer
      picker = {
        sources = {
          files    = { hidden = true }, -- incluye archivos ocultos (.env, etc.)
          explorer = { hidden = true },
        },
      },
      terminal = {
        win = {
          style = "terminal",
          position = "float", -- Cambiado a float para no alterar el layout o explorer
          border = "rounded", -- Añade un borde estético
        },
      },
    },
    keys = {
      { "<leader>e",  function() Snacks.explorer() end,       desc = "Explorador" },
      { "<leader>tn", function() Snacks.terminal.open() end, mode = { "n", "t" }, desc = "Open or create terminal" },
      { "<leader>tg", function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Focus or hide terminal" },
      { "<leader>ff", function() Snacks.picker.files() end,   desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.grep() end,    desc = "Live Grep" },
      { "<leader>fh", function() Snacks.picker.help() end,    desc = "Help Tags" },
      { "<leader>fo", function() Snacks.picker.recent() end,  desc = "Recent Files" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#BFBFEC" }) -- tu color actual
    end,
  },
}
