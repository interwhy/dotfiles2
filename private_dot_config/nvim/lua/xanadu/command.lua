vim.api.nvim_create_user_command(
  "ClangFormat",
  function()
    vim.cmd("!clang-format -i %")
  end,
  {}
)

vim.api.nvim_create_user_command(
  "GersemiFormat",
  function()
    vim.cmd("!gersemi -i %")
  end,
  {}
)

