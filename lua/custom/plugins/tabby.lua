local theme = {
  fill = 'TabLineFill',       -- tabline background
  head = 'TabLine',           -- head element highlight
  current_tab = 'PmenuThumb', -- 'StatusLineNC', -- current tab label highlight
  tab = 'TabLine',            -- other tab label highlight
  win = 'TabLine',            -- window highlight
  tail = 'TabLine',           -- tail element highlight
  main = 'PmenuSel',
}

return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- if I want to always display this tab line
    -- vim.o.showtabline = 2

    require('tabby').setup({
      -- preset = 'tab_only',
      option = {
        theme = theme,
        nerdfont = true,
        -- lualine_theme = 'rose-pine',
        -- tab_name = {
        --   -- name_fallback = function(tabid)
        --   --   return nil
        --   -- end,
        --   -- override = nil,
        -- },
        -- buf_name = {
        --   mode = "shorten"
        -- },
      },
      line = function(line)
        return {
          {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              -- tab.is_current() and '' or '󰆣',
              tab.number(),
              -- tab.name(),
              -- tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          hl = theme.fill,
        }
      end,
    })

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>t", group = "[T]abs", icon = { icon = "󰓩 ", color = "purple" } },
        { "<leader>ta", "<cmd>$tabnew<cr>", desc = "[A]dd" },
        { "<leader>tc", "<cmd>tabclose<cr>", desc = "[C]lose" },
        { "<leader>tn", "<cmd>tabn<cr>", desc = "[N]ext" },
        { "<leader>to", "<cmd>tabonly<cr>", desc = "[O]nly" },
        { "<leader>tp", "<cmd>tabp<cr>", desc = "[P]revious" },
        { "<leader>tm", group = "[M]oves" },
        { "<leader>tmn", "<cmd>:+tabmove<cr>", desc = "[M]ove to Next" },
        { "<leader>tmp", "<cmd>:-tabmove<cr>", desc = "[M]ove to Previous" },
      }
    );
  end,
}
