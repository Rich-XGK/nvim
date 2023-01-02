local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
    vim.notify("github-theme not found！")
    return
end

local config = {

}

return {
    github_theme.setup(config)
}
