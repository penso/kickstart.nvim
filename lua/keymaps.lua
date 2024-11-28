local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Idea from Lazyvim
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
--

map('n', '<leader>WQ', ':wa | qa<CR>', { desc = "Exit all buffers and tabs after save", noremap = true, silent = true })
