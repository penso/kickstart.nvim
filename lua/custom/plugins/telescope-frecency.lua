return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").load_extension "frecency"

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>sx", "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", desc = "Frecency" },
      }
    )
  end,
}
