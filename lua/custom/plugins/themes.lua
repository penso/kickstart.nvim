return {
  { "ellisonleao/gruvbox.nvim",   priority = 1000,    config = true, },
  -- { "gruvbox-community/gruvbox" },
  -- { "sonph/onehalf",            rtp = "vim" },
  { "EdenEast/nightfox.nvim" },
  -- { "LunarVim/onedarker.nvim" }
  -- broken gruvbox ones
  -- { "luisiacc/gruvbox-baby" },
  -- { "gruvbox-community/gruvbox" },

  { "Mofiqul/vscode.nvim" },
  { "catppuccin/nvim",            name = "catppuccin" },
  { "projekt0n/github-nvim-theme" }, -- incompatible with LSP
  { "sainnhe/edge" },
  { "sainnhe/sonokai" },
  { "rebelot/kanagawa.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "rose-pine/neovim" },
  { "Mofiqul/dracula.nvim" },
  { "sainnhe/everforest" },
  { "shaunsingh/nord.nvim" },
  { "savq/melange-nvim" },
  -- { "mountain-theme/Mountain" }
  { "loctvl842/monokai-pro.nvim" },
  { "ribru17/bamboo.nvim" },
  { "Shatur/neovim-ayu" },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer',
      }
      -- vim.cmd.colorscheme 'onedark'
    end,
  },
  { "oxfist/night-owl.nvim" },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  }
}
