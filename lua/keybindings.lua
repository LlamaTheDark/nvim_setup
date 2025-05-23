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

-- <leader>ca for “code action”
vim.keymap.set('n', '<leader>fa', function() vim.lsp.buf.code_action() end, { desc = "LSP: Code Action" })


-- function to “move” the current window (buffer) into tab `n`
local function move_win_to_tab(n)
  -- grab the buffer from the current window
  local buf = vim.api.nvim_win_get_buf(0)

  -- close this window (if it was the only window in the tab, the tab itself will close)
  vim.cmd('silent! close')

  -- if tab `n` already exists…
  if n <= vim.fn.tabpagenr('$') then
    -- jump to it…
    vim.cmd('tabnext ' .. n)
    -- …then open our buffer in a vertical split so we don’t clobber anything
    vim.cmd('vsplit')
    vim.api.nvim_win_set_buf(0, buf)
    -- equalize all windows in this tab
    vim.cmd('wincmd =')
  else
    -- otherwise create a new tab with our buffer
    -- (this is like “moving” it to a brand-new desktop)
    vim.cmd('tabedit ' .. vim.api.nvim_buf_get_name(buf))
  end
end

-- map <Ctrl-Alt-1> … <Ctrl-Alt-9> to move_win_to_tab(1..9)
for i = 1, 9 do
  vim.keymap.set(
    'n',
    '<C-M-' .. i .. '>',
    function() move_win_to_tab(i) end,
    { noremap = true, silent = true }
  )
end

