local getFirstElement = function(s)
  for word in string.gmatch(s, "([^%.]+)") do
    return word
  end
  return s -- Return the original string if no '.' was found
end

local function custom_progress()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  if current_line == 1 then
    return "TOP"
  elseif current_line == total_lines then
    return "BOT"
  else
    return "%p%%/%L"
  end
end

local copilot_status = function()
  return require("copilot_status").status_string()
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  -- See `:help lualine.txt`
  opts = {
    extensions = { 'nvim-tree', 'trouble', 'toggleterm' },
    options = {
      disabled_filetypes = { 'packer', 'NVimTree', 'NvimTree_1' },
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
      lualine_x = {
        copilot_status,
        "diagnostics",
        "filetype"
      },
      lualine_y = { "location" },
      lualine_z = { custom_progress, {
        "hostname",
        fmt = function(hostname)
          return getFirstElement(hostname)
        end
      }
      },
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
