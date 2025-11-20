local conform = require('conform')
local conform_util = require('conform.util')

conform.setup({
  log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    -- lua = { 'stylua' },
    python = { 'isort' },
    c = { 'docker_clang' },
    cpp = { 'docker_clang' },
  },

  formatters = {
    docker_clang = {
      command = 'docker-dev',
      args = {
        '-i',
        string.format("cd %s && clang-format $FILENAME", vim.fn.getcwd())
      },
      range_args = function(self, ctx)
        local start_offset, end_offset = conform_util.get_offsets_from_range(ctx.buf, ctx.range)
        local length = end_offset - start_offset
        return {
          '-i',
          string.format("cd %s && clang-format --offset %s --length %s $FILENAME", vim.fn.getcwd(), start_offset, length),
        }
      end,
    },
  },
})

local opts = { silent = true, noremap = true }

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function() conform.format({async=false, lsp_fallback=true}) end, opts)

