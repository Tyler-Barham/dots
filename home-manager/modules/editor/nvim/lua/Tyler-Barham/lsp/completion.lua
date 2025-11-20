local cmp = require('cmp')

local lsp_symbols = {
  Array         = "",
  Boolean       = "󰨙",
  Class         = "",
  Codeium       = "󰘦",
  Color         = "",
  Control       = "",
  Collapsed     = "",
  Constant      = "󰏿",
  Constructor   = "",
  Copilot       = "",
  Enum          = "",
  EnumMember    = "",
  Event         = "",
  Field         = "",
  File          = "",
  Folder        = "",
  Function      = "󰊕",
  Interface     = "",
  Key           = "",
  Keyword       = "",
  Method        = "󰊕",
  Module        = "",
  Namespace     = "󰦮",
  Null          = "",
  Number        = "󰎠",
  Object        = "",
  Operator      = "",
  Package       = "",
  Property      = "",
  Reference     = "",
  Snippet       = "",
  String        = "",
  Struct        = "󰆼",
  TabNine       = "󰏚",
  Text          = "",
  TypeParameter = "",
  Unit          = "",
  Value         = "",
  Variable      = "󰀫",
}

cmp.setup({
  enabled = function() -- Disable completion in comments
    local context = require('cmp.config.context')
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
    end
  end,
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'kind', 'menu', 'abbr' },
    format = function(_, item)
      item.kind = lsp_symbols[item.kind]
      item.menu = "|"
      -- item.menu = ({
      --   buffer     = "[Buffer]",
      --   nvim_lsp   = "[LSP]",
      --   luasnip    = "[Snippet]",
      --   nvim_lua   = "[Lua]",
      --   path       = "[Path]",
      --   treesitter = "[Tree]",
      -- })[_.source.name]

      return item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>']     = cmp.mapping.scroll_docs(-4),
    ['<C-f>']     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.abort(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>']     = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>']  = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc' }
  }),
})

local npairs = require('nvim-autopairs')

npairs.setup({
    check_ts = true,
    ts_config = {
        -- lua = {'string'},-- it will not add a pair on that treesitter node
        -- java = false,-- don't check treesitter on java
    }
})

