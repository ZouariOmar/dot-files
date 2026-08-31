-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "cpp", "c", "python", "lua", "java", "html", "twig" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
    },
  },
}
