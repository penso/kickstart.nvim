local function on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<leader>cl', vim.lsp.codelens.run, '[C]ode [L]ens')
  nmap('<leader>ch', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    '[C]ode Inlay [H]ints')

  -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ss', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  local wk = require("which-key")
  wk.add(
    {
      { "<leader>s", group = "[S]earch", icon = { icon = "", color = "blue" } },
    })

  wk.add(
    {
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>c", group = "[C]ode", icon = { icon = " ", color = "orange" } },
      { "<leader>ca", desc = "[C]ode [A]ction" },
      { "<leader>ch", desc = "[C]ode Inlay [H]ints" },
      { "<leader>cl", desc = "[C]ode [L]ens" },
      { "<leader>cr", desc = "[C]ode [R]ename" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>ss", desc = "[S]ymbols" },
    }
  )

  wk.add(
    {
      { "g",  group = "[G]oto" },
      { "gD", desc = "[G]oto [D]eclaration" },
      { "gI", desc = "[G]oto [I]mplementation" },
      { "gd", desc = "[G]oto [D]efinition" },
      { "gr", desc = "[G]oto [R]eferences" },
    })
end

return on_attach
