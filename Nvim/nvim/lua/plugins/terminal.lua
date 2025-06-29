return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- this sets the default terminal
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "rounded",
          width = 100,
          height = 30,
        },
        hidden = true,
        start_in_insert = true,
      })
    end,
  },
}
