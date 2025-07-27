-- S/O's primeagen for most of this

-- open netrw with leader pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moves visual selection up / down by 1 line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- format the buffer via lsp switch to conform??
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remove search highlight with escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "clear highlighting"})

-- keeps cursor in the same place for J
vim.keymap.set("n", "J", "mzJ`z")

-- cursor stays in the middle as we move with C-u/C-d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--highlighted text pasted over goes into the void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete into void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland
-- use <leader>y/Y to yank into system clipboard, works on wsl?
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quick fix navigation
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")

-- Diagnostic keymaps
--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- move between splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


--local lsp_defsgrp = vim.api.nvim_create_augroup("lsp-defs", {})
--vim.api.nvim_create_autocmd("LspAttach", {
    --group = lsp_defsgrp,
    --callback = function(e)
        --local opts = { buffer = e.buf }
        --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        --vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        --vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    --end
--})
