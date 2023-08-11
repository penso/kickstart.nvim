return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
  end,
  opts = {
    auto_hide = true,
    tabpages = true,
    clickable = false,
    icons = {
      button = false,
    },
    sidebar_filetypes = {
      NvimTree = true,
    },
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
