return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()

        require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>sf", builtin.find_files)
        vim.keymap.set("n", "<leader>sg", builtin.live_grep)
        vim.keymap.set("n", "<leader>sb", builtin.buffers)
        vim.keymap.set("n", "<leader>sh", builtin.help_tags)
        vim.keymap.set("n", "<leader>sr", builtin.lsp_references)
        vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols)
        vim.keymap.set("n", "<leader>sas", builtin.lsp_dynamic_workspace_symbols)
        vim.keymap.set("n", "<leader>sh", builtin.help_tags)
        vim.keymap.set("n", "<leader>sm", builtin.man_pages)
        vim.keymap.set("n", "<leader>sp", builtin.registers)
    end,
}


