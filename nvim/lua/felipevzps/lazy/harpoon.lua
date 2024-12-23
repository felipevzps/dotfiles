return {
    "ThePrimeagen/harpoon",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        -- basic harpoon config
        require("harpoon").setup({
            global_settings = {
                save_on_toggle = false, -- Salva alterações ao alternar
                save_on_change = true, -- Salva alterações ao mudar
                enter_on_sendcmd = false, -- Entra no buffer ao enviar comando
                tmux_autoclose_windows = false, -- Fecha janelas do tmux automaticamente
                excluded_filetypes = { "harpoon" }, -- Ignora esses tipos de arquivo
            },
        })

        -- harpoon mapping
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- adds actual file to harpoon's list
        vim.keymap.set("n", "<leader>ha", function() mark.add_file() end, { })

        -- keymappings
        vim.keymap.set("n", "<leader>hh", function() ui.toggle_quick_menu() end, { })
        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { })
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { })
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { })
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { })
    end,
}
