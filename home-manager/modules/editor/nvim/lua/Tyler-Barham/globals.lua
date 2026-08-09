
vim.g.mapleader = ' '
vim.g.maplocalleader = '/'

vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = 'xclip -selection clipboard',
    ['*'] = 'xclip -selection primary',
  },
  paste = {
    ['+'] = 'xclip -selection clipboard -o',
    ['*'] = 'xclip -selection primary -o',
  },
  cache_enabled = 0,
}

-- Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

