-- KEYS
-- Leader Key
vim.g.mapleader = " "

-- Go Back To Last Position When
local line_num = vim.fn.line("'\"")
if line_num > 2 and line_num <= vim.fn.line("$") then
  vim.cmd("normal! g'\"")
end

-- Shortcuts
nmap = function(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end
imap = function(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = true })
end
vmap = function(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

nmap_remap = function(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = false, silent = true })
end

imap_remap = function(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = false, silent = true })
end

-- Clear Search Highlights
nmap("<leader>h", ":nohlsearch<CR>")
-- Back to Normal Mode
imap_remap("jk", "<ESC>la<ESC>")
-- imap('kj', '<ESC>')
-- File Saving
nmap("<C-s>", ":w!<CR>")
imap("<C-s>", "<ESC>l:w!<CR>")
-- Exiting All
nmap("<C-x>q", ":qa!<CR>")
imap("<C-x>q", "<ESC>:qa!<CR>")
-- Exit Current
nmap("<C-q>", ":q!<CR>")
imap("<C-q>", "<ESC>:q!<CR>")
-- Save Current & Exit
nmap("<C-x>s", ":wq!<CR>")
imap("<C-x>s", "<ESC>:wq!<CR>")
-- Save All & Exit
nmap("<C-x>a", ":wqa!<CR>")
imap("<C-x>a", "<ESC>:wqa!<CR>")
-- Compiling & Running File
nmap("<C-c>p", ":!python %<CR>")
nmap("<C-c>j", ":!java %<CR>")
nmap("<C-c>o", ":!ocaml %<CR>")
nmap("<C-c>c", ":!gcc % -o ./bin/%:r & ./bin/%:r<CR>")
-- Navigation Through Windows
nmap("<C-K>", ":wincmd k<CR>")
nmap("<C-J>", ":wincmd j<CR>")
nmap("<C-H>", ":wincmd h<CR>")
nmap("<C-L>", ":wincmd l<CR>")
-- Resize Windows
nmap("<C-w><left>", "<C-w><")
nmap("<C-w><right>", "<C-w>>")
-- Replacing in buffers
nmap("<C-x>r", ":%s/")
imap("<C-x>r", "<CMD>%s/")
-- Close All Buffers
nmap("<leader>ba", ":bufdo bd<CR>")
-- Move To Buffers
nmap("<leader>bn", ":bnext<CR>")
nmap("<leader>bp", ":bprevious<CR>")
-- Managing Tabs
nmap("tn", ":tabnew<CR>")
nmap("te", ":tabedit<CR>")
nmap("tc", ":tabclose<CR>")
nmap("tt", ":tabnext<CR>")
-- Paste
imap("<C-v>", "<ESC>l<S-p>i")
-- Undo/Redo
imap("<C-z>", "<ESC>ui")
imap("<C-y>", "<ESC><C-r>")
-- Toggle Colorizer
-- nmap('<leader>c', ':ColorizerToggle<CR>')
-- Text Modification - Tabs
nmap(">", "<C-v>>")
nmap("<", "<C-v><")
-- Increment/Decrement
nmap("+", "<C-a>")
nmap("-", "<C-x>")
-- Delete Word Backward
nmap("dw", "bveld")
nmap("db", "e<C-v>bd")
-- Select All
nmap("<C-a>", "gg<S-v>G")
-- Reload Config
nmap("<c-\\>\\", ":so %<CR>")
-- Deletion
nmap("dd", '"_dd')
vmap("d", '"_d')
vmap("P", '"_dP')
vmap("p", '"_dp')
