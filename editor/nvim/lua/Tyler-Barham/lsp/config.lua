-- Setup language servers.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.set_log_level('off')

lspconfig.lua_ls.setup {
  capabilities = capabilities,
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
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.jedi_language_server.setup {
  capabilities = capabilities
}

-- lspconfig.clangd.setup {
--   capabilities = capabilities,
--   cmd = {
--     'docker-dev', '-i',
--     'clangd', '--background-index', '2>/dev/null'
--   },
--   filetypes = { 'h', 'c', 'hpp', 'cpp', 'objc', 'objcpp', 'cuda', 'cu', 'cuh', 'proto' },
--   root_dir = lspconfig.util.root_pattern(
--     '.clangd',
--     '.clang-tidy',
--     '.clang-format',
--     'compile_commands.json',
--     'compile_flags.txt',
--     'configure.ac',
--     '.svn',
--     '.git'
--   ),
--   single_file_support = false,
-- }

-- lspconfig.ccls.setup {
--   filetypes = { 'h', 'c', 'hpp', 'cpp', 'objc', 'objcpp', 'cuda', 'cu', 'cuh', 'proto' },
--   single_file_support = false,
--   init_options = {
--     completion = {
--       caseSensitive = 2,
--     },
--     index = {
--       blacklist = { 'build/', 'builds/' },
--     },
--     highlight = {
--       lsRanges = true,
--     },
--   },
-- }

-- lspconfig.kotlin_language_server.setup {
--   capabilities = capabilities
-- }

-- lspconfig.gdscript.setup {
--   capabilities = capabilities,
--   on_attach = function (client, _)
--     local _notify = client.notify
--     client.notify = function (method, params)
--       if method == 'textDocument/didClose' then
--         return -- Godot doesn't implement didClose yet
--       end
--       _notify(method, params)
--     end
--   end,
-- }

