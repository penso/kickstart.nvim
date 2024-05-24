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

-- local function lsp_status()
--   local lsp_name = vim.lsp.get_active_clients()[1].name
--   local buffer_filetype = vim.bo.filetype
--   local msg = ''
--
--   local clients = vim.lsp.get_clients()
--   if next(clients) == nil then
--     return msg
--   end
--
--   for _, client in ipairs(clients) do
--     local filetypes = client.config.filetypes
--     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--       return client.name
--     end
--   end
--   return msg
-- end
--

-- local get_lsp_client_new = function()
--   local clients = {} --- @type table<integer,vim.lsp.Client>
--   for _, client in ipairs(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) do
--     clients[client.id] = client
--   end
--
--   if next(clients) == nil then
--     print("No clients found")
--     return nil
--   end
--
--   -- Get lsp client for current buffer
--   for _, client in pairs(clients) do
--     local filetypes = client.config.filetypes
--     if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--       return client.config.filetypes
--     end
--   end
--
--   print("No clients found")
--   return nil
-- end

local get_lsp_client = function()
  -- Get lsp client for current buffer
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return nil
  end

  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.config.name
    end
  end

  return ""
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
      disabled_filetypes = { 'packer', 'NVimTree', 'NvimTree_1', 'quickfix', 'prompt', 'lazy', 'symbols-outline' },
      icons_enabled = true,
      theme = 'auto',
      -- component_separators = '|',
      -- section_separators = '',
    },
    sections = {
      lualine_a = {
        {
          'mode',
          -- fmt = function(str)
          --   -- return "󰀘"
          --
          --   return str:sub(1, 1)
          -- end
          fmt = function()
            -- Define the icons for each mode
            local mode_icons = {
              n = '󰀘', -- Normal mode
              i = '󰄛', -- Insert mode
              v = '󰄞', -- Visual mode
              [''] = '󰄟', -- Visual block mode (requires special handling)
              V = '󰄠', -- Visual line mode
              c = '󰄝', -- Command mode
              R = '󰄡', -- Replace mode
              t = '󰄢', -- Terminal mode
            }

            -- Get the current mode
            local mode = vim.fn.mode()

            -- Return the corresponding icon
            return mode_icons[mode] or mode:sub(1, 1) -- Fallback to first character of mode if no icon found
          end
        }
      },
      lualine_b = { "branch", "diff" },
      lualine_c = { "tabs" },
      lualine_x = {
        copilot_status,
        -- get_lsp_client,
        "diagnostics",
        "filetype"
      },
      lualine_y = {}, -- "location"
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
      lualine_c = {},
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
