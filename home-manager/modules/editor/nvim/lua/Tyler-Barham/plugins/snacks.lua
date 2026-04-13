local Snacks = require('snacks')
local Header = require('Tyler-Barham.themes.header')

local search_ignores = {
  'LanguageTranslations/',
  '*Tests/TestFiles/',
}

Snacks.setup({
  image = { enabled = false }, -- Need to setup support for LaTeX and Mermaid first
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = {
    enabled = true,
    matcher = {
      frecency = true,
    },
    actions = require("trouble.sources.snacks").actions,
    win = {
      input = {
        keys = {
          ['<Esc>']       = { 'cancel',               mode = { 'i', 'n' } },
          ['<PageUp>']    = { 'preview_scroll_up',    mode = { 'i', 'n' } },
          ['<PageDown>']  = { 'preview_scroll_down',  mode = { 'i', 'n' } },
          ['<M-t>']       = { 'trouble_open',         mode = { 'i', 'n' } },
          ['<M-r>']       = { 'toggle_live',          mode = { 'i', 'n' } },
        },
      },
    },
    sources = {
      files = {
        exclude = search_ignores,
      },
      grep = {
        exclude = search_ignores,
      },
    },
  },
  dashboard = {
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File",        action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text",       action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "s", desc = "Restore Session", action = ":AutoSession search" },
        { icon = "󰒲 ", key = "l", desc = "Lazy",            action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
      },
      header = Header.hello_world,
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
      { section = 'startup' },
    },
  },
})

local opts = { silent = true, noremap = true }

vim.keymap.set('n', '<leader>g', Snacks.lazygit.open, opts)

vim.keymap.set('n', '<leader>n', Snacks.notifier.show_history, opts)
vim.keymap.set('n', '<leader><leader>', Snacks.notifier.hide, opts)

vim.keymap.set('n', '<leader>fb', Snacks.picker.buffers, opts)
vim.keymap.set('n', '<leader>fc', Snacks.picker.highlights, opts)
vim.keymap.set('n', '<leader>ff', Snacks.picker.files, opts)
vim.keymap.set('n', '<leader>fg', Snacks.picker.grep, opts)
vim.keymap.set('n', '<leader>fh', Snacks.picker.help, opts)
vim.keymap.set('n', '<leader>fk', Snacks.picker.keymaps, opts)

