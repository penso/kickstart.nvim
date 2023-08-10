return {
  'rcarriga/nvim-notify',
  config = function()
    -- require('notify').setup {
    -- }
    require('telescope').load_extension('notify')
  end
}
