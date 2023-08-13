return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      -- component_separators = '|',
      -- section_separators = '',
    },
    sections = {
      lualine_a = { {
        'mode',
        fmt = function(_)
          return "󰀘"
          -- return res:sub(1, 1)
        end
      } },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename" },
      lualine_x = { "diagnostics", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location", "hostname" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
