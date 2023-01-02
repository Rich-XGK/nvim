local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
    vim.notify("lsp_signature not found!")
    return
end

local config = {

}

return {
    signature.setup(config)
}
