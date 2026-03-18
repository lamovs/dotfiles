return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.explorer = opts.explorer or {}
      opts.explorer.enabled = true

      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.explorer = opts.picker.sources.explorer or {}

      local explorer = opts.picker.sources.explorer
      explorer.actions = explorer.actions or {}
      explorer.win = explorer.win or {}
      explorer.win.list = explorer.win.list or {}
      explorer.win.list.keys = explorer.win.list.keys or {}

      explorer.actions.copy_path_menu = function(_, item)
        if not item or not item.file then
          vim.notify("No file under cursor", vim.log.levels.WARN)
          return
        end

        require("config.copy_path").select_and_copy_path(item.file)
      end

      explorer.win.list.keys["gy"] = {
        "copy_path_menu",
        mode = "n",
        desc = "Copy Path",
      }
    end,
  },
}
