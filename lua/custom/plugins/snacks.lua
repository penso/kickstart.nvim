return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    scroll = {
      enabled = false,
      animate = {
        duration = { step = 20, total = 200 },
        easing = 'linear',
      },
    },
    terminal = { enabled = true },
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = '[G]it [L]og',
    },
    {
      '<c-/>',
      function()
        Snacks.terminal("zsh", {})
      end,
      desc = 'Terminal',
    },
    -- {
    --   '<leader>N',
    --   desc = 'Neovim News',
    --   function()
    --     Snacks.win {
    --       file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
    --       width = 0.6,
    --       height = 0.6,
    --       wo = {
    --         spell = false,
    --         wrap = false,
    --         signcolumn = 'yes',
    --         statuscolumn = ' ',
    --         conceallevel = 3,
    --       },
    --     }
    --   end,
    -- },
  },
}
