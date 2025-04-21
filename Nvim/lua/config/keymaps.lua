-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Terminal = require("toggleterm.terminal").Terminal

local float_term = Terminal:new({
  direction = "float",
  float_opts = {
    border = "rounded",
    width = 100,
    height = 30,
  },
  hidden = true,
  start_in_insert = true,
})

-- toggle terminal
vim.keymap.set("n", "<leader>t", function()
  float_term:toggle()
end, { desc = "Toggle Floating Terminal" })

-- escape terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Manual trigger
vim.api.nvim_set_keymap("n", "<leader>dh", [[:lua InsertDoxygenFileHeader()<CR>]], { noremap = true, silent = true })
