-- Highlight arguments' definitions and usages, using Treesitter
-- https://github.com/m-demare/hlargs.nvim
return {
  "m-demare/hlargs.nvim",
  lazy = true,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('hlargs').setup()
  end
}
