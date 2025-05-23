-- ~/.config/nvim/lua/telescope-config.lua

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
	extensions = {
		['ui-select'] = {}
	},
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- Close on Escape in insert mode
				["<Esc>"] = actions.close,
				
				-- <C-q> sends *all* live_grep results to quickfix + opens it
				["<C-q>"] = function(prompt_bufnr)
					actions.send_to_qflist(prompt_bufnr)
					actions.open_qflist(prompt_bufnr)
				end,
			},
		},
	},
}

-- Optional: create key mappings
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'List Buffers' })
vim.keymap.set('n', '<leader>fB', function()
	require('telescope.builtin').live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep (open buffers)",
	})
end, { desc = 'Live Grep in Buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help Tags' })
