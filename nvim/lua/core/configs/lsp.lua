
local protocol = require('vim.lsp.protocol')
local nvim_lsp = require('lspconfig')
local m_status, mason = pcall(require, 'mason')
local ml_status, mason_lsp = pcall(require, 'mason-lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

if not m_status or not ml_status then return end

local concat_tables = function (t1, t2)
  for i=1,#t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

local custom_conf_servers = {
  'lua_ls',
--  'clangd',
}

local default_conf_servers = {
  'cssls',
  'pyright',
  'html',
  'jsonls',
  'marksman',
  'vtsls',
  'tailwindcss',
}

mason.setup()
mason_lsp.setup({
  ensure_installed = concat_tables(custom_conf_servers, default_conf_servers),
})

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- DEFAULT SERVERS INITIALIZATION
for _, lsp in pairs(default_conf_servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'top',
          'block',
          'use',
          'imap',
          'nmap',
          'vmap',
          'telescope_buffer_dir',
          'imap_remap',
          'nmap_remap',
        },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}


nvim_lsp.clangd.setup {
  capabilities = capabilities,
}


