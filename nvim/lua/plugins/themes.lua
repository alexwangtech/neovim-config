return {
  -- Theme 1: Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Load this before everything else
    opts = {},
  },

  -- Theme 2: Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },

  -- Theme 3: Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "wave", -- wave, dragon, lotus
    },
  },

  -- CONFIGURE THE DEFAULT HERE
  {
    "LazyVim/LazyVim", -- (Dummy plugin to hold the config logic if you aren't using LazyVim distro)
    config = function()
      -- CHANGE THIS LINE to switch themes:
      -- vim.cmd.colorscheme("tokyonight")
      -- vim.cmd.colorscheme("catppuccin")
      vim.cmd.colorscheme("kanagawa") 
    end,
  }
}
