return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Connects the LSP (Java) to the menu
    'L3MON4D3/LuaSnip',     -- Snippet engine (Required by nvim-cmp)
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' }, -- Pull suggestions from the Java server
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger menu
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to select
        ['<Tab>'] = cmp.mapping.select_next_item(), -- Tab to go down
        ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Shift+Tab to go up
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end,
}
