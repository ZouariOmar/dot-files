return {
  -- Main Doxygen comment generator
  {
    "vim-scripts/DoxygenToolkit.vim",
    ft = { "c", "cpp", "h", "hpp" },
    init = function()
      vim.g.DoxygenToolkit_authorName = "@ZouariOmar (zouariomar20@gmail.com)"
      vim.g.DoxygenToolkit_briefTag_pre = "@brief "
      vim.g.DoxygenToolkit_paramTag_pre = "@param "
      vim.g.DoxygenToolkit_returnTag = "@return "
      vim.g.DoxygenToolkit_licenseTag = "@copyright Copyright (c) 2025"
      vim.g.DoxygenToolkit_dateTag = "@date "
      vim.g.DoxygenToolkit_versionTag = "@version 0.1"
    end,
  },
}
