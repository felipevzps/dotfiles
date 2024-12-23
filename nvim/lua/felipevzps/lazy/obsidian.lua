return {
    "epwalsh/obsidian.nvim",

    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",

    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "workspace",
                    path = "~/obsidian/workspace",
                },
            },
            ui = {
                enable = false, -- disable all additional syntax features
            },
        })

        vim.api.nvim_set_keymap("v", "<leader>ll", [[:ObsidianLinkNew<CR>]], { noremap = true, silent = true })
    end
}
