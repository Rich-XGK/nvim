local status_ok, mason = pcall(require, "mason")
if not status_ok then
    vim.notify("mason not found!")
    return
end

local config = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

return mason.setup(config)
