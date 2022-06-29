local staline = require('staline')

local colors = {
  lightbg = "#665c54",
  black = '#282828',
  red = "#ea6962",
  green = "#a9b665",
  yellow = "#d8a657",
  blue = "#7daea3",
  purple = "#d3869b",
  cyan = "#89b482",
  white = "#d4be98"
}

staline.setup {

  defaults = {
    left_separator = "",
    right_separator = "",
    cool_symbol = "󰣇 ",
    full_path = false,
    lsp_client_symbol = "󰒓 ",
    bg = "#282b2c",
    fg = colors.black,
    true_colors = false, -- true lsp colors.
    branch_symbol = "  "
  },

  sections = {
    left = { '-mode', 'left_sep_double', 'file_name', 'branch'},
    mid = {'lsp'},
    right = {vim.bo.fileencoding:upper(), ' ', 'right_sep_double', '-line_column'}
  },

  mode_icons = {
    n = "󰋜 ",
    i = "󰏫 ",
    c = "󰧚 ",
    v = "󰈈 ",
    V = "󰈈 "
  },

  mode_colors = {
    n = colors.green,
    i = colors.red,
    c = colors.blue,
    v = colors.yellow,
    V = colors.yellow
  },
  
  special_table = {
    NvimTree = { 'File Explorer', ' 󰣎  '},
    packer = { 'Packer', ' 󱑤  '},
    TelescopePrompt = { 'Telescope', '  '}
  },

  lsp_symbols = {Error = " 󰅙 ", Info = " 󰚽 ", Warn = " 󰍶 ", Hint = " 󰌵 "}
}

require('stabline').setup {
  style = "slant",
  bg = "#986fec",
  fg = "black",
  stab_right = "",
}