local o = vim.opt

o.encoding = "utf8"
o.number = true
o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.autoindent = true
o.swapfile = false
o.wrap = false
o.mouse = "a"
o.splitright = true
o.splitbelow = true
o.ignorecase = true
o.smartcase = true
o.autoread = true
o.incsearch = true
o.termguicolors = true
o.scrolloff = 10
o.sidescrolloff = 8
o.cursorline = true
o.signcolumn = "yes"
o.updatetime = 200
o.timeoutlen = 300

o.clipboard:append("unnamedplus")
o.path:append({ "**" })
o.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/target/*" })

o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
o.pumheight = 10
o.background = "dark"

o.list = true
o.listchars = { tab = "··", trail = "·", nbsp = "␣" }
o.fillchars = { fold = " ", foldsep = " ", diff = "╱", eob = " " }

o.undofile = true
o.undolevels = 10000

o.smoothscroll = true
o.foldlevel = 99

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

if vim.g.neovide then
  -- o.guifont = "FiraCode Nerd Font Mono:h18"
  o.linespace = 0
  vim.g.neovide_scale_factor = 1.4
  vim.g.neovide_opacity = 1.0
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 2
  vim.g.neovide_no_idle = false
  vim.g.neovide_confirm_quit = false
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_antialiasing = true
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
