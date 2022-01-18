local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.cmd([[
function! OpenTerminal()
  split +term
  resize 10
endfunction
]])

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>t', ':call OpenTerminal()<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)
