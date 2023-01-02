local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    vim.notify("null_ls not found!")
    return
end


local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end

local config = {
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,
    },
}

return {
    null_ls.setup(config),
}
