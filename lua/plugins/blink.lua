return {
    {
        "saghen/blink.compat",
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = "*",
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
    },
    {
        'saghen/blink.cmp',
        dependencies = {
            "ray-x/cmp-sql",
            'rafamadriz/friendly-snippets',
        },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { 
                preset = 'default',

                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },
                ["<tab>"] = { "accept", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
            },
            completion = {
                menu = {
                    border = "rounded",
                },
                ghost_text = {
                    enabled = true
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = {
                        border = "rounded",
                        desired_min_width = 30,
                    }
                }
            },
            signature = { enabled = true },
            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'normal'
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "sql" },
                providers = {
                    sql = {
                    -- IMPORTANT: use the same name as you would for nvim-cmp
                    name = "sql",
                    module = "blink.compat.source",

                    -- all blink.cmp source config options work as normal:
                    score_offset = -3,

                    -- this table is passed directly to the proxied completion source
                    -- as the `option` field in nvim-cmp's source config
                    --
                    -- this is NOT the same as the opts in a plugin's lazy.nvim spec
                    opts = {},
                    should_show_items = function()
                        return vim.tbl_contains(
                            -- Enable emoji completion only for git commits and markdown.
                            -- By default, enabled for all file-types.
                            { "sql" },
                            vim.o.filetype
                        )
                    end,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
}
