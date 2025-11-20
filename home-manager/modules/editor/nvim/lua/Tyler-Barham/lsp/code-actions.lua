-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local builtin = require('telescope.builtin')

    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,                opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,                 opts)
    vim.keymap.set('n', ',d', vim.lsp.buf.type_definition,            opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.hover,                      opts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.signature_help,             opts)
    vim.keymap.set('n', 'gi', builtin.lsp_implementations,            opts)
    vim.keymap.set('n', 'gr', builtin.lsp_references,                 opts)

    vim.keymap.set('n', ',wa',  vim.lsp.buf.add_workspace_folder,     opts)
    vim.keymap.set('n', ',wr',  vim.lsp.buf.remove_workspace_folder,  opts)
    vim.keymap.set('n', ',wl',  function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', '<leader>rn',  vim.lsp.buf.rename,            opts)
    vim.keymap.set('n', '<leader>ca',  vim.lsp.buf.code_action,       opts)
    -- vim.keymap.set('n', ',f',   function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

local fileSwapper = require('Tyler-Barham.lsp.swap-between-files')
vim.keymap.set('n', 'gh', fileSwapper.swap_between_header_source, { silent = true, noremap = true })

