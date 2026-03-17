return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "frappe",
      integrations = {
        lualine = {
          all = function(colors)
            local section = { bg = colors.base, fg = colors.text }
            return {
              normal = { c = section },
              insert = { c = section },
              terminal = { c = section },
              command = { c = section },
              visual = { c = section },
              replace = { c = section },
              inactive = { c = { bg = colors.base, fg = colors.overlay1 } },
            }
          end,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin-frappe",
        globalstatus = true,
      },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  { "akinsho/bufferline.nvim", enabled = false },
}
