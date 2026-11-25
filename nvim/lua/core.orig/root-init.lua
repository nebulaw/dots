vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("liv")

-- require("lazy").setup("plugins", {
--   defaults = { lazy = true },
--   install = { colorscheme = { "jellybeans-nvim", "habamax" } },
--   checker = { enabled = false },
--   change_detection = { notify = false },
--   performance = {
--     rtp = {
--       disabled_plugins = {
--         "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
--         "netrwPlugin", "matchit", "matchparen",
--       },
--     },
--   },
-- })
