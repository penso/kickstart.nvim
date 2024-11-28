return {
  'LukasPietzschmann/telescope-tabs',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension 'telescope-tabs'
    require('telescope-tabs').setup {
      -- Manual copy of the `get_dropdown` theme from https://github.com/nvim-telescope/telescope.nvim/lua/telescope/themes.lua
      show_preview = false,
      layout_config = { width = 0.5, height = 0.4, prompt_position = "top" },
      layout_strategy = "center",
      results_title = false,
      -- sorting_strategy = "ascending",
      winblend = 15,
      border = true,
      enable_preview = false,
      previewer = false,
      borderchars = {
        prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },

      -- entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
      --   local tab_name = require("tabby.feature.tab_name").get(tab_id)
      --   return string.format("%d: %s%s", tab_id, tab_name, is_current and " <" or "")
      -- end,
      -- entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
      --   return require("tabby.feature.tab_name").get(tab_id)
      -- end
    }
    local wk = require("which-key")
    wk.add(
      {
        { "<leader>st", "<cmd>lua require('telescope-tabs').list_tabs()<cr>", desc = "[T]abs" },
      }
    )
  end,
}
