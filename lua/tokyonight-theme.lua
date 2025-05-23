vim.o.termguicolors = true
vim.o.background = "dark"

require('tokyonight').setup({
	style = 'night',
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { bold = true },
		functions = { bold = true },
	},
	sidebards = { "qf", "help" },
	on_highlights = function(hl, c)
		hl.TSVariableParameter = { link = "Identifier" }
	end,
})
vim.cmd('colorscheme tokyonight')
