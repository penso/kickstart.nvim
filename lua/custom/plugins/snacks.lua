return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
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
    picker = {},
  },
  keys = {
    { "<leader>gg",      function() Snacks.lazygit() end,                                          desc = "Lazygit" },
    { "<leader>gl",      function() Snacks.lazygit.log() end,                                      desc = "[G]it [L]og" },
    { "<leader><space>", function() Snacks.picker.buffers({ layout = { preset = "vscode" } }) end, desc = "Buffers" },
    {
      '<c-/>',
      function()
        Snacks.terminal("zsh", {})
      end,
      desc = 'Terminal',
    },
  }
}
