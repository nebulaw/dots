-- Completion

-- safe load
local cmp_status, cmp = pcall(require, 'cmp')
local kind_status, lspkind = pcall(require, 'lspkind')

if not cmp_status then return end
if not kind_status then return end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-B>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-O>'] = cmp.mapping.complete(),
    ['<C-E>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' }
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',

      before = function (_, vim_item)
        -- ...
        return vim_item
      end
    }),
  },
})

-- SOME GOOD SNIPPENTS
require('luasnip.loaders.from_vscode').lazy_load()


