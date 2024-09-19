vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.ignorecase = true

opt.signcolumn = 'yes'
opt.scrolloff = 16
opt.number = true

opt.cursorline = true

vim.cmd('set termguicolors')
vim.cmd('colorscheme mytheme')

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', "<ESC>", ":nohlsearch<CR>", { nowait = true, silent = true })
