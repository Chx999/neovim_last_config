return {
  "tpope/vim-markdown",
  config = function()
    -- tpope/vim-markdown
    vim.g.markdown_syntax_conceal = 0
    vim.g.markdown_fenced_languages = {
      "html",
      "python",
      "bash=sh",
      "json",
      "java",
      "js=javascript",
      "sql",
      "yaml",
      "xml",
      "Dockerfile",
      "Rust",
      "swift",
      "javascript",
      "lua",
    }
  end,
} --> syntax highlighting and filetype plugins for Markdown
