return {
  'nvim-java/nvim-java',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
      opts = {
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      },
    },
  },
  config = function()
    local java = require('java')
    local lspconfig = require('lspconfig')

    -- Create the capabilities object that nvim-cmp needs
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 1. IMPORTANT: java.setup() must be called BEFORE lspconfig.jdtls.setup
    java.setup()

    -- 2. Setup the LSP
    lspconfig.jdtls.setup({
        capabilities = capabilities, -- ADD THIS LINE!
      -- You can add custom settings here if needed later
      -- on_attach = function(client, bufnr) ... end,
    })
  end,
}
