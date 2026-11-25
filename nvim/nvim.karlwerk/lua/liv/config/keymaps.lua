local map = vim.keymap.set

-- Editing
map("i", "jk", "<Esc>l", { desc = "Exit insert mode" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", ">", ">>", { desc = "Indent line" })
map("n", "<", "<<", { desc = "Unindent line" })
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Delete and change without touching registers (dd, cc, dw, ... follow from d and c)
map({ "n", "x" }, "d", '"_d', { desc = "Delete without yanking" })
map({ "n", "x" }, "D", '"_D', { desc = "Delete to end of line without yanking" })
map({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })
map({ "n", "x" }, "C", '"_C', { desc = "Change to end of line without yanking" })
map("x", "p", "P", { desc = "Paste over selection without yanking it" })

-- Paths
map("n", "<leader>yf", function() Liv.path.yank("relative") end, { desc = "Yank relative path under cursor" })
map("n", "<leader>yp", function() Liv.path.yank("absolute") end, { desc = "Yank absolute path under cursor" })
map("x", "<leader>ym", "<Esc><Cmd>lua Liv.editor.copy_as_codeblock()<CR>", { desc = "Yank selection as Markdown code block" })

-- Save and quit (forced variants: <C-q> and <C-x>q discard unsaved changes)
map({ "n", "i" }, "<C-s>", "<Esc><Cmd>w!<CR>", { desc = "Save" })
map({ "n", "i" }, "<C-q>", "<Esc><Cmd>q!<CR>", { desc = "Quit window without saving" })
map({ "n", "i" }, "<C-x>q", "<Esc><Cmd>qa!<CR>", { desc = "Quit all without saving" })
map({ "n", "i" }, "<C-x>s", "<Esc><Cmd>wq!<CR>", { desc = "Save and quit" })
map({ "n", "i" }, "<C-x>a", "<Esc><Cmd>wqa!<CR>", { desc = "Save all and quit" })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-w><Left>", "<C-w><", { desc = "Narrow window" })
map("n", "<C-w><Right>", "<C-w>>", { desc = "Widen window" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bx", "<cmd>bufdo bdelete<cr>", { desc = "Delete all buffers" })
