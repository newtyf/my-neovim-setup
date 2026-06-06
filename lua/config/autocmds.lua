-- Flash visual al copiar texto
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Resaltar texto copiado",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Eliminar espacios al final de líneas al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- Al abrir un archivo, volver a la última posición del cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Resaltar el número de línea del cursor en lugar de toda la línea en modo insert
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.cursorline = false
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.cursorline = true
  end,
})
