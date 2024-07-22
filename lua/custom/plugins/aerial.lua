-- Neovim plugin for a code outline window
-- https://github.com/stevearc/aerial.nvim

return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require('aerial').setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end
    })
    vim.keymap.set('n', '<leader>co', '<cmd>AerialToggle!<CR>')

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>co", desc = "[C]ode [O]utline" },
      }
    )
  end
}
