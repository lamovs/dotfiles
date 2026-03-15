return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "day",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-day")
    end,
  },
}
