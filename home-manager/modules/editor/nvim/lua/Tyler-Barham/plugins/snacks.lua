local Snacks = require('snacks')

Snacks.setup({
  notifier = { enabled = true },
  image = { enabled = false }, -- Need to setup support for LaTeX and Mermaid first
  indent = {
    enabled = true,
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
      header = [[
 __    __          __ __                                              __       __ 
|  \  |  \        |  \  \                                            |  \     |  \
| ▓▓  | ▓▓ ______ | ▓▓ ▓▓ ______       __   __   __  ______   ______ | ▓▓ ____| ▓▓
| ▓▓__| ▓▓/      \| ▓▓ ▓▓/      \     |  \ |  \ |  \/      \ /      \| ▓▓/      ▓▓
| ▓▓    ▓▓  ▓▓▓▓▓▓\ ▓▓ ▓▓  ▓▓▓▓▓▓\    | ▓▓ | ▓▓ | ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓  ▓▓▓▓▓▓▓
| ▓▓▓▓▓▓▓▓ ▓▓    ▓▓ ▓▓ ▓▓ ▓▓  | ▓▓    | ▓▓ | ▓▓ | ▓▓ ▓▓  | ▓▓ ▓▓   \▓▓ ▓▓ ▓▓  | ▓▓
| ▓▓  | ▓▓ ▓▓▓▓▓▓▓▓ ▓▓ ▓▓ ▓▓__/ ▓▓    | ▓▓_/ ▓▓_/ ▓▓ ▓▓__/ ▓▓ ▓▓     | ▓▓ ▓▓__| ▓▓
| ▓▓  | ▓▓\▓▓     \ ▓▓ ▓▓\▓▓    ▓▓     \▓▓   ▓▓   ▓▓\▓▓    ▓▓ ▓▓     | ▓▓\▓▓    ▓▓
 \▓▓   \▓▓ \▓▓▓▓▓▓▓\▓▓\▓▓ \▓▓▓▓▓▓       \▓▓▓▓▓\▓▓▓▓  \▓▓▓▓▓▓ \▓▓      \▓▓ \▓▓▓▓▓▓▓



      ]],
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
