return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local treesitter = require 'nvim-treesitter'
        treesitter.setup()
        treesitter.install {
            "javascript",
            "typescript",
            "go",
            "markdown",
            "markdown_inline",
            "lua",
            "c",
            "bash",
            "yaml",
            "json"
        }
        vim.api.nvim_create_autocmd('FileType', {
          pattern = { 'javascript,javascriptreact,typescript,typescriptreact,lua,c,go,bash,yaml,json,markdown' },
          callback = function()
              vim.treesitter.start()
          end,
        })
    end
}
