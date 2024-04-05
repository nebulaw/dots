-- LOCAL VARIABLES
local set = vim.opt

-- SETTERS
set.encoding = "utf8"
set.number = true
set.tabstop = 2
set.autoindent = true
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.swapfile = false
set.wrap = false
set.mouse = "a"
set.splitright = true
set.relativenumber = true
set.ignorecase = true
set.autoread = true
set.smartcase = true
set.incsearch = true
set.foldmethod = "marker"
set.lazyredraw = false
set.magic = true
set.showmatch = true
set.errorbells = false
set.visualbell = false
set.termguicolors = true
set.scrolloff = 10
set.clipboard:append("unnamedplus")
set.shell = "fish"
set.path:append({ "**" })
set.wildignore:append({ "*/node_modules/*" })
set.cursorline = true
set.winblend = 0
set.wildoptions = "pum"
set.pumblend = 5
set.background = "dark"
set.list = true
set.listchars:append("tab:··,trail:·")
set.rtp:append("/home/nebula/.opam/default/share/ocp-indent/vim")
set.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Neovide
if vim.g.neovide then
  vim.opt.guifont = "FiraCode Nerd Font Mono:h18"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 0.9
  vim.g.neovide_transparency = 1.0
  vim.g.neovide_refresh_rate = 59
  vim.g.neovide_refresh_rate_idle = 2
  vim.g.neovide_no_idle = false
  vim.g.neovide_confirm_quit = false
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_antialiasing = true
  -- Available VFX Modes: railgun, torpedo, pixiedust,
  -- sonicboom, ripple, wireframe
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_curl = 1.8
  vim.g.neovide_cursor_vfx_particle_density = 20
  vim.g.neovide_cursor_vfx_particle_lifetime = 2.2
  vim.g.neovide_cursor_vfx_particle_speed = 12.0
  vim.g.neovide_cursor_vfx_particle_phase = 2
  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0
end
