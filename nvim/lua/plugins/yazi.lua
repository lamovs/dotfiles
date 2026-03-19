local function normalize_path(path)
  if not path or path == "" then
    return nil
  end

  return vim.fs.normalize(vim.fn.fnamemodify(path, ":p"))
end

local function current_file_in(root)
  local current_file = normalize_path(vim.api.nvim_buf_get_name(0))
  local normalized_root = normalize_path(root)

  if not current_file or not normalized_root then
    return nil
  end

  if current_file == normalized_root then
    return current_file
  end

  if vim.startswith(current_file, normalized_root .. "/") then
    return current_file
  end

  return nil
end

local function open_yazi_at_project_root()
  local root = normalize_path(LazyVim.root()) or normalize_path(vim.fn.getcwd())
  local current_file = current_file_in(root)

  if current_file then
    require("yazi").yazi(nil, root, { reveal_path = current_file })
    return
  end

  require("yazi").yazi(nil, root)
end

local function create_yazi_commands()
  pcall(vim.api.nvim_del_user_command, "Yazi")
  pcall(vim.api.nvim_del_user_command, "YaziRoot")

  vim.api.nvim_create_user_command("Yazi", function(opts)
    if #opts.fargs == 0 then
      open_yazi_at_project_root()
      return
    end

    local subcommand = opts.fargs[1]

    if subcommand == "cwd" then
      require("yazi").yazi(nil, vim.fn.getcwd())
      return
    end

    if subcommand == "toggle" then
      require("yazi").toggle()
      return
    end

    if subcommand == "logs" then
      vim.cmd.edit(require("yazi.log"):get_logfile_path())
      return
    end

    vim.notify(
      "`:Yazi "
        .. subcommand
        .. "` command does not exist."
        .. "\nUse any of the next instead:"
        .. "\n  * `:Yazi`"
        .. "\n  * `:Yazi cwd`"
        .. "\n  * `:Yazi toggle`"
        .. "\n  * `:Yazi logs`",
      vim.log.levels.ERROR,
      { title = "Yazi.nvim" }
    )
  end, {
    nargs = "*",
    desc = "Open yazi in the project root and reveal the current file by default",
    complete = function(arg_lead, cmdline)
      if cmdline:match("^['<,'>]*Yazi[!]*%s+%w*$") then
        return vim
          .iter({ "cwd", "toggle", "logs" })
          :filter(function(key)
            return key:find(arg_lead) ~= nil
          end)
          :totable()
      end
    end,
    bang = true,
  })

  vim.api.nvim_create_user_command("YaziRoot", open_yazi_at_project_root, {
    desc = "Open yazi in the project root and reveal the current file",
  })
end

return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>fy",
        open_yazi_at_project_root,
        desc = "Yazi (Root Dir, Reveal File)",
      },
      {
        "<leader>fY",
        function()
          require("yazi").yazi()
        end,
        mode = { "n", "v" },
        desc = "Yazi (Current File)",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Yazi (Resume)",
      },
    },
    opts = {
      open_for_directories = false,
      integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker",
        pick_window_implementation = "snacks.picker",
      },
      keymaps = {
        show_help = "<f1>",
      },
    },
    config = function(_, opts)
      require("yazi").setup(opts)
      create_yazi_commands()
    end,
  },
}
