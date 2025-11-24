return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- It's safer to pin to a stable release
  dependencies = { 
    'nvim-lua/plenary.nvim',
    -- Optional: Install specific font icon support
    'nvim-tree/nvim-web-devicons' 
  },
  config = function()
    local builtin = require('telescope.builtin')
    
    -- SET UP KEYBINDINGS
    -- Find Files (by filename) - The "Ctrl+P" of Neovim
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    
    -- Live Grep (search text inside all files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    
    -- Find Buffers (switch between open tabs)
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    
    -- Help Tags (search Neovim documentation)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
