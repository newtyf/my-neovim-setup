return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>hp', gitsigns.preview_hunk)

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end)
      end
    })
  end
}
