return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fc",
      function() require("conform").format({ async = true }) end,
      mode = { "n", "x" }, -- normal: archivo entero · visual: solo la selección
      desc = "Formatear archivo/selección",
    },
  },
  opts = {
    -- Formateadores por filetype (se instalan con :MasonInstall)
    -- stop_after_first: usa el primero que esté instalado
    formatters_by_ft = {
      javascript      = { "prettierd", "prettier", stop_after_first = true },
      typescript      = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      html            = { "prettierd", "prettier", stop_after_first = true },
      htmlangular     = { "prettierd", "prettier", stop_after_first = true },
      css             = { "prettierd", "prettier", stop_after_first = true },
      scss            = { "prettierd", "prettier", stop_after_first = true },
      json            = { "prettierd", "prettier", stop_after_first = true },
      yaml            = { "prettierd", "prettier", stop_after_first = true },
      markdown        = { "prettierd", "prettier", stop_after_first = true },
      go              = { "goimports", "gofmt" }, -- ordena imports y luego formatea
      lua             = { "stylua" },
    },

    -- Si el filetype no tiene formateador, usar el del LSP
    default_format_opts = {
      lsp_format = "fallback",
    },

    -- Formatear al guardar (descomentar para activarlo)
    -- format_on_save = {
    --   timeout_ms = 500,
    -- },
  },
}
