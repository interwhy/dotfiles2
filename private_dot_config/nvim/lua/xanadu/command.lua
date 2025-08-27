vim.api.nvim_create_user_command(
  "ClangFormat",
  function()
    vim.cmd([[
      w
      !clang-format -i %
      e
    ]])
  end,
  {}
)

vim.api.nvim_create_user_command(
  "GersemiFormat",
  function()
    vim.cmd([[
      w
      !gersemi -i %
      e
    ]])
  end,
  {}
)

