local status_ok, onedarkpro = pcall(require, "onedarkpro")
if not status_ok then
    vim.notify("onedarkpro not found！")
    return
end

local config = {

}

return {
    onedarkpro.setup(config)
}
