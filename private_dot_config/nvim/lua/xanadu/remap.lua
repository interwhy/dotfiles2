local which_key = require "which-key"
local builtin = require "telescope.builtin"
local util = require "lspconfig.util"

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
  { "<leader>lh", ":LspClangdSwitchSourceHeader<CR>", desc = "Switch source header" },
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

local persistence = require("persistence")
local persistence_mappings = {
  { "<leader>q", group = "Persistence" },
  { "<leader>qq", function() persistence.load() end, desc = "Load the session for the current directory" },
  { "<leader>qs", function() persistence.select() end, desc = "Select a session" },
  { "<leader>ql", function() persistence.load({ last = true }) end, desc = "Load the last session" },
  { "<leader>qd", function() persistence.stop() end, desc = "Stop persistence, do not save this session on exit" },
}

which_key.add(persistence_mappings)

