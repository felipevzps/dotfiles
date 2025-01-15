require("felipevzps.remap")
require("felipevzps.lazy_init")
require("felipevzps.set")
--require("felipevzps.netrw")

vim.cmd('colorscheme habamax')

vim.keymap.set({ 'n', 'x' }, 'y', '"+y')

-- use terminal transparency (tmux)
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NonText guibg=NONE ctermbg=NONE')
vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
