require("packer-plugings")
-- 启用主题
require("mycolorscheme")

-- 启用基础配置
-- require('basic')

-- 启用快捷键设置
require("keybindings")
-- 文件列表
require("packer-plugin-config.nvim-tree")

-- 下方状态栏
require("packer-plugin-config.bufferline")

require("packer-plugin-config.lualine")

-- 模糊搜索支持
require("packer-plugin-config.telescope")

-- nvim启动界面，打开project支持
require("packer-plugin-config.dashboard")
require("packer-plugin-config.project")

-- 语法高亮
require("packer-plugin-config.nvim-treesitter")

-- 内置LSP (新增)
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")
require("packer-plugin-config.indent-blankline")

-- 启用基础配置
require("basic")


-- require("packer-plugin-config.lspsaga")
require("packer-plugin-config.nvim-autopairs")
require("packer-plugin-config.comment")
require("packer-plugin-config.surround")


