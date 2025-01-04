return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({})

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>h", desc = "[H]arpoon" },
        {
          "<leader>ha",
          function() harpoon:list():add() end,
          desc = "[H]arpoon [A]dd",
        },
        {
          "<leader>hp",
          function() harpoon:list():prev() end,
          desc = "[H]arpoon [P]revious",
        },
        {
          "<leader>hn",
          function() harpoon:list():next() end,
          desc = "[H]arpoon [N]ext",
        },
        {
          "<leader>hs",
          function() toggle_telescope(harpoon:list()) end,
          desc = "[H]arpoon [S]earch",
        },
        {
          "<leader>hm",
          function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
          desc = "[H]arpoon [M]enu",
        },
      }
    );
  end
}
