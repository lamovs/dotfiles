return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.triggers = opts.triggers or {
        { "<auto>", mode = "nxso" },
      }

      vim.list_extend(opts.triggers, {
        { "g", mode = { "n", "x" } },
        { "z", mode = { "n", "x" } },
        { "[", mode = { "n", "x" } },
        { "]", mode = { "n", "x" } },
        { "s", mode = { "n", "x", "o" } },
      })
    end,
  },
}
