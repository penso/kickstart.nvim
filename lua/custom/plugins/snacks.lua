return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 5, total = 250 },
        easing = "linear",
      },
    },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end,     desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "[G]it [L]og" },
  }
}
