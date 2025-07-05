-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- Load default friendly snippets (VS Code JSON format)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load custom VS Code-style JSON snippets
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })

    -- Load Lua-style custom snippets
    -- require("luasnip.loaders.from_lua").lazy_load({
    --   paths = vim.fn.expand("~/.config/nvim/lua/snippets"),
    -- })
  end,
}
