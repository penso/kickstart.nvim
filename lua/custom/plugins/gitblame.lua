return {
  "f-person/git-blame.nvim",
  config = function()
    require('gitblame').setup {
      enabled = false,
    }

    vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', { desc = '[G]it [B]lame' })
  end
}
