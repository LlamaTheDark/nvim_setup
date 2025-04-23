
require('nightfox').setup({
	options = {
		-- make comments italic, keywords bold, etc.
		styles = {
			comments = 'italic',
			keywords = 'bold',
			functions = 'NONE',
			variables = 'NONE',
		},
		-- disable inverse highlighting for these
		inverse = {
			match_paren = false,
			visual = false,
			search = false,
		},
		-- you can toggle true/false
		transparent = false,
		terminal_colors = true,
	},
	palettes = {
		-- optional: tweak the built‑in dayfox palette here
	},
})

vim.cmd('colorscheme dayfox')
