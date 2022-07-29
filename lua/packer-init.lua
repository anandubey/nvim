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
	vim.api.nvim_command('packadd packer.nvim')
end

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


return packer.startup(function(use)

    use("nvim-lua/plenary.nvim")

	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})
  
    -- Plugin manager
    use({ "wbthomason/packer.nvim", enent = "VimEnter" })

    -- Colorscheme
    use { "ellisonleao/gruvbox.nvim" }
    
    -- File Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Dashboard
    use({
        "goolord/alpha-nvim",
        config = function()
            require("plugins.configs.alpha")
        end,
    })

    -- File Explorer
    use({
        "nvim-neo-tree/neo-tree.nvim",
        after = "alpha-nvim",
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.configs.neotree")
        end,
    })

    -- Status line at bottom
    use ({
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        event = "BufRead",
        config = function()
            require("plugins.configs.feline")
        end,
    })

    -- Bufferline
    use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
        event = "BufWinEnter",
		config = function()
			require("plugins.configs.bufferline")
		end,
	})

    -- Treesitter for better syntax highlighting
    use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
        event = "BufWinEnter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

    use ({
        'windwp/nvim-ts-autotag',
        event = "InsertEnter",
        after = "nvim-treesitter",
        config = function()
			require("nvim-ts-autotag").setup()
		end,
    })

    use ({ "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter" 
    })

    use ({
        'windwp/nvim-autopairs',
        config = function()
			require("plugins.configs.autopairs")
		end,
    })


    -- Auto Install LSP server
    use({
		"williamboman/nvim-lsp-installer",
		config = function()
			require("plugins.lsp")
		end,
	})

    -- Language Server
    use {'neovim/nvim-lspconfig'}

    -- LSP source for nvim-cmp
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    -- Autocompletion plugin
    use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	})
    -- pictogram for completion menu
    use 'onsails/lspkind-nvim'

    use {"tamago324/nlsp-settings.nvim" }
	use {"hrsh7th/cmp-path"}
	use {"hrsh7th/cmp-cmdline"}
	use {"dmitmel/cmp-cmdline-history"}
    use {"hrsh7th/cmp-emoji"}	
	use {"hrsh7th/cmp-calc"}	
	use {"hrsh7th/cmp-nvim-lsp-signature-help"}	

    use {"jose-elias-alvarez/null-ls.nvim" }
    use {'saadparwaiz1/cmp_luasnip'} 
    use {'L3MON4D3/LuaSnip'} 
	

    -- Colorize
	use({
		"norcalli/nvim-colorizer.lua",
        event = "BufRead",
		config = function()
			require("plugins.configs.colorizer")
		end,
	})

    use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.indentline")
		end,
	})


    -- Git sign
    use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	})

    use({
		"akinsho/toggleterm.nvim",
		keys = { "<C-\\>" },
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 1,
				start_in_insert = true,
				insert_mappings = false,
				persist_size = true,
				direction = 'float',
				close_on_exit = true,
				shell = vim.o.shell,
			})
		end,
	})

    -- Comment toggler
    use ({
		"terrortylor/nvim-comment",
		config = function()
			require("plugins.configs.comment")
		end,
	})


    -- List diagonastics of your code
    use {"folke/trouble.nvim"}
    
    -- Generate better annotation
    use {"danymat/neogen"}

    use({
		"nvim-telescope/telescope.nvim",
		after = "neo-tree.nvim",
        cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
	})

    if PACKER_BOOTSTRAP then
		  require("packer").sync()
	  end
end)
