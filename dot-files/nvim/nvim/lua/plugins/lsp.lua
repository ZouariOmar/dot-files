-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        bashls = {},
        jdtls = {},
        cssls = {},
        dockerls = {},
        tsserver = {},
        svelte = {},
        eslint = {},
        html = {},
        pyright = {},
        sumneko_lua = {},
        yamlls = {},
        tailwindcss = {},
      },
    },
  },
}
