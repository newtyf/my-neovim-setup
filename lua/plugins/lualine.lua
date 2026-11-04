return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = {
            {
              -- Nombre de la raíz del repo git (o del cwd si no hay repo)
              function()
                local root = Snacks.git.get_root() or vim.fn.getcwd()
                return vim.fn.fnamemodify(root, ":t")
              end,
              icon = "",
            },
          },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
