-- ~/.config/nvim/lua/plugins/format.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang_format" },
        c = { "clang_format" },
        h = { "clang_format" },
        hpp = { "clang_format" },
      },
    },
  },
}
