vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20

-- Always open netrw after starting nvim
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "Vexplore"
})
