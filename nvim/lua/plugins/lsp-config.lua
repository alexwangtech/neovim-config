return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- Load this plugin when opening a file
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- 1. SETUP JAVASCRIPT / TYPESCRIPT SERVER
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- 2. PYTHON (Add this block)
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- 3. ANGULAR (Add this block)
    lspconfig.angularls.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
    })

    -- 4. HTML (Optional but Recommended for Angular)
    -- This handles basic HTML tags that Angular LS might miss in non-angular files
    lspconfig.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "templ" },
    })

    -- (You can add other languages here later, like lspconfig.pyright.setup{} for Python)

    -- Create an Autocommand Group (so we don't duplicate listeners on reload)
    local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", {})

    -- The LspAttach event triggers whenever ANY server (jdtls, pyright, lua_ls) attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_group,
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Helper function to make mappings easier
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        -- === GLOBAL KEYBINDINGS ===
        
        -- Go to Definition (Jumps to the file/line where it's defined)
        map('gd', vim.lsp.buf.definition, 'Go to Definition')
        
        -- Go to References (Lists every place this variable/function is used)
        map('gr', vim.lsp.buf.references, 'Go to References')
        
        -- Hover (Shows documentation popup)
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        
        -- Go to Implementation (Useful for Interfaces -> Class)
        map('gI', vim.lsp.buf.implementation, 'Go to Implementation')
        
        -- Code Action (The "Quick Fix" menu)
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        
        -- Rename (Smart rename across all files)
        map('<leader>rn', vim.lsp.buf.rename, 'Smart Rename')
        
        -- Diagnostic Jump (Go to next error)
        map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
        map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
      end,
    })
  end,
}
