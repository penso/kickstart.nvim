return {
  'nanozuki/tabby.nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- if I want to always display this tab line
    -- vim.o.showtabline = 2
    require('tabby.tabline').use_preset('tab_only', {
      theme = {
        fill = 'TabLineFill',       -- tabline background
        head = 'TabLine',           -- head element highlight
        current_tab = 'TabLineSel', -- current tab label highlight
        tab = 'TabLine',            -- other tab label highlight
        win = 'TabLine',            -- window highlight
        tail = 'TabLine',           -- tail element highlight
      },
      nerdfont = true,              -- whether use nerdfont
      lualine_theme = nil,          -- lualine theme name
      -- tab_name = {
      --   name_fallback = function(tabid)
      --     return tabid
      --   end,
      -- },
      -- buf_name = {
      --   mode = "'unique'|'relative'|'tail'|'shorten'",
      -- },

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
