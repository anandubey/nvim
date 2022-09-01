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
	print "Installing packer close and reopen Neovim..."
	vim.api.nvim_command('packadd packer.nvim')
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


-- Have packer use a popup window
packer.init({
    compile_path = require("packer.util").join_paths(
		vim.fn.stdpath 'data' .. '/site/pack/loader/start/packer.nvim/plugin/packer_compiled.lua'
	),
	
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },

})


-- Install the plugins
return packer.startup(function(use)

    -- General Plugins
    use { "wbthomason/packer.nvim", event = "VimEnter" }  -- Plugin manager
    use { "nvim-lua/plenary.nvim" }  -- Lua functions used by various plugins
	use {
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	}  -- Lazy load plugins
    use ({
        "windwp/nvim-autopairs",
        config = function()
			require("plugins.configs.autopairs")
		end,
    }) -- generate autopairs
    use { 
        "numToStr/Comment.nvim",
        config = function()
			require("plugins.configs.comment")
		end,
    }  -- Better way to comment 
    use { "kyazdani42/nvim-web-devicons" }  -- File Icons
    use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
        tag = "v2.*",
        event = "BufWinEnter",
		config = function()
			require("plugins.configs.bufferline")
		end,
	}) -- Bufferline
    use { "kazhala/close-buffers.nvim" }  -- Close multiple buffers based on conditons
    use {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        event = "BufRead",
        config = function()
            require("plugins.configs.feline")
        end,
    }  -- Status line at bottom
    use {
        "nvim-neo-tree/neo-tree.nvim",
        after = "alpha-nvim",
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.configs.neotree")
        end,
    }  -- File Explorer
    use {
		"akinsho/toggleterm.nvim",
		config = function()
            require("plugins.configs.toggleterm")
		end,
	}  -- Floating terminal
    use {
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.indentline")
		end,
	}  -- Auto indent line
    use {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.configs.alpha")
        end,
    }  -- Dashboard
    use {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        after = "nvim-treesitter",
        config = function()
			require("nvim-ts-autotag").setup()
		end,
    }  -- AutoClose and AutoRename HTML tag using Treesitter
    use {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter" 
    }  -- Rainbow parantheses using tree-sitter
	use {
		"norcalli/nvim-colorizer.lua",
        event = "BufRead",
		config = function()
			require("plugins.configs.colorizer")
		end,
	}  -- Colorize
    use {
        "Pocco81/true-zen.nvim",
        config = function()
            require("plugins.configs.zenmode")
        end,
    }


    -- Colorschemes 
    use { "ellisonleao/gruvbox.nvim" }
    -- use {'shaunsingh/oxocarbon.nvim', run = './install.sh'}
    

    -- Treesitter for better syntax highlighting
    use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
        event = "BufWinEnter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	}


    -- cmp plugins
    use {
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	}  -- The completion plugin
    use { "hrsh7th/cmp-buffer" }  -- Buffer Completions
	use { "hrsh7th/cmp-path" }  -- Path completions
    use { "saadparwaiz1/cmp_luasnip" }  -- snippet completion
    use { "hrsh7th/cmp-nvim-lsp"}  -- LSP source for nvim-cmp
	use {"hrsh7th/cmp-cmdline"}
	use {"dmitmel/cmp-cmdline-history"}
    use {"hrsh7th/cmp-emoji"}	
	use {"hrsh7th/cmp-calc"}	
	use {"hrsh7th/cmp-nvim-lsp-signature-help"}	


    -- Snippets
    use { "L3MON4D3/LuaSnip" } 


    -- Lnaguage Server related Plugins
    use { "neovim/nvim-lspconfig" }  -- enable Language Server Protocol
    use {
		"williamboman/nvim-lsp-installer",
		config = function()
			require("plugins.lsp")
		end,
	}  -- Auto Install LSP server
    use { "jose-elias-alvarez/null-ls.nvim" } -- Formatters and Linters
    use { 
        "RRethy/vim-illuminate",
		config = function()
            vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree'}
            vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
            vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
		end,
    }  -- Highlight similar words under cursor
    use { "simrat39/rust-tools.nvim" }
    use {"folke/trouble.nvim"}  -- List diagonastics of your code


    -- Telescope
    use {
		"nvim-telescope/telescope.nvim",
		after = "neo-tree.nvim",
        cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
	}


    -- Git 
    use {
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	}


    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "ravenxrz/DAPInstall.nvim" }


    -- pictogram for completion menu
    use { "onsails/lspkind-nvim" }

    use {"tamago324/nlsp-settings.nvim" }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Always at the end, after all the plugins
    if PACKER_BOOTSTRAP then
		  require("packer").sync()
    end
end)
