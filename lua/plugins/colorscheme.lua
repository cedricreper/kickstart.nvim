return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'oahlen/iceberg.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme iceberg'
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
      -- vim.cmd 'colorscheme catppuccin'
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
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup {}
      -- vim.cmd 'colorscheme vague'
    end,
  },
}
