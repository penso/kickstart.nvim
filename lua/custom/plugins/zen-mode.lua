return {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
      alacritty = {
        enabled = true,
        font = "24", -- font size
      },
      gitsigns = { enabled = true },
      twilight = { enabled = true },
      tmux = { enabled = true },
    },
  }
}
