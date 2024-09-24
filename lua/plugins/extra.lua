return {
    {
        "stevearc/oil.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<M-h>"] = "actions.select_split",
                },
                view_options = {
                    show_hidden = true,
                },
                skip_confirm_for_simple_edits = true,
                prompt_save_on_select_new_entry = false,
            }

            vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
            vim.keymap.set(
                "n",
                "<space>-",
                require("oil").toggle_float,
                { desc = "Open parent directory in floating window" }
            )
        end,
    },
    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            on_open = function(_)
                vim.opt.nu = false
                vim.opt.relativenumber = false
                require("noice").disable()
                vim.o.foldcolumn = "0"
                vim.o.foldenable = false
            end,
            on_close = function()
                vim.opt.nu = true
                vim.opt.relativenumber = true
                require("noice").enable()
                vim.o.foldcolumn = "1"
                vim.o.foldenable = true
            end,
        },
    },
    -- Neovim plugin to improve the default vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
        config = function()
            require("dressing").setup()
        end,
    },
    -- Neovim notifications and LSP progress messages
    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        enabled = false,
        config = function()
            require("fidget").setup({
                window = { blend = 0 },
            })
        end,
    },
    -- Indent guide for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        -- opts = {
        --     indent = { char = "│", highlight = "IblChar" },
        --     scope = { char = "│", highlight = "IblScopeChar" },
        -- },
        config = function(_, _)
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup()
        end
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
        config = function()
            require("barbecue").setup({
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            })

            vim.api.nvim_create_autocmd({
                "WinResized", -- or WinResized on NVIM-v0.9 and higher
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",

                -- include this if you have set `show_modified` to `true`
                -- "BufModifiedSet",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end,
    },
    -- mouse replacement
    {
        "ggandor/leap.nvim",
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            require("mini.pairs").setup()

            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = vim.g.have_nerd_font })
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return "%2l:%-2v"
            end
        end,
    },
    {
        "echasnovski/mini.icons",
        opts = {},
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                -- needed since it will be false when loading and mini will fail
                package.loaded["nvim-web-devicons"] = {}
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}
