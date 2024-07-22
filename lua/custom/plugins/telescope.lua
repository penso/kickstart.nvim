-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        layout_strategy = 'horizontal',
        layout_config = {
          prompt_position = 'top',
          horizontal = {
            mirror = false,
            preview_width = 0.65,
            width = 0.98,
          },
          vertical = {
            mirror = true,
            width = 0.95,
          },
        },
        wrap_results = true,
        path_display = {
          "truncate",
          -- "smart",
          -- 'shorten',
          -- "filename_first",
          -- filename_first = {
          --   reverse_directories = false,
          -- },
        },
      },
      pickers = {
        colorscheme = {
          theme = "dropdown",
          enable_live_preview = true,
          enable_preview = true,
          previewer = false,
          layout_config = {
            horizontal = {
              mirror = false,
              width = 0.50,
              height = 0.90,
              preview_width = 0.65,
            },
          },
        },
        buffers = {
          -- layout_strategy = 'horizontal',
          -- sort_lastused = true,
          -- theme = "dropdown",
          -- -- layout_config = {
          -- --   -- prompt_position = 'top',
          -- -- },
          -- previewer = false,
          -- enable_preview = false,
          sort_lastused = true,
          theme = "dropdown",
          enable_preview = false,
          previewer = false,
          layout_config = {
            horizontal = {
              mirror = false,
              width = 0.50,
              height = 0.90,
              preview_width = 0.65,
            },
          },
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
            },
          },
        },
        oldfiles = {
          -- theme = "dropdown",
          previewer = false,
          -- initial_mode = "normal"
        },
        code_actions = {
          theme = "cursor",
          layout_config = {
            -- prompt_position = 'top',
          },
          previewer = false,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>gg', require('lazygit').toggle, { desc = 'Lazy[G]it' })
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search git [F]iles' })
    vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search [G]it [S]tatus' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sc', require('telescope.builtin').colorscheme, { desc = '[S]earch [C]olorscheme' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[S]earch [R]ecent Files' })

    local wk = require("which-key")
    wk.add({ { "<leader><space>", "Buffers", icon = { icon = "󰈔", color = "cyan" } } })
    -- wk.register({ { "<leader>s", group = "[S]earch" } })
    -- wk.register({
    --   s = {
    --     name = "[S]earch",
    --   },
    -- }, { prefix = "<leader>" })
  end
}
