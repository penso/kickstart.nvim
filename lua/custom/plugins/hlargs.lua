return {
  "m-demare/hlargs.nvim",
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('hlargs').setup()
  end
}
