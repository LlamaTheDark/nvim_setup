-- ~/.config/nvim/lua/treesitter.lua
require'nvim-treesitter.configs'.setup {
  -- List of parsers to install. You can add/remove languages as needed.
  ensure_installed = { "markdown", "markdown_inline", "bash", "c", "cpp", "lua", "python", "javascript", "html", "css", "php" },
  
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- additional_vim_regex_highlighting = false,
	additional_vim_regex_highlighting = {"php"};
  },
  
  indent = {
    enable = false,
  },
}
