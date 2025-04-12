if not vim.uv then
	vim.uv = vim.loop
end

-- ~/.config/nvim/init.lua
require("plugins")
require("lsp_setup")
require("completion")
require("telescope-config")
require("treesitter")
require("nvimtree")
require("keybindings")
require("theme")
require("style-guide") -- for things related to tabs, and some default settings like set number etc.
require("todo");
