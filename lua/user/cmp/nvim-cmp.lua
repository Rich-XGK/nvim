-- check the status of cmp
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    vim.notify("cmp " .. "not found!")
    return
end
-- check the status of luasnip
local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
    vim.notify("snip " .. "not found!")
    return
end
-- check the status of autopairs
local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_status_ok then
    vim.notify("autopairs " .. "not found!")
    return
end
-- using for the mapping of <Tab>
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- some other good icons
local kind_icons = { -- find more here: https://www.nerdfonts.com/cheat-sheet
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return {
    cmp.setup({
        snippet = { -- REQUIRED - you must specify a snippet engine(from github doc)
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end
        },
        mapping = { -- customize keymappings
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm { select = true },
            -- customize <Tab>
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        },
        formatting = { -- the appearance of the completion menu
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                    -- luasnip = "[Snippet]",
                    -- buffer = "[Buffer]",
                    -- path = "[Path]",
                    nvim_lsp = "(LSP)",
                    luasnip = "(LuaSnippet)",
                    buffer = "(Buffer)",
                    path = "(Path)",
                    cmdline = "(cmd)",
                    spell = "(Spell)",
                    treesitter = "(TS)",
                    emoji = "(Emoji)",
                    calc = "(Calc)",
                    cmp_tabnine = "(Tabnine)",
                    vsnip = "(Snippet)",
                })[entry.source.name]
                return vim_item
            end,
        },
        sources = { -- the order of the completion
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = 'spell',
                option = {
                    keep_all_entries = true,
                    enable_in_context = function()
                        return true
                    end,
                },
            },
            { name = "cmp_tabnine" },
            { name = "calc" },
            { name = "emoji" },
            { name = "treesitter" },
            { name = "crates" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = true,
            native_menu = false,
        },
    }),
    -- Completions for command mode(github)
    cmp.setup.cmdline(':', {
        sources = {
            { name = 'cmdline' }
        }
    }),
    -- Completions for / search based on current buffer(github)
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    }),
    -- nvim-autopairs
    autopairs.setup({}),
}
