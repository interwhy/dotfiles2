local which_key = require "which-key"
local builtin = require('telescope.builtin')

local lsp_mappings = {
  { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
  { "<leader>l", group = "LSP" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
  { "<leader>lr", vim.lsp.buf.references, desc = "References" },
  { "<leader>ln", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol" },
  { "<leader>ld", vim.diagnostic.open_float, desc = "Open diagnostic float" },
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
  { "<leader>fg", builtin.git_files, desc = "Find git files" },
  { "<leader>fl", builtin.live_grep, desc = "Live grep" },
  { "<leader>fb", builtin.buffers, desc = "Find buffers" },
}

which_key.add(telescope_mappings)

