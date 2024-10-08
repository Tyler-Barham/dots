-- Basic settings
vim.opt.mouse = ''
vim.opt.encoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Mapping delay and keycode delay
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 20

-- Wrapping
vim.opt.linebreak = true -- Don't wrap in the middle of a word
--vim.opt.wrap = false -- Turn wrapping off
vim.opt.breakindent = true
vim.opt.breakindentopt = 'shift:1,sbr'
vim.opt.showbreak = '↳'

-- Display
vim.opt.showmatch  = true -- show matching brackets
vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.opt.synmaxcol = 500 -- stop syntax highlight after x lines for performance
vim.opt.hidden = true -- Hide buffers rather than unloading them
vim.opt.laststatus = 3 -- always show status line
vim.opt.fillchars = 'horiz:─,horizup:┴,horizdown:┬,vert:│,vertleft:┤,vertright:├,verthoriz:┼'
-- vim.opt.fillchars = 'horiz:═,horizup:╩,horizdown:╦,vert:║,vertleft:╣,vertright:╠,verthoriz:╬'

-- Line number column
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
--vim.opt.shiftwidth = 4
--vim.opt.tabstop = 4
--vim.opt.smarttab = true
vim.opt.expandtab = true
--vim.opt.autoindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

-- Whitespace
vim.opt.listchars = 'tab:│ ᵗ,trail:·,extends:◣,precedes:◢,nbsp:○'
vim.opt.list = true

-- Highlight the current line
vim.opt.cursorline = true

-- Enable guifg and guibg
vim.opt.termguicolors = true

