return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Nightfox Color Theme
    use 'EdenEast/nightfox.nvim'

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'

    -- NVIM-Tree.Lua
    use 'kyazdani42/nvim-tree.lua'

    -- Pretty tabs for buffers
    use 'akinsho/bufferline.nvim'

    -- lualine.nvim
    use 'nvim-lualine/lualine.nvim'

    -- lspconfig
    use 'neovim/nvim-lspconfig'

    -- rasi syntax highlighting
    use {
        'Fymyte/rasi.vim',
        ft = 'rasi',
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        -- tag = 'release' -- To use the latest release
    }

    -- css color highlighter
    use 'ap/vim-css-color'

    -- Collection of configurations for the built-in LSP client
    use 'neovim/nvim-lspconfig'
    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    -- Snippets source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'
  end)
