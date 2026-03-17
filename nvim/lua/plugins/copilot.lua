return {
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function(_, opts)
      opts.copilot_node_command = vim.fn.exepath("node")
    end,
  },
}
