local M = {}

local function copy(value)
  vim.fn.setreg('"', value)
  vim.fn.setreg("+", value)
  vim.notify("Copied: " .. value)
end

local function path_variants(path)
  local filepath = vim.fs.normalize(path)
  local modify = vim.fn.fnamemodify

  return {
    filepath,
    modify(filepath, ":."),
    modify(filepath, ":~"),
    modify(filepath, ":t"),
  }, {
    "Absolute path",
    "Path relative to CWD",
    "Path relative to HOME",
    "Filename",
  }
end

function M.select_and_copy_path(path)
  if not path or path == "" then
    vim.notify("No path to copy", vim.log.levels.WARN)
    return
  end

  local values, labels = path_variants(path)
  local items = {}

  for i, label in ipairs(labels) do
    items[i] = label .. ": " .. values[i]
  end

  vim.ui.select(items, { prompt = "Choose path to copy:" }, function(_, idx)
    if idx and values[idx] then
      copy(values[idx])
    end
  end)
end

function M.copy_current_relative_path_with_line()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("Current buffer has no file path", vim.log.levels.WARN)
    return
  end

  local path = vim.fn.fnamemodify(vim.fs.normalize(file), ":.")
  local line = vim.api.nvim_win_get_cursor(0)[1]
  copy(("%s:%d"):format(path, line))
end

return M
