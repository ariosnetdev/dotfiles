vim.lsp.enable('ts_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('emmet_ls')
vim.lsp.enable('json_ls')
vim.lsp.enable('html_ls')

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
