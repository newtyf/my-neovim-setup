vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Guardar y salir
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Guardar archivo" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Cerrar ventana" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Cerrar todo" })

-- Navegar entre splits
map("n", "<C-h>", "<C-w>h", { desc = "Ventana izquierda" })
map("n", "<C-j>", "<C-w>j", { desc = "Ventana abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ventana arriba" })
map("n", "<C-l>", "<C-w>l", { desc = "Ventana derecha" })

-- Mover líneas en visual mode
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Mover selección abajo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Mover selección arriba" })

-- Mantener cursor centrado al scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll abajo centrado" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll arriba centrado" })

-- Mantener cursor centrado al buscar
map("n", "n", "nzzzv", { desc = "Siguiente resultado centrado" })
map("n", "N", "Nzzzv", { desc = "Resultado anterior centrado" })

-- Limpiar búsqueda
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Limpiar resaltado" })

-- Pegar sin perder el registro
map("x", "<leader>p", [["_dP]], { desc = "Pegar sin sobreescribir registro" })

-- Copiar al portapapeles del sistema
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copiar al portapapeles" })
map("n", "<leader>Y", [["+Y]], { desc = "Copiar línea al portapapeles" })

-- Abrir explorador de archivos nativo
map("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Explorador de archivos" })
