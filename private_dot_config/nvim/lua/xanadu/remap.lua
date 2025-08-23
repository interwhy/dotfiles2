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

