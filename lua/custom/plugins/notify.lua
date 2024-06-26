return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      render = "wrapped-compact",
      max_width = 50,
      stages = "static",
      fps = 120,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
      end,
    }

    require('telescope').load_extension('notify')

    vim.notify = require('notify')

    local wk = require("which-key")
    wk.register({
      s = {
        name = "[S]earch",
        n = { "<cmd>Telescope notify<cr>", "[N]notifications" },
      },
    }, { prefix = "<leader>" })
  end
}
