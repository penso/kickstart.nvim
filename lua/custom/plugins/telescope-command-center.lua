return {
  "FeiyouG/command_center.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("command_center")
    -- vim.keymap.set("n", "<leader>u", "<cmd>Telescope command_center<cr>")
  end,
}
