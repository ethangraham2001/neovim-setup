vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.cmd('highlight CursorLineNr ctermfg=red gui=bold')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.showmode = false

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

function SetTabs(val)
    vim.opt.tabstop = val  -- Set the width of a tab
    vim.opt.shiftwidth = val  -- Set the amount of space to use for each step of (auto)indent
    vim.opt.softtabstop = val  -- Set the number of spaces that a <Tab> in the file counts for
end

function SetCol(val)
    vim.opt.colorcolumn = tostring(val)
end
