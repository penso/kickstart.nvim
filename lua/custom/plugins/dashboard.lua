return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'number',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            icon = ' ',
            desc = 'Edit config',
            key = 'c',
            action = function()
              vim.cmd('e ~/.config/nvim/init.lua')
            end,
          },
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u'
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Recent Files',
            group = 'Label',
            action = 'Telescope oldfiles',
            key = 'r',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'Telescope find_files hidden=true',
            key = 'd',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
