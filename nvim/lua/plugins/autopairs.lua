return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true, -- This automatically runs require('nvim-autopairs').setup()
  -- Optional: If you want to link it with nvim-cmp (so selecting a function adds ())
  dependencies = { 'hrsh7th/nvim-cmp' },
  init = function()
    -- This block connects autopairs to your completion menu
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end
}
