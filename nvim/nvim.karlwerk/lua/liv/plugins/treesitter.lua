local parsers = {
  -- Web
  "astro",
  "css",
  "graphql",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "php",
  "scss",
  "svelte",
  "tsx",
  "typescript",
  -- Systems and JVM
  "c",
  "cmake",
  "cpp",
  "groovy",
  "java",
  "kotlin",
  "properties",
  "rust",
  -- Python
  "python",
  "requirements",
  -- Shell, Lua, Vim
  "bash",
  "fish",
  "lua",
  "luadoc",
  "luap",
  "query",
  "vim",
  "vimdoc",
  -- Data, docs, git
  "diff",
  "git_config",
  "git_rebase",
  "gitcommit",
  "gitignore",
  "markdown",
  "markdown_inline",
  "printf",
  "regex",
  "sql",
  "toml",
  "xml",
  "yaml",
}

require("nvim-treesitter").install(parsers)

-- Installs missing parsers on FileType and starts highlighting
require("treesitter-autoinstall").setup()

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("LivTreesitter", { clear = true }),
  desc = "Use treesitter indentation when a parser is available",
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
