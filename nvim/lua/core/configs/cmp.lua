-- Completion

-- safe load
local cmp_status, cmp = pcall(require, "cmp")
local defaults = require("cmp.config.default")()
local kinds = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Codeium = "󰘦 ",
  Color = " ",
  Control = " ",
  Collapsed = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = "󰊕 ",
  Module = " ",
  Namespace = "󰦮 ",
  Null = " ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = "󰆼 ",
  Supermaven = " ",
  TabNine = "󰏚 ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = "󰀫 ",
}

if not cmp_status then
  return
end

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-B>"] = cmp.mapping.scroll_docs(-4),
    ["<C-F>"] = cmp.mapping.scroll_docs(4),
    ["<C-O>"] = cmp.mapping.complete(),
    ["<C-E>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
--    { name = "supermaven" }
  }, {
    { name = "buffer" },
  }, {
    { name = "path" },
  }),
  formatting = {
    format = function(_, item)
      local icons = kinds
      if icons[item.kind] then
        item.kind = icons[item.kind] .. item.kind
      end
      return item
    end,
  },
  sorting = defaults.sorting,
})


