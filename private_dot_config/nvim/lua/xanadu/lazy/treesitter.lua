return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
 
    configs.setup({
      ensure_installed = {
	"c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "python",
	"typescript", "cpp", "rust", "slang", "glsl", "cmake", "toml", "bash"
      },
      sync_install = false,
      highlight = { enable = true },
    })
  end
}

