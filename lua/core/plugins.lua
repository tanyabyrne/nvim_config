local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim' --visual theme
	use 'nvim-tree/nvim-tree.lua' -- file tree
	use 'nvim-tree/nvim-web-devicons' -- icons for file tree
	use 'nvim-lualine/lualine.nvim' -- staus line 
	use 'nvim-treesitter/nvim-treesitter' -- code highlighting 
	use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v2.x',
  	requires = {
  	  -- LSP Support
    	{'neovim/nvim-lspconfig'},             -- Required
    	{                                      -- Optional
    	  'williamboman/mason.nvim',
    	  run = function()
    	    pcall(vim.cmd, 'MasonUpdate')
    	  end,
    	},
    	{'williamboman/mason-lspconfig.nvim'}, -- Optional

    	-- Autocompletion
    	{'hrsh7th/nvim-cmp'},         -- Required
    	{'hrsh7th/cmp-nvim-lsp'},     -- Required

    	-- Snippets
    	{'L3MON4D3/LuaSnip'},             -- Required
  	}
	}
	--use { -- lsp
	--	"williamboman/mason.nvim",
	--	"williamboman/mason-lspconfig.nvim",
	--	"neovim/nvim-lspconfig",
	--}
	use {-- telescope fussy findinder
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    rn('packer').sync()
  end
end)
