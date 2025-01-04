return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  config = function()
    require("grapple").setup({
    })

    local wk = require("which-key")
    wk.add(
      {
        {
          "<leader>m",
          require("grapple").toggle,
          desc = "Grapple file",
        },
        {
          "<leader>M",
          require("grapple").toggle_tags,
          desc = "Grapple Menu",
        },
      }
    );
  end
}
