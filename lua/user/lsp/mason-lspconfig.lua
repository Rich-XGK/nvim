local status_ok, mason_lspconfig = pcall(require, "mason_lspconfig")
if not status_ok then
    vim.notify("mason_lspconfig not found!")
    return
end

local config = {

}

return mason_lspconfig.setup(config)
