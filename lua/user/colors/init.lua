require("user.colors.onedarkpro")
require("user.colors.github-theme")

local themes = {
    github_dark = "github_dark",
    github_light = "github_light",
    onedarkpro = "onedarkpro"
}
local default_theme = themes.github_dark
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. default_theme)
if not status_ok then
    vim.notify("colorscheme " .. default_theme .. " not found!")
    return
end
