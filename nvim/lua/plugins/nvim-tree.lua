return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Installs the icon library
  },
  config = function()
    -- 1. Disable default netrw (Standard requirement for nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 2. Setup the plugin
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false, -- Set to true if you want to hide .git, .config, etc.
      },
    })

    -- 3. Set a Keybinding (Toggle the tree with Space + e)
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
  end,
}
