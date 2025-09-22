-- Setup language servers.
vim.lsp.set_log_level('off')

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file('', true),
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.config('ccls', {
  cmd = {
    'docker-dev', '-i',
    'ccls'
  },
  filetypes = { 'h', 'c', 'hpp', 'cpp', 'objc', 'objcpp', 'cuda', 'cu', 'cuh', 'proto' },
  root_markers = { 'compile_commands.json', '.ccls', '.git' },
  offset_encoding = 'utf-32',
  workspace_required = true,
  single_file_support = false,
  init_options = {
    completion = {
      caseSensitive = 2,
    },
    index = {
      blacklist = { 'build/', 'builds/' },
    },
    highlight = {
      lsRanges = true,
    },
  },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('jedi_language_server')
vim.lsp.enable('ccls')
