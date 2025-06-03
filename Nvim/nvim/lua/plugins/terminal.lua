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
        },
        start_in_insert = true,
      })
    end,
  },
}
