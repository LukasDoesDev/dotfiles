require('settings')
require('packer-config')
require('nvim-tree-config')
require('mappings')
require('lualine-config')
require('colorschemes-config.nightfox')
require('lsp-config')

vim.opt.termguicolors = true
require('bufferline').setup()

require('gitsigns').setup{
    current_line_blame = true,
    word_diff = true,
}

