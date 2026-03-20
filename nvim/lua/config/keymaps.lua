-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { desc = "window previous" })

-- Add new line below, cursor stays
vim.keymap.set("n", "<CR>", "<cmd>call append(line('.'), '')<CR>", { desc = "add line below" })

-- Add new line below, cursor moves there
vim.keymap.set("n", "zj", "<cmd>call append(line('.'), '')<CR>j", { desc = "add line below and move cursor" })

-- Add new line above, cursor moves there
vim.keymap.set("n", "zk", "<cmd>call append(line('.')-1, '')<CR>k", { desc = "add line above and move cursor" })

-- Flash jump + go to definition (current window)
vim.keymap.set("n", "sd", function()
  require("flash").jump({
    action = function(match)
      vim.api.nvim_win_set_cursor(match.win, match.pos)
      vim.lsp.buf.definition()
    end,
  })
end, { desc = "Flash jump + go to definition" })

-- Flash jump + go to definition (vertical split)
vim.keymap.set("n", "sv", function()
  require("flash").jump({
    action = function(match)
      vim.api.nvim_win_set_cursor(match.win, match.pos)
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
    end,
  })
end, { desc = "Flash jump + go to definition (vsplit)" })

-- Flash jump + go to definition (horizontal split)
vim.keymap.set("n", "sh", function()
  require("flash").jump({
    action = function(match)
      vim.api.nvim_win_set_cursor(match.win, match.pos)
      vim.cmd("split")
      vim.lsp.buf.definition()
    end,
  })
end, { desc = "Flash jump + go to definition (split)" })

vim.keymap.set("n", "<leader>yl", function()
  require("config.copy_path").copy_current_relative_path_with_line()
end, { desc = "copy relative path:line" })

vim.keymap.set("n", "<leader>p", function()
  Snacks.picker.projects()
end, { desc = "projects" })

vim.keymap.set("n", "<leader>P", function()
  Snacks.picker.zoxide()
end, { desc = "projects (zoxide)" })
