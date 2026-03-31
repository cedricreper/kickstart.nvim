return {
  {
    'ydkulks/cursor-dark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'cursor-dark'
    end,
  },
  {
    'vague-theme/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
        bold = false,
        italic = false,
      }
      --      vim.cmd 'colorscheme vague'
    end,
  },
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
        contrast = 'soft', -- can be "hard", "soft" or empty string
      }
      --vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.g.gruvbox_material_enable_italic = false
      -- vim.g.gruvbox_material_background = 'hard'
      -- vim.cmd.colorscheme 'gruvbox-material'
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
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.nord_italic = false
      -- vim.cmd 'colorscheme nord'
    end,
  },
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanso').setup {
        transparent = false,
      }
      -- vim.cmd 'colorscheme kanso'
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
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup {
        commentStyle = { italic = true },
        theme = 'dragon',
      }
      -- vim.cmd 'colorscheme kanagawa-dragon'
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
  {
    'anAcc22/sakura.nvim',
    dependencies = 'rktjmp/lush.nvim',
    config = function()
      vim.opt.background = 'dark' -- or "light"
      -- vim.cmd 'colorscheme sakura' -- sets the colorscheme
    end,
  },
}
