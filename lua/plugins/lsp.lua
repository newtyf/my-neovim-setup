return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim" }, -- Mason agrega los servidores al PATH
    config = function()
      -- Cómo se muestran los errores/advertencias
      vim.diagnostic.config({
        virtual_text = true,   -- mensaje al final de la línea
        severity_sort = true,  -- errores primero
        float = { border = "rounded" },
      })

      -- Ajustes de gopls (se combinan con los que trae nvim-lspconfig)
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            staticcheck = true, -- análisis extra: código muerto, malas prácticas
            analyses = {
              unusedparams = true, -- parámetros sin usar
              unusedwrite = true,  -- asignaciones que nunca se leen
            },
          },
        },
      })

      -- Servidores activos (nombres de nvim-lspconfig, no de Mason)
      vim.lsp.enable({
        "ts_ls",       -- typescript-language-server
        "gopls",       -- Go
        "angularls",   -- plantillas de Angular (requiere angular.json en el proyecto)
        "eslint",      -- ESLint (Nest/Angular)
        "html",        -- HTML
        "cssls",       -- CSS/SCSS/Less
        "somesass_ls", -- Sass (.sass) y mejor soporte de @use/mixins en SCSS
      })

      -- Atajos al conectarse un LSP. Neovim ya trae por defecto:
      --   K documentación · grn renombrar · gra code action · grr referencias
      --   gri implementación · gO símbolos del archivo · [d ]d error anterior/siguiente
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Ir a definición")
          map("gD", vim.lsp.buf.type_definition, "Ir a definición de tipo")
          map("<leader>d", vim.diagnostic.open_float, "Ver error de la línea")
        end,
      })
    end,
  },
}
