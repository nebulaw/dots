local opt = vim.opt

-- Display
opt.encoding = "utf8" -- Internal character encoding
opt.number = true -- Line numbers
opt.relativenumber = false -- Relative line numbers
opt.title = true -- Set terminal title from the current file
opt.cursorline = true -- Highlight current line
opt.wrap = false -- Do not wrap long lines
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- Keep 10 columns left/right of cursor
opt.termguicolors = true -- 24-bit colors
opt.signcolumn = "yes" -- Always show sign column
opt.showmatch = true -- Briefly jump to matching bracket
opt.matchtime = 2 -- Matching bracket highlight duration (tenths of a second)
opt.laststatus = 3 -- Single global statusline
opt.winborder = "rounded" -- Default border for floating windows
opt.pumheight = 10 -- Max items in popup menu
opt.pumblend = 5 -- Popup menu transparency
opt.winblend = 0 -- Opaque floating windows
opt.background = "dark" -- Use dark variant of colorschemes
opt.completeopt = "menuone,noinsert,noselect" -- Show menu for one match, insert nothing until chosen
opt.fillchars = { fold = " ", foldsep = " ", diff = "╱", eob = " " } -- Blank fold filler, hatched diff filler, no ~ after end of buffer
opt.list = true -- Show invisible characters
opt.listchars = { tab = "··", trail = "·", nbsp = "␣" } -- Glyphs for tabs, trailing spaces, non-breaking spaces
opt.smoothscroll = true -- Scroll wrapped lines by screen line
opt.guicursor = "a:block" -- Block cursor in every mode

-- Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Spaces per <Tab> keypress
opt.expandtab = true -- Insert spaces instead of tabs
opt.autoindent = true -- Copy indent from the previous line
opt.smartindent = true -- Auto-indent new lines

-- Search
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive when the pattern has uppercase
opt.incsearch = true -- Show matches while typing the pattern

-- Files and undo
local undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir -- Undo history location
opt.undofile = true -- Persist undo history across sessions
opt.undolevels = 10000 -- Max number of undoable changes
opt.swapfile = false -- No swap files
opt.writebackup = false -- No backup before overwriting a file
opt.autoread = true -- Reload files changed outside Neovim
opt.updatetime = 200 -- CursorHold delay and swap write interval (ms)
opt.timeoutlen = 500 -- Mapped sequence timeout (ms)
opt.ttimeoutlen = 0 -- Key code timeout (ms)

-- Behavior
opt.mouse = "a" -- Mouse in all modes
opt.clipboard:append("unnamedplus") -- Yank, delete and put use the system clipboard
opt.path:append("**") -- :find searches subdirectories
opt.wildmode = "longest:full,full" -- Complete longest match, then cycle
opt.wildoptions = "pum" -- Command-line completion in a popup menu
opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*.o", "*.obj", "*.pyc", "*.class", "*.jar" }) -- Skip in file completion

-- Folding
opt.foldmethod = "expr" -- Fold by expression
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Folds from treesitter syntax tree
opt.foldlevel = 99 -- Open all folds by default

-- Splits
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open right

-- netrw
vim.g.netrw_keepdir = 0 -- Sync current directory with the browsed directory
vim.g.netrw_localcopydircmd = "cp -r" -- Copy directories recursively

-- Providers
vim.g.loaded_python3_provider = 0 -- Skip Python host lookup
vim.g.loaded_ruby_provider = 0 -- Skip Ruby host lookup
vim.g.loaded_perl_provider = 0 -- Skip Perl host lookup
vim.g.loaded_node_provider = 0 -- Skip Node host lookup

-- Neovide
if vim.g.neovide then
  opt.linespace = 0
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
