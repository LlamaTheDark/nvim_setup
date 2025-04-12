-- Toggle NvimTree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { desc = "Toggle File Explorer" })

-- Switch tabs with <alt> + n
for i = 1, 8 do
    vim.api.nvim_set_keymap('n', '<M-' .. i .. '>', i .. 'gt', { noremap = true, silent = true })
end
vim.keymap.set('n', '<M-9>', ':tablast<CR>', { desc = "Go to last tab" });

-- Open SymbolsOutline
vim.keymap.set('n', '<leader>o', ':SymbolsOutline<CR>', { desc = "Toggle Symbols Outline" })

-- Hover tips
vim.keymap.set({'n', 'i'}, '<C-Space>', function()
  vim.lsp.buf.hover()
end, { noremap = true, silent = true })

-- Folding
-- Key mappings using Neovim's Lua API for smooth folding control
-- Standard Vim shortcuts using nvim-ufo's functions
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { silent = true, desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { silent = true, desc = "Close all folds" })

-- Additional custom shortcuts using your leader key
vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds, { silent = true, desc = "Open all folds" })
vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds, { silent = true, desc = "Close all folds" })
