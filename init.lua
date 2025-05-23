if not vim.uv and vim.loop then
	vim.uv = vim.loop
end


-- ~/.config/nvim/init.lua
require("plugins")
require("lsp_setup")
require("debug-config")
require("completion")
require("telescope-config")
require("treesitter")
require("nvimtree")
-- require("onedark-theme") -- theme
require("tokyonight-theme")
require("style-guide") -- for things related to tabs, and some default settings like set number etc.
require("todo");
require("keybindings")
