return {
  "echasnovski/mini.files",
  opts = function(_, opts)
    -- I didn't like the default mappings, so I modified them
    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    opts.mappings = vim.tbl_deep_extend("force", opts.mappings or {}, {
      close = "<C-e>",
      -- Use this if you want to open several files
      go_in = "l",
      -- This opens the file, but quits out of mini.files (default L)
      go_in_plus = "<CR>",
      -- I swapped the following 2 (default go_out: h)
      -- go_out_plus: when you go out, it shows you only 1 item to the right
      -- go_out: shows you all the items to the right
      go_out = "H",
      go_out_plus = "h",
      -- Default <BS>
      reset = "<BS>",
      -- Default @
      reveal_cwd = ".",
      show_help = "g?",
      -- Default =
      synchronize = "s",
      trim_left = "<",
      trim_right = ">",

    })

    -- Here I define my custom keymaps in a centralized place
    opts.custom_keymaps = {
      copy_to_clipboard = "yy",
      zip_and_copy = "<space>yz",
      paste_from_clipboard = "p",
      copy_path = "<space>c",
      -- Don't use "i" as it conflicts wit insert mode
      preview_image = "<space>i",
      preview_image_popup = "<M-i>",
    }

    opts.windows = vim.tbl_deep_extend("force", opts.windows or {}, {
      preview = true,
      width_focus = 30,
      width_preview = 80,
    })

    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      use_as_default_explorer = true,
      permanent_delete = false,
    })
    return opts
  end,

  keys = {
    {
      "<C-e>",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
        if vim.fn.filereadable(buf_name) == 1 then
          -- Pass the full file path to highlight the file
          require("mini.files").open(buf_name, true)
        elseif vim.fn.isdirectory(dir_name) == 1 then
          -- If the directory exists but the file doesn't, open the directory
          require("mini.files").open(dir_name, true)
        else
          -- If neither exists, fallback to the current working directory
          require("mini.files").open(vim.uv.cwd(), true)
        end
      end,
      desc = "Open mini.files (Directory of Current File or CWD if not exists)",
    },
    -- Open the current working directory
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },

  config = function(_, opts)
    require("mini.files").setup(opts)
  end,
}
