return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end,     desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "[G]it [L]og" },
  }
}
