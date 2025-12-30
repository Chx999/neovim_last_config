return {
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        mode = "term", -- 输出到内置终端
        filetype = {
          python = "python3 -u $fileName",
          javascript = "node $fileName",
          c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        },
      })
    end,
    keys = {
      { "<leader>r", "<cmd>RunCode<cr>", desc = "Run code" },
    },
  },
}
