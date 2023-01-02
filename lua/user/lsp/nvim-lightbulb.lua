local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
    vim.notify("nvim-lightbulb not found!")
    return
end

local config = {
    autocmd = { enabled = true }
}

return {
    lightbulb.setup(config)
}
