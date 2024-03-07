-- A small automated session manager for Neovim
-- https://github.com/rmagatti/auto-session

return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    }
  end
}
