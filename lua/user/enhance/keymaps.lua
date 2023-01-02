--------------------------------------
---------------key maps---------------
--------------------------------------


--[[ Info about ways to set keymaps
    https://github.com/nanotee/nvim-lua-guide#defining-mappings
    MODES:
        String value    Help page       Affected modes                              Vimscript equivalent
        '' 	            mapmode-nvo	    Normal, Visual, Select, Operator-pending	:map
        'n'	            mapmode-n	    Normal	                                    :nmap
        'v'	            mapmode-v	    Visual and Select	                        :vmap
        's'	            mapmode-s	    Select	                                    :smap
        'x'	            mapmode-x	    Visual	                                    :xmap
        'o'	            mapmode-o	    Operator-pending	                        :omap
        '!'	            mapmode-ic	    Insert and Command-line	                    :map!
        'i'	            mapmode-i	    Insert	                                    :imap
        'l'	            mapmode-l	    Insert, Command-line, Lang-Arg	            :lmap
        'c'	            mapmode-c	    Command-line	                            :cmap
        't'	            mapmode-t	    Terminal	                                :tmap

    Neovim 提供了一系列的 api 函数来设置获取和删除映射：
        全局映射：
        vim.api.nvim_set_keymap()
        vim.api.nvim_get_keymap()
        vim.api.nvim_del_keymap()
        缓冲区映射：
        vim.api.nvim_buf_set_keymap()
        vim.api.nvim_buf_get_keymap()
        vim.api.nvim_buf_del_keymap()
        第一个参数是一个包含映射生效模式名称的字符串.
        第二个参数是包含映射左侧的字符串（触发映射中定义的命令的键或键集）。空字符串相当于 <Nop>，表示禁用键位。
        第三个参数是包含映射右侧（要执行的命令）的字符串。
        第四个参数是一个表，包含 :help :map-arguments 中定义的映射的布尔值选项(包括 noremap，不包括 buffer)。

    Neovim 提供了两个函数来设置 / 删除映射(它们是上述 API 函数的语法糖版本。): 注释：nvim -v = 0.7+
        vim.keymap.set()
        vim.keymap.del()
        第一个参数是字符串，代表映射生效的模式，也可以是一个字符串 table，这样可以一次性定义多个模式下的映射.
        第二个参数是映射的左侧，是字符串类型.
        第三个参数是映射的右侧，既可以是字符串也可以是一个 Lua 函数.
        第四个参数是是一个选项的 table，它是可选的，对应于传递给 vim.apt.nvim_set_keymap() 的选项，并添加了一些内容（完整列表请参见 :help vim.keymap.set()）。
]]


local function map_set()
    -- Remap ; as leader key
    vim.g.mapleader = ";"
    vim.g.maplocalleader = ";"

    -- Keymap setting
    local opts = { noremap = true, silent = true }
    local term_opts = { silent = true }
    local map_set = vim.keymap.set

    ------file management------

    ------------
    ---Normal---
    ------------

    -- Better window navigation
    map_set("n", "<C-k>", "<C-w>k", opts) -- choose buffer on the top
    map_set("n", "<C-j>", "<C-w>j", opts) -- choose buffer on the buttom
    map_set("n", "<C-h>", "<C-w>h", opts) -- choose buffer on the left
    map_set("n", "<C-l>", "<C-w>l", opts) -- choose buffer on the right
    -- Resize with arrows
    map_set("n", "<C-Up>", ":resize -3<CR>", opts)
    map_set("n", "<C-Down>", ":resize +3<CR>", opts)
    map_set("n", "<C-Left>", ":vertical resize +3<CR>", opts)
    map_set("n", "<C-Right>", ":vertical resize -3<CR>", opts)
    -- Navigate buffers
    map_set("n", "<S-l>", ":bnext<CR>", opts)
    map_set("n", "<S-h>", ":bprevious<CR>", opts)
    -- Move line up and down
    map_set("n", "<A-k>", ":m .+1<CR>==", opts) -- line up
    map_set("n", "<A-j>", ":m .-2<CR>==", opts) -- line down
    -- Save buffer
    map_set({ "n", "v", "s", "o" }, "<leader>w", ":w<CR>", opts)
    -- Save and exit current buffer
    map_set({ "n", "v", "s", "o" }, "<leader>s", ":wq<CR>", opts)
    -- Exit current buffer forcely
    map_set({ "n", "v", "s", "o" }, "<leader>q", ":q!<CR>", opts)
    -- Nvim-tree keymappings
    map_set({ "n", "v", "s", "o" }, "<leader>e", ":NvimTreeToggle<CR>", opts)
    map_set({ "n", "v", "s", "o" }, "<leader>f", ":NvimTreeFindFile<CR>", opts)
    -- Telescope keymappings
    map_set("n", "<S-f>", ":Telescope find_files <CR>", opts)
    map_set("n", "<S-p>", ":Telescope project <CR>", opts)
    map_set("n", "<S-t>", "<cmd>Telescope live_grep<cr>", opts)
    map_set("n", "<S-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
    map_set("n", "<S-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
    -- Bufferline keymappings
    map_set("n", "<S-Left>", ":BufferLineCyclePrev<cr>", opts)
    map_set("n", "<S-Right>", ":BufferLineCycleNext<cr>", opts)
    -- formatting keymappings
    map_set("n", "<Space>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
    ------------
    ---Insert---
    ------------

    -- Quickly back to normal mode
    map_set("i", "<leader><Space>", "<ESC>", opts)

    ------------
    ---Visual---
    ------------

    -- Stay in indent mode
    map_set("v", "<Tab>", ">gv", opts)
    map_set("v", "<S-Tab>", "<gv", opts)
    -- Move text up and down
    map_set("v", "<A-j>", ":m .+1<CR>==", opts)
    map_set("v", "<A-k>", ":m .-2<CR>==", opts)
    map_set("v", "p", '"_dP', opts)



end

return {
    map_set()
}
