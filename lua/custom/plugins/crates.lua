return {
  'saecki/crates.nvim',
  ft = "toml",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup()
  end
}
