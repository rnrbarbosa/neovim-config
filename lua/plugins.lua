-- plugins 

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

return require('packer').startup(function()
	-- Packer can manage itself
	use ({ 'wbthomason/packer.nvim' })

	-- lsp
	use ({
		"neovim/nvim-lspconfig",
		config = [[require('config.lsp')]],
	})
    use {
        "williamboman/nvim-lsp-installer",
    }

	-- completion
	use ({
		"hrsh7th/nvim-cmp",
		config = [[require('config.cmp')]],
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			-- "L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",

		}
	})
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

	-- treesitter
	use ({
		'nvim-treesitter/nvim-treesitter',
		config = [[require('config.treesitter')]]
	})

	-- telescope
	use ({ 'nvim-lua/popup.nvim' })
	use ({ 'nvim-lua/plenary.nvim' })
	use ({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
	use ({
		'nvim-telescope/telescope.nvim',
		config = [[require('config.telescope')]],
	})

	-- undotree
	use ({ 
		'mbbill/undotree',
		cmd = { 'UndotreeShow', 'UndotreeToggle', 'UndotreeHide', 'UndotreeFocus' }
	})

 	-- comments
 	-- use 'tpope/vim-commentary'          
 	use ({
 		'terrortylor/nvim-comment',
 		config = [[require('config.comment')]]
 	})

	-- autopairs
	use ({
		'windwp/nvim-autopairs',
		config = [[require('config.autopairs')]],
		event = "InsertEnter",
	})

	-- colorscheme
 	use ({ 
 		'arcticicestudio/nord-vim',
 	})

 	use ({ 
 		'folke/tokyonight.nvim',
 	})

	use ({
		'rebelot/kanagawa.nvim',
	})

    use { 'lunarvim/colorschemes'}

    -- use ({
    --     'navarasu/onedark.nvim',
    --     config = [[require('config.onedark')]],
    -- })
	
	-- use ({
	-- 	-- 'kyazdani42/nvim-palenight.lua'
	-- 	'drewtempelmeyer/palenight.vim'
	-- })

	-- statusline
	use ({ 
		'nvim-lualine/lualine.nvim',
		config = [[require('config.lualine')]] 
	})

	-- bufferline
	use ({
		'akinsho/bufferline.nvim', 
		config = [[require('config.bufferline')]],
		requires = 'kyazdani42/nvim-web-devicons',
	})

	-- nvim tree
	use ({
		'kyazdani42/nvim-tree.lua',
		cmd = {
			"NvimTreeClipboard",
			"NvimTreeClose",
			"NvimTreeFindFile",
			"NvimTreeOpen",
			"NvimTreeRefresh",
			"NvimTreeToggle",
		},
		requires = 'kyazdani42/nvim-web-devicons',
		config = [[require('config.tree')]]
	})

	-- toggle term
	use ({
		"akinsho/toggleterm.nvim",
		config = [[require('config.toggleterm')]],
	})

	-- use ({
	-- 	'lukas-reineke/indent-blankline.nvim',
	-- 	config = [[require('config.indent-blankline')]]
	-- })

	-- notes
	use ({ 
		'vimwiki/vimwiki', branch = "dev",
		config = [[require('config.vimwiki')]],
		-- ft = {'wiki'}
	})

	-- ccs colors
	use ({ 
		'norcalli/nvim-colorizer.lua',
	})

	use ({
		'ThePrimeagen/vim-be-good'
	})

	-- startup time
	use ({ 
		'lewis6991/impatient.nvim',
		config = [[require('config.impatient')]]
	})

	use ({ 'tweekmonster/startuptime.vim' })

    -- Dashboard
	use ({
		'glepnir/dashboard-nvim',
		config = [[require('config.dashboard')]],
	})

    -- Code Formatter
    use { 'mhartington/formatter.nvim' }

    -- Git
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }


    -- Notify
    use { 'rcarriga/nvim-notify' }

    --  Tagbar
    use { 'majutsushi/tagbar'}
    
    --  floaterm
    use { 'voldikss/vim-floaterm' }

      use "hrsh7th/nvim-cmp" -- The completion plugin
      use "hrsh7th/cmp-buffer" -- buffer completions
      use "hrsh7th/cmp-path" -- path completions
      use "hrsh7th/cmp-cmdline" -- cmdline completions
      use "saadparwaiz1/cmp_luasnip" -- snippet completions

      -- snippets
      use "L3MON4D3/LuaSnip" --snippet engine
      use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

      use {
          'lewis6991/gitsigns.nvim',
          config = function()
            require('gitsigns').setup()
          end
        }
end)

