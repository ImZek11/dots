-- Basic settings
vim.o.number = true          -- Show line numbers
vim.o.relativenumber = true  -- Show relative line numbers
vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.shiftwidth = 4         -- Number of spaces for indentation
vim.o.tabstop = 4            -- Number of spaces a tab counts for

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- other plugins...
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = { telescope = true, cmp = true, gitsigns = true },
    },
  },
})

vim.cmd.colorscheme("catppuccin")
