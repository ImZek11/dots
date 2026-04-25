-- Basic settings
vim.o.number = true          -- Show line numbers
vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.shiftwidth = 4         -- Number of spaces for indentation
vim.o.tabstop = 4            -- Number of spaces a tab counts for

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Load this first
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = false,
            integrations = { telescope = true, cmp = true, gitsigns = true },
        },
    },

    -- Tool to open URLs
    {
        "sontungexpt/url-open",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        config = function()
            require("url-open").setup({
                open_app = "firefox", -- Forces Firefox as the browser
            })
        end,
    },
})

-- Apply colorscheme
vim.cmd.colorscheme("catppuccin")

-- Keymaps
-- Remap 'gx' to use the plugin and open the link under the cursor
vim.keymap.set("n", "gx", "<cmd>URLOpenUnderCursor<cr>", { desc = "Open link in Firefox" })

