-- ~/.config/nvim/lua/plugins/go.lua
return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod", "gosum", "gotmpl" },

    config = function()
      require("go").setup({
        -- IMPORTANT: let go.nvim manage LSP if you want full features
        -- lsp_cfg = true,

        -- Formatting (optional tuning)
        goimports = "gopls",
        gofmt = "gofumpt",

        -- Debugger
        dap_debug = true,
      })
    end,

    build = ':lua require("go.install").update_all_sync()',
  },
}
