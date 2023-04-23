local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	--utils
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	use "martinduartemore/vim_agentspeak_jason"

	use "tpope/vim-surround"
	use "tpope/vim-repeat"
	use "tpope/vim-commentary"
	use "windwp/nvim-autopairs"

	use {
		'phaazon/hop.nvim',
		branch = 'v2',
	}

	use "gaborvecsei/memento.nvim"

	use "numToStr/FTerm.nvim"

	use "gelguy/wilder.nvim"

	use "nvim-telescope/telescope.nvim"
	use 'nvim-telescope/telescope-media-files.nvim'

	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	use {
		"SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		}
	}

	use "lewis6991/gitsigns.nvim"

	use 'preservim/vim-markdown'
	-- use "tools-life/taskwiki"
	use 'vimwiki/vimwiki'
	use "ellisonleao/glow.nvim"

	-- use {
	-- 	"oberblastmeister/neuron.nvim",
	-- 	branch="unstable"}

	-- use {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	run = ":TSUpdate",
	-- }

	use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"



	--complete
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"

	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end
	}

	use "ahmedkhalf/project.nvim"

	--use "jose-elias-alvarez/null-ls.nvim"
	--use "RRethy/vim-illuminate"

	--appearence
	-- use "jacoborus/tender.vim"
	use "lunarvim/darkplus.nvim"
	use "rebelot/kanagawa.nvim"
	use "Mofiqul/vscode.nvim"
	-- use "shaunsingh/nord.nvim"
	use "rose-pine/neovim"
	use "ChristianChiarulli/nvcode-color-schemes.vim"
	use "EdenEast/nightfox.nvim"
	-- use "catppuccin/nvim"
	use "neanias/everforest-nvim"
	use "katawful/kat.nvim"
	use "https://codeberg.org/oahlen/iceberg.nvim"
	use {
		"jesseleite/nvim-noirbuddy",
		requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
	}

	use "xiyaowong/transparent.nvim"

	use {
		'kdheepak/tabline.nvim',
		 requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
	}

	-- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)


