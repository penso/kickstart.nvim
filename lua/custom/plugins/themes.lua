return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       transparent_mode = true
  --     })
  --   end
  -- },
  -- {
  --   "rjshkhr/shadow.nvim",
  --
  --   priority = 1000,
  -- },
  -- { "gruvbox-community/gruvbox" },
  -- { "sonph/onehalf",            rtp = "vim" },
  -- { "EdenEast/nightfox.nvim", },
  -- { "LunarVim/onedarker.nvim" }
  -- broken gruvbox ones
  -- { "luisiacc/gruvbox-baby" },
  -- { "gruvbox-community/gruvbox" },

  -- { "Mofiqul/vscode.nvim", },
  -- { "catppuccin/nvim",             name = "catppuccin" },
  -- { "projekt0n/github-nvim-theme", },  -- incompatible with LSP
  -- { "sainnhe/edge", },
  -- { "sainnhe/sonokai", },
  -- { "rebelot/kanagawa.nvim", },
  -- { "olimorris/onedarkpro.nvim", },
  -- {
  --   "rose-pine/neovim",
  --
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "moon",
  --       dark_variant = "moon",
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = true,
  --       },
  --     })
  --   end
  -- },
  -- { "Mofiqul/dracula.nvim", },
  {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_transparent_background = 1
    end,
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  -- { "shaunsingh/nord.nvim", },
  -- { "savq/melange-nvim", },
  -- -- { "mountain-theme/Mountain" }
  -- { "loctvl842/monokai-pro.nvim", },
  -- { "ribru17/bamboo.nvim", },
  -- { "Shatur/neovim-ayu", },
  -- {
  --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       transparent = true,
  --       style = 'warmer',
  --     }
  --   end,
  -- },
  -- { "oxfist/night-owl.nvim", },
  --
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   opts = {},
  -- },
  --
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   priority = 1000,
  -- },
  --
  -- {
  --   "dgox16/oldworld.nvim",
  --   priority = 1000,
  -- }
}
