-- lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "cpp", "c", "python", "lua" },
      highlight = {
        enable = true,
      },
      -- Optional: add more settings here if needed
    },
  },
}
