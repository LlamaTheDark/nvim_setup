-- ~/.config/nvim/lua/telescope.lua

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Close on Escape in insert mode
        ["<Esc>"] = actions.close,
      },
    },
  },
}

-- Optional: create key mappings
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'List Buffers' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help Tags' })
