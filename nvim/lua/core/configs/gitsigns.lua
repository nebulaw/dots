-- Gitsigns

local status, signs = pcall(require, 'gitsigns')

if not status then return end

signs.setup()

