vim.g.mapleader = " "

local function nmap(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end
local function imap(lhs, rhs) vim.keymap.set("i", lhs, rhs, { silent = true }) end
local function vmap(lhs, rhs) vim.keymap.set("v", lhs, rhs, { silent = true }) end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then vim.cmd('normal! g`"') end
  end,
})

nmap("<leader>h", "<cmd>nohlsearch<cr>")
vim.keymap.set("i", "jk", "<esc>l", { silent = true })

nmap("<C-s>", "<cmd>w!<cr>")
imap("<C-s>", "<esc><cmd>w!<cr>")
nmap("<C-x>q", "<cmd>qa!<cr>")
imap("<C-x>q", "<esc><cmd>qa!<cr>")
nmap("<C-q>", "<cmd>q!<cr>")
imap("<C-q>", "<esc><cmd>q!<cr>")
nmap("<C-x>s", "<cmd>wq!<cr>")
imap("<C-x>s", "<esc><cmd>wq!<cr>")
nmap("<C-x>a", "<cmd>wqa!<cr>")
imap("<C-x>a", "<esc><cmd>wqa!<cr>")

nmap("<C-c>p", "<cmd>!python %<cr>")
nmap("<C-c>j", "<cmd>!java %<cr>")
nmap("<C-c>o", "<cmd>!ocaml %<cr>")
nmap("<C-c>c", "<cmd>!gcc % -o ./bin/%:r && ./bin/%:r<cr>")

nmap("<C-k>", "<cmd>wincmd k<cr>")
nmap("<C-j>", "<cmd>wincmd j<cr>")
nmap("<C-h>", "<cmd>wincmd h<cr>")
nmap("<C-l>", "<cmd>wincmd l<cr>")
nmap("<C-w><left>", "<C-w><")
nmap("<C-w><right>", "<C-w>>")

nmap("<C-x>r", ":%s/")
imap("<C-x>r", "<cmd>%s/")

nmap("<leader>ba", "<cmd>bufdo bd<cr>")
nmap("<leader>bn", "<cmd>bnext<cr>")
nmap("<leader>bp", "<cmd>bprevious<cr>")

nmap("tn", "<cmd>tabnew<cr>")
nmap("te", "<cmd>tabedit<cr>")
nmap("tc", "<cmd>tabclose<cr>")
nmap("tt", "<cmd>tabnext<cr>")
nmap("Tn", "<cmd>tabnext<cr>")
nmap("Tp", "<cmd>tabprevious<cr>")

imap("<C-v>", "<esc>pa")
imap("<C-z>", "<esc>ui")
imap("<C-y>", "<esc><C-r>i")

nmap(">", "<C-v>>")
nmap("<", "<C-v><")
nmap("+", "<C-a>")
nmap("-", "<C-x>")

-- nmap("dw", "bveld")
nmap("db", "e<C-v>bd")
nmap("<C-a>", "gg<S-v>G")
nmap("<c-\\>\\", "<cmd>so %<cr>")

nmap("dd", '"_dd')
vmap("d", '"_d')
vmap("P", '"_dP')
vmap("p", '"_dp')
