return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = false,
        },
        contrast = 'hard', -- can be "hard", "soft" or empty string
      }
      --     vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = 'hard'
      --      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'oahlen/iceberg.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      --vim.cmd 'colorscheme iceberg'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = false,
      }
      vim.cmd 'colorscheme catppuccin'
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme zenbones'
    end,
  },
}
