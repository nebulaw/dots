return {
	{ "rktjmp/lush.nvim", lazy = true },

	{
		"metalelf0/jellybeans-nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- if not vim.g.neovide then
			vim.cmd.colorscheme("jellybeans-nvim")
			-- end
		end,
	},

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = not vim.g.neovide },
		config = function(_, opts)
			require("solarized-osaka").setup(opts)
			-- if vim.g.neovide then
			-- vim.cmd.colorscheme("solarized-osaka")
			-- end
		end,
	},

	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },

	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		cond = not vim.g.neovide,
		opts = {
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"EndOfBuffer",
			},
			extra_groups = { "NeoTreeNormal", "NeoTreeNormalNC", "NormalFloat" },
		},
	},

	{
		"itchyny/lightline.vim",
		lazy = false,
		dependencies = { "mengelbrecht/lightline-bufferline" },
		init = function()
			vim.g.lightline = {
				colorscheme = "jellybeans-nvim",
				active = {
					left = { { "mode", "paste" }, { "readonly", "filename", "modified" } },
					right = { { "lineinfo" }, { "percent" }, { "filetype" } },
				},
				tabline = { left = { { "buffers" } }, right = {} },
				component_expand = { buffers = "lightline#bufferline#buffers" },
				component_type = { buffers = "tabsel" },
				component_raw = { buffers = 1 },
				separator = { left = "\u{e0b0}", right = "\u{e0b2}" },
				subseparator = { left = "\u{e0b1}", right = "\u{e0b3}" },
			}
			vim.g["lightline#bufferline#show_number"] = 2
			vim.g["lightline#bufferline#unicode_symbols"] = 1
			vim.g["lightline#bufferline#enable_devicons"] = 1
			vim.g["lightline#bufferline#clickable"] = 1
			vim.g["lightline#bufferline#filename_modifier"] = ":t"
			vim.opt.showtabline = 2
		end,
		config = function()
			local map = vim.keymap.set
			for i = 1, 9 do
				map("n", "<leader>" .. i, "<Plug>lightline#bufferline#go(" .. i .. ")", { silent = true })
				map("n", "<leader>c" .. i, "<Plug>lightline#bufferline#delete(" .. i .. ")", { silent = true })
			end
			map("n", "<Tab>", "<Plug>lightline#bufferline#go_next()", { silent = true })
			map("n", "<S-Tab>", "<Plug>lightline#bufferline#go_previous()", { silent = true })
		end,
	},

	{ "mengelbrecht/lightline-bufferline", lazy = true },

	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPost", "BufNewFile" },
		opts = { symbol = "│", draw = { delay = 100 }, options = { try_as_border = true } },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "│", tab_char = "│" },
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
}
