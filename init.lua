--[[
    nvim initialization
    neovim指南：https://github.com/glepnir/nvim-lua-guide-zh
]]


-- load packer
require('init_packer')
-- enhence
require('user.enhance')
-- tools
require('user.tools')
-- colorthemes
require('user.colors')
-- mason-lsp
require('user.lsp')
-- cmp
require('user.cmp')
-- treesitter
require('user.treesitter')
