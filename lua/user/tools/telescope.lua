local config = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
    },
    -- pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    -- },
    -- extensions = {
    --     media_files = {
    --         -- filetypes whitelist
    --         -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    --         filetypes = { "png", "webp", "jpg", "jpeg" },
    --         find_cmd = "rg" -- find command (defaults to `fd`)
    --     }
    -- },
}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("telescope not found！")
    return
end

return {
    telescope.setup(config),
    telescope.load_extension('project'),
    -- telescope.load_extension('live_grep'),
}
