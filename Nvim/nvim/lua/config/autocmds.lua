-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Autocmd to insert file header for .cpp/.h files
function InsertDoxygenFileHeader()
  local buf = vim.api.nvim_get_current_buf()
  local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""

  -- Skip if header already exists
  if first_line:match("^/%*%*") then
    vim.notify("Doxygen header already exists", vim.log.levels.INFO)
    return
  end

  local filename = vim.fn.expand("%:t")
  local ext = filename:match("^.+(%..+)$") or ""
  local name_without_ext = filename:gsub("%.cpp", ""):gsub("%.c", ""):gsub("%.h", ""):gsub("%.hpp", "")
  local is_source = (ext == ".cpp" or ext == ".c")
  local brief = name_without_ext .. (is_source and " source file" or " header file")

  local header = {
    "/**",
    " * @file      " .. filename,
    " * @author    @ZouariOmar (zouariomar20@gmail.com)",
    " * @brief     " .. brief,
    " * @version   0.1",
    " * @date      " .. os.date("%Y-%m-%d"),
    " * @copyright Copyright (c) 2025",
    " * @link https://github.com/ZouariOmar ZouariOmar @endlink",
    " */",
    "",
  }

  vim.api.nvim_buf_set_lines(buf, 0, 0, false, header)
  vim.notify("Doxygen header inserted", vim.log.levels.INFO)
end

-- Auto-insert for new C/C++ files
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "*.cpp", "*.c", "*.h", "*.hpp" },
  callback = InsertDoxygenFileHeader,
})
