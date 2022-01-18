return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Nightfox Color Theme
    use 'EdenEast/nightfox.nvim'

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'

    -- NVIM-Tree.Lua
    use 'kyazdani42/nvim-tree.lua'

    -- lualine.nvim
    use 'nvim-lualine/lualine.nvim'

    -- lspconfig
    use 'neovim/nvim-lspconfig'

    -- rasi syntax highlighting
    use {
      'Fymyte/rasi.vim',
      ft = 'rasi',
    }

    -- css color highlighter
    use 'ap/vim-css-color'
  end)
