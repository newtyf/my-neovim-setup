return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "html", "css", "javascript", "typescript", "tsx", "angular", "json", "go", "scss",
      })

      -- Las plantillas de Angular usan el filetype "htmlangular"
      vim.treesitter.language.register("angular", "htmlangular")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "html", "css", "javascript", "typescript",
          "typescriptreact", "json", "htmlangular", "go", "scss",
        },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
