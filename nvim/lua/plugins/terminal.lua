return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
    },
  },
}
