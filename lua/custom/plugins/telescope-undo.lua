return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("undo")

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>su", "<cmd>Telescope undo<cr>", group = "[U]ndo", },
      })
  end,
}
