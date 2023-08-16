return {
  "dstein64/nvim-scrollview",
  config = function()
    require('scrollview').setup({
      excluded_filetypes = { 'nerdtree', 'NvimTree' },
      current_only = true,
      winblend = 75,
      -- base = 'buffer',
      -- column = 80,
      signs_on_startup = { 'all' },
      diagnostics_severities = { vim.diagnostic.severity.ERROR }
    })
  end
}
