require('dashboard').setup {
  theme = 'doom',
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    vertical_center = true,
    header = {
      [[ __    __          __ __                                              __       __ ]],
      [[|  \  |  \        |  \  \                                            |  \     |  \]],
      [[| ▓▓  | ▓▓ ______ | ▓▓ ▓▓ ______       __   __   __  ______   ______ | ▓▓ ____| ▓▓]],
      [[| ▓▓__| ▓▓/      \| ▓▓ ▓▓/      \     |  \ |  \ |  \/      \ /      \| ▓▓/      ▓▓]],
      [[| ▓▓    ▓▓  ▓▓▓▓▓▓\ ▓▓ ▓▓  ▓▓▓▓▓▓\    | ▓▓ | ▓▓ | ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓  ▓▓▓▓▓▓▓]],
      [[| ▓▓▓▓▓▓▓▓ ▓▓    ▓▓ ▓▓ ▓▓ ▓▓  | ▓▓    | ▓▓ | ▓▓ | ▓▓ ▓▓  | ▓▓ ▓▓   \▓▓ ▓▓ ▓▓  | ▓▓]],
      [[| ▓▓  | ▓▓ ▓▓▓▓▓▓▓▓ ▓▓ ▓▓ ▓▓__/ ▓▓    | ▓▓_/ ▓▓_/ ▓▓ ▓▓__/ ▓▓ ▓▓     | ▓▓ ▓▓__| ▓▓]],
      [[| ▓▓  | ▓▓\▓▓     \ ▓▓ ▓▓\▓▓    ▓▓     \▓▓   ▓▓   ▓▓\▓▓    ▓▓ ▓▓     | ▓▓\▓▓    ▓▓]],
      [[ \▓▓   \▓▓ \▓▓▓▓▓▓▓\▓▓\▓▓ \▓▓▓▓▓▓       \▓▓▓▓▓\▓▓▓▓  \▓▓▓▓▓▓ \▓▓      \▓▓ \▓▓▓▓▓▓▓]],
      [[]],
      [[]],
      [[]],
    },
    center = {
      { action = "enew | startinsert",    desc = " New File",        icon = " ", key = "n" },
      { action = "Telescope find_files",  desc = " Find File",       icon = " ", key = "f" },
      { action = "Telescope live_grep",   desc = " Find Text",       icon = " ", key = "g" },
      { action = "AutoSession search",    desc = " Restore Session", icon = " ", key = "s" },
      { action = "Lazy",                  desc = " Lazy",            icon = "󰒲 ", key = "l" },
      { action = "qa",                    desc = " Quit",            icon = " ", key = "q" },
    },
    -- footer = {},
  },
}

