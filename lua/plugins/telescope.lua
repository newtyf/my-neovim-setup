return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help Tags" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>",    desc = "Recent Files" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",     desc = "Keymaps" },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              width = 0.9,
              height = 0.8,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "find", ".", "-maxdepth", "4", "-type", "f",
              "!", "-path", "*/.git/*",
              "!", "-path", "*/node_modules/*",
              "!", "-path", "*/.DS_Store",
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            hidden = true,
            path = vim.loop.cwd(), -- siempre abre desde la raíz del proyecto actual
          },
        },
      })

      telescope.load_extension("file_browser")
    end,
  },
}
