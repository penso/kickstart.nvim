return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false, auto_trigger = false },
      panel = { enabled = true, auto_refresh = true },
      auto_trigger = true,
    }
  end,
}
