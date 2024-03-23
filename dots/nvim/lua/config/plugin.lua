-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --use({
  --  'neanias/everforest-nvim',
  --  config = function()
  --    require('everforest').setup({
  --      background = 'soft',
  --      italics = true,
  --    })
  --    vim.cmd('colorscheme everforest')
  --  end,
  --})

  use({
    'secondary-smiles/skull-vim',
    config = function()
      vim.cmd('colorscheme skull')
    end
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'airblade/vim-gitgutter'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use "neovim/nvim-lspconfig"

  use "hrsh7th/nvim-cmp"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use({
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp"
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'nvim-tree/nvim-web-devicons'
end)
