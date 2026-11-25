-- Leader must be set before any <leader> mapping is defined
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---@type liv.utils
_G.Liv = require("liv.utils")

require("liv.config.options")
require("liv.config.ui2")
require("liv.config.keymaps")
require("liv.config.autocmds")
require("liv.config.diagnostics")
require("liv.plugins")
