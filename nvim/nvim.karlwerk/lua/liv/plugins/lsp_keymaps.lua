local Snacks = require("snacks")
local map = vim.keymap.set

-- Neovim's default gr* LSP maps would make `gr` wait for a second key; their actions are mapped below
for _, lhs in ipairs({ "grn", "grr", "gri", "grt", "grx" }) do
  pcall(vim.keymap.del, "n", lhs)
end
pcall(vim.keymap.del, { "n", "x" }, "gra")

map("n", "<leader>cl", function() Snacks.picker.lsp_config() end, { desc = "LSP info" })

map("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- In TypeScript, jump to the real source of an import instead of its .d.ts; elsewhere, go to implementation
local function source_definition()
  local client = vim.lsp.get_clients({ bufnr = 0, name = "vtsls" })[1]
  if not client then
    return vim.lsp.buf.implementation()
  end
  local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
  client:request("workspace/executeCommand", {
    command = "typescript.goToSourceDefinition",
    arguments = { params.textDocument.uri, params.position },
  }, function(err, result)
    if err then
      vim.notify("Source definition: " .. err.message, vim.log.levels.ERROR)
    elseif result and #result > 0 then
      vim.lsp.util.show_document(result[1], client.offset_encoding, { focus = true })
    else
      vim.notify("No source definition found")
    end
  end, 0)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LivLspKeymaps", { clear = true }),
  desc = "Buffer-local LSP keymaps",
  callback = function(ev)
    local function bmap(mode, lhs, rhs, desc)
      map(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    bmap("n", "gd", function() Snacks.picker.lsp_definitions({ jump = { reuse_win = false } }) end, "Go to definition")
    bmap("n", "gD", function() Snacks.picker.lsp_declarations() end, "Go to declaration")
    bmap("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Go to type definition")
    bmap("n", "gr", function() Snacks.picker.lsp_references() end, "References")
    bmap("n", "gI", source_definition, "Go to source definition / implementation")
    bmap("n", "K", vim.lsp.buf.hover, "Hover")
    bmap("n", "gK", vim.lsp.buf.signature_help, "Signature help")
    bmap({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
    bmap("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
    bmap("n", "<leader>cR", function() Snacks.rename.rename_file() end, "Rename file")
    bmap("n", ";c", function() Snacks.picker.lsp_incoming_calls() end, "Incoming calls")
    bmap({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, "Next reference")
    bmap({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, "Previous reference")
  end,
})
