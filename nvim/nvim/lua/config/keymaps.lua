-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap to toggle floating terminal with <leader>t
local Terminal = require("toggleterm.terminal").Terminal
local floatterm = Terminal:new({ direction = "float" })
vim.keymap.set("n", "<leader>t", function()
  floatterm:toggle()
end, { desc = "Toggle Floating Terminal" })

-- escape terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
