return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require('rustaceanvim.neotest')
      },
    }

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>ct", desc = "[C]ode [T]est" },
        {
          "<leader>cto",
          function() require("neotest").output_panel.toggle() end,
          desc = "[C]ode [T]est [O]utput",
          icon = { icon = "", color = "blue" },
        },
        {
          "<leader>ctw",
          function() require("neotest").output.open({ enter = true }) end,
          desc = "[C]ode [T]est [W]indow",
          icon = { icon = "", color = "blue" },
        },
        {
          "<leader>cts",
          function() require("neotest").summary.toggle() end,
          desc = "[C]ode [T]est [S]ummary",
          icon = { icon = "", color = "blue" },
        },
        {
          "<leader>ctr",
          function() require("neotest").run.run() end,
          desc = "[C]ode [T]est [R]un current test",
          icon = { icon = "🧪", color = "blue" },
        },
        {
          "<leader>ctf",
          function() require("neotest").run.run(vim.fn.expand("%")) end,
          desc = "[C]ode [T]est [F]ile ",
          icon = { icon = "🧪", color = "blue" },
        },
      }
    );
  end
}
