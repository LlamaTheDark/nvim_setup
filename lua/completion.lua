-- ~/.config/nvim/lua/cmp.lua

-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- For LuaSnip users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- Scroll up in docs
    ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Scroll down in docs
    ['<C-Space>'] = cmp.mapping.complete(),     -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),            -- Abort completion
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },  -- For LuaSnip users
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- You can also set cmp for command line modes if desired
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- fix <Tab> printing ^I in command line
vim.cmd [[
  autocmd CmdlineEnter * silent! cunmap <Tab>
]]
