-- Autopairs

-- safe load
local c_status, cmp = pcall(require, 'cmp')
local ca_status, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
local ap_status, autopairs = pcall(require, 'nvim-autopairs')

if not c_status or not ca_status or not ap_status then return end

autopairs.setup({
  check_ts = true,
})

cmp.event:on {
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    map_char = { tex = '' },
  }),
}


