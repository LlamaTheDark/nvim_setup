-- ~/.config/nvim/lua/keymaps.lua

-- Telescope keymaps for advanced finding
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })

-- Map <Alt>1 .. <Alt>9 to switch to the corresponding tab
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<A-' .. i .. '>', i .. 'gt', { noremap = true, silent = true })
end
