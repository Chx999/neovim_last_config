return {
  -- 1. Python LSP (pyright) 和格式化/整理工具 (black/isort)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python LSP Server: 推荐使用 pyright
        pyright = {},
      },
    },
  },

  -- 2. Java LSP (jdtls)
  -- 需要安装 Java Development Kit (JDK) 才能运行 JDTLS
  -- LazyVim 会自动处理 jdtls 的下载和配置
  {
    "nvim-java/nvim-java-core",
    lazy = false,
    ft = { "java" },
  },

  -- 3. 修复后的调试配置 (DAP)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- 基础依赖项
      "nvim-neotest/nvim-nio",
      {
        "rcarriga/nvim-dap-ui",
        -- 这里直接调用 setup，LazyVim 会处理好
        opts = {},
        config = function(_, opts)
          require("dapui").setup(opts)
        end
      },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    config = function()
      local dap = require("dap")
      -- 注意：千万不要在这里 require("dapui")，除非你能确定它加载成功了
      -- 我们改用 pcall (protected call) 来安全地尝试获取 dapui
      local ok, dapui = pcall(require, "dapui")
      if ok then
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
      end
    end,
  },

  -- 4. Tree-sitter (语法高亮和结构化编辑)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "java", "json" },
    },
  },
}
