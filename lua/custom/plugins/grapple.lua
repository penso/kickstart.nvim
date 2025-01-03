return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  config = function()
    require("grapple").setup({
    })

    vim.keymap.set("n", "<leader>m", require("grapple").toggle)
    vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)
  end
}
