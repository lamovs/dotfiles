local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
local result = handle:read("*a")
handle:close()

if result:match("Dark") then
  vim.cmd.colorscheme("tokyonight-night")
else
  vim.cmd.colorscheme("tokyonight-day")
end
