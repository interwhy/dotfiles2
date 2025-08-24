return {
  "rcarriga/nvim-dap-ui",
  dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  config = function()
    local dap = require("dap")
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
    }
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/philip/.local/opt/cpptools/bin/OpenDebugAD7',
    }
    dap.defaults.cppdbg.exception_breakpoints = {'throw'}

    local dapui = require("dapui")
    dapui.setup()
--    dap.listeners.before.attach.dapui_config = function()
--      dapui.open()
--    end
--    dap.listeners.before.launch.dapui_config = function()
--      dapui.open()
--    end
  end
}
