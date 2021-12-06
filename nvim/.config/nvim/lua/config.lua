-- vim.o: for setting global options
-- vim.bo: for setting buffer-scoped options
-- vim.wo: for setting window-scoped options

local indent = 4

-- vim.o.expandtab = true -- Use spaces instead of tabs
-- vim.o.shiftwidth = indent -- Size of the indent
-- vim.o.tabstop = indent -- Number of spaces tabs count for
vim.o.completeopt = 'menuone,noinsert,noselect' -- Completion options (for deoplete)
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.splitbelow = true -- Put new window below current
vim.o.splitright = true -- Put new window right current
vim.o.termguicolors = true -- True color support
vim.o.showmode = false
vim.o.wildmode = 'list:longest' -- Command-line completion mode
vim.o.showmatch = true
vim.o.signcolumn = 'yes'
-- vim.wo.list = true -- Show some invisible characters (tabs)
vim.wo.number = true -- Print line number
vim.wo.relativenumber = true -- Relative line numbers
vim.wo.wrap = false -- Disable line wrap
vim.wo.cursorline = true -- Enable highlighting of the current line

vim.cmd [[
    autocmd Filetype go setlocal tabstop=4 shiftwidth=4
    autocmd Filetype rust setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype csharp setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2
]]
