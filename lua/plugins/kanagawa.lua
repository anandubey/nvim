return {
	"rebelot/kanagawa.nvim",
	config = function()
		require('kanagawa').setup({
			compile = true,
			background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
		});
		vim.cmd("colorscheme kanagawa")
	end,
	build = function()
		vim.cmd("KanagawaCompile");
	end
}
