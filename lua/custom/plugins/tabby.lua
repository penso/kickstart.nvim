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
    vim.o.showtabline = 2

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
        buf_name = {
          mode = "shorten"
        },
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
          -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          --   return {
          --     line.sep('', theme.win, theme.fill),
          --     win.is_current() and '' or '',
          --     win.buf_name(),
          --     line.sep('', theme.win, theme.fill),
          --     hl = theme.win,
          --     margin = ' ',
          --   }
          -- end),
          -- {
          --   line.sep('', theme.tail, theme.fill),
          --   { '  ', hl = theme.tail },
          -- },
          hl = theme.fill,
        }
      end,
    })


    -- require('tabby.tabline').use_preset('tab_only', {
    --   theme = {
    --     fill = 'TabLineFill',       -- tabline background
    --     head = 'TabLine',           -- head element highlight
    --     current_tab = 'TabLineSel', -- current tab label highlight
    --     tab = 'TabLine',            -- other tab label highlight
    --     win = 'TabLine',            -- window highlight
    --     tail = 'TabLine',           -- tail element highlight
    --   },
    --   nerdfont = true,              -- whether use nerdfont
    --   lualine_theme = nil,          -- lualine theme name
    --   -- tab_name = {
    --   --   -- close_btn = function() return '' end, -- Disable close button
    --   --   name_fallback = function(tabid)
    --   --     local api = require('tabby.module.api')
    --   --     -- local win_name = require('tabby.feature.win_name')
    --   --     local wins = api.get_tab_wins(tabid)
    --   --     -- local cur_win = api.get_tab_current_win(tabid)
    --   --     local name = ''
    --   --     -- if api.is_float_win(cur_win) then
    --   --     --   name = '[Floating]'
    --   --     -- else
    --   --     --   name = win_name.get(cur_win)
    --   --     -- end
    --   --     if #wins > 1 then
    --   --       name = string.format('%s[%d+]', name, #wins - 1)
    --   --     end
    --   --     return name
    --   --   end,
    --   -- },
    --   -- buf_name = {
    --   --   mode = "'unique'|'relative'|'tail'|'shorten'",
    --   -- },
    --
    -- })

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
