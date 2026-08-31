-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets", -- Optional: common VSCode-style snippets
  },
  config = function()
    local ls = require("luasnip")

    -- Load VS Code-style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load custom VS Code-style JSON snippets from your snippets dir
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim/snippets") },
    })

    -- Load custom Lua-style snippets from lua/snippets/
    -- require("luasnip.loaders.from_lua").lazy_load({
    --  paths = { vim.fn.expand("~/.config/nvim/lua/snippets") },
    -- })

    -- Optional settings (recommended)
    ls.config.set_config({
      history = true, -- Allows jumping back into snippets
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })
  end,
}
