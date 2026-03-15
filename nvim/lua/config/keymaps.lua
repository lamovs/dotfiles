-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- theme switch
vim.keymap.set("n", "<leader>tl", function()
  vim.cmd.colorscheme("tokyonight-day")
end, { desc = "Theme Light" })

vim.keymap.set("n", "<leader>td", function()
  vim.cmd.colorscheme("tokyonight-night")
end, { desc = "Theme Dark" })
