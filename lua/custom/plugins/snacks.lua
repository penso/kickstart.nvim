return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    notifier = { enabled = true },
    scroll = {
      enabled = false,
      animate = {
        duration = { step = 20, total = 200 },
        easing = 'linear',
      },
    },
    terminal = { enabled = true },
    picker = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = true },
    quickfile = { enabled = true },
    dashboard = {
      enabled = true,

      sections = {
        { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        -- { section = "header" },
        -- { section = "recent_files", limit = 8, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, limit = 10 },
        -- { title = "Sessions", padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        -- {
        --   pane = 2,
        --   icon = " ",
        --   title = "Git Status",
        --   section = "terminal",
        --   enabled = function()
        --     return Snacks.git.get_root() ~= nil
        --   end,
        --   cmd = "git status --short --branch --renames",
        --   height = 5,
        --   padding = 1,
        --   ttl = 5 * 60,
        --   indent = 3,
        -- },
        { section = "startup" },
      },

    },
  },
  keys = {
    { "<leader>fs",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>gl",      function() Snacks.lazygit.log() end,                                    desc = "[G]it [L]og" },
    { "<leader>;",       function() Snacks.dashboard() end,                                      desc = "Dashboard" },
    { "<leader>e",       function() Snacks.explorer() end,                                       desc = "Dashboard" },
    { "<leader><space>", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    -- { "<leader><space>", function() Snacks.picker.buffers({ layout = { preset = "vscode" } }) end, desc = "Buffers" },
    { "<leader>D",       function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto Type [D]efinition" },
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "[G]oto [D]efinition" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "[G]oto [I]mplementations" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          desc = "[G]oto [R]eferences" },
    {
      '<c-/>',
      function()
        Snacks.terminal("zsh", {})
      end,
      desc = 'Terminal',
    },
  }
}
