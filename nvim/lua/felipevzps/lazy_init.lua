-- lazy.nvim setup 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- using latest stable release or change to "main" for most recent version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim config to load plugins
require("lazy").setup({
    spec = "felipevzps.lazy",
    change_detection = { notify = false}
})
