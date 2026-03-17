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
      -- TODO: Remove this block if you stop using catppuccin-frappe.
      -- It only makes Snacks Explorer match the editor background.
      custom_highlights = function(colors)
        local panel = colors.base
        local border = colors.surface1

        return {
          SnacksPicker = { fg = colors.text, bg = panel },
          SnacksPickerInput = { fg = colors.text, bg = panel },
          SnacksPickerList = { fg = colors.text, bg = panel },
          SnacksPickerPreview = { fg = colors.text, bg = panel },
          SnacksPickerBox = { bg = panel },
          SnacksPickerBorder = { fg = border, bg = panel },
          SnacksPickerInputBorder = { fg = border, bg = panel },
          SnacksPickerListBorder = { fg = border, bg = panel },
          SnacksPickerPreviewBorder = { fg = border, bg = panel },
          SnacksPickerBoxBorder = { fg = border, bg = panel },
          SnacksPickerTitle = { fg = colors.blue, bg = panel },
          SnacksPickerInputTitle = { fg = colors.blue, bg = panel },
          SnacksPickerListTitle = { fg = colors.blue, bg = panel },
          SnacksPickerPreviewTitle = { fg = colors.blue, bg = panel },
          SnacksPickerFooter = { fg = colors.overlay1, bg = panel },
          SnacksPickerInputFooter = { fg = colors.overlay1, bg = panel },
          SnacksPickerListFooter = { fg = colors.overlay1, bg = panel },
          SnacksPickerPreviewFooter = { fg = colors.overlay1, bg = panel },
        }
      end,
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
