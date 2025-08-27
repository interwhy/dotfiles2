local which_key = require "which-key"
local builtin = require "telescope.builtin"
local util = require "lspconfig.util"

-- copied from: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/clangd.lua
-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
  local method_name = 'textDocument/switchSourceHeader'
  bufnr = util.validate_bufnr(bufnr)
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'clangd' })[1]
  if not client then
    return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
  end
  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request(method_name, params, function(err, result)
    if err then
      error(tostring(err))
    end
    if not result then
      vim.notify('corresponding file cannot be determined')
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

local lsp_mappings = {
  { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
  { "<leader>l", group = "LSP" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
  -- { "<leader>lr", vim.lsp.buf.references, desc = "References" },
  { "<leader>lr", builtin.lsp_references, desc = "References" },
  { "<leader>ln", vim.lsp.buf.rename, desc = "Rename" },
  -- { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol" },
  { "<leader>lb", builtin.workspace_document_symbols, desc = "Buffer symbol" },
  { "<leader>lw", builtin.workspace_symbols, desc = "Workspace symbol" },
  { "<leader>ld", builtin.diagnostics, desc = "Diagnostics" },
  { "<leader>ll", vim.diagnostic.open_float, desc = "Open diagnostic float" },
  { "<leader>lh", function() switch_source_header(0); end, desc = "Switch source header" },
}

which_key.add(lsp_mappings)

local debug_mappings = {
  { "<F5>", function() require('dap').continue() end, desc = "Continue", mode = "n" },
  { "<F10>", function() require('dap').step_over() end, desc = "Step over", mode = "n" },
  { "<F11>", function() require('dap').step_into() end, desc = "Step into", mode = "n" },
  { "<F12>", function() require('dap').step_out() end, desc = "Step out", mode = "n" },
  { "<leader>d", group = "Debug" },
  { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle breakpoint", mode = "n" },
  { "<leader>dB", function() require('dap').set_breakpoint() end, desc = "Set breakpoint", mode = "n" },
  { "<leader>dd", function() require('dapui').toggle(); end, desc = "Toggle REPL", mode = "n" },
  { "<leader>de", function() require('dapui').eval(); end, desc = "Evaluate expression" },
}

which_key.add(debug_mappings)

local non_lsp_mappings = {
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "N", "Nzzzv", desc = "Previous search result and center" },
  { "n", "nzzzv", desc = "Next search result and center" },
}

which_key.add(non_lsp_mappings)

local telescope_mappings = {
  { "<leader>f", group = "Find" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  {
    "<leader>fa",
    function()
      builtin.find_files { hidden=true, no_ignore=true, no_ignore_parent=true }
    end,
    desc = "Find all files"
  },
  { "<leader>fg", builtin.git_files, desc = "Find git files" },
  { "<leader>fl", builtin.live_grep, desc = "Live grep" },
  { "<leader>fb", builtin.buffers, desc = "Find buffers" },
  { "<leader>fc", builtin.commands, desc = "Find commands" },
  { "<leader>b", group = "Browser" },
  { "<leader>bb", ":Telescope file_browser<CR>", desc = "File browser" },
  { "<leader>ba", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File browser at current buffer" },
}

which_key.add(telescope_mappings)

