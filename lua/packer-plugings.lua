local fn = vim.fn
--local autocmd = vim.api.nvim_create_autocmd
--local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  -- clear = true,
-- })


-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- autocmd("BufWritePost", {
--   group = myAutoGroup,
--   -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   callback = function()
--     if fn.expand("<afile>") == "lua/packer-plugings.lua" then
--       vim.api.nvim_command("source lua/plugings.lua")
--       vim.api.nvim_command("PackerSync")
--     end
--   end,
-- })


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("没找到packer")
	return
end

-- Have packer use a popup window 悬浮窗显示
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- local packer = require("packer")

packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 插件列表...
		use({ "nvim-lua/plenary.nvim" })

		use("navarasu/onedark.nvim")

		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")

		-- telescope 模糊搜索
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		-- 查看系统环境变量
		use("LinArcX/telescope-env.nvim")
		-- 打开project
		use("ahmedkhalf/project.nvim")

		-- dashboard-nvim 启动界面
		use("glepnir/dashboard-nvim")

		-- treesitter 语法高亮
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		--------------------- LSP --------------------
		use("williamboman/nvim-lsp-installer")
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- ui 提示图标
		use("onsails/lspkind-nvim")
		use({ "glepnir/lspsaga.nvim" })
		-- use("tami5/lspsaga.nvim")
		use({ "lewis6991/gitsigns.nvim" })

		-- 代码格式化
		-- use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- luazh增强
		use("folke/lua-dev.nvim")

		-- 自动补全括号
		-- -- nvim-autopairs
		use("windwp/nvim-autopairs")

		-- 多行注释Comment
		use("numToStr/Comment.nvim") -- Automatically set up your configuration after cloning packer.nvim

		-- surround
		use("ur4ltz/surround.nvim")
		-- Put this at the end after all plugins
		-- if PACKER_BOOTSTRAP then
		-- 	require("packer").sync()
		-- end
		--
	end
})




-- 每次保存 plugins.lua 自动安装插件
--pcall(
--  vim.cmd,
--  [[
--    augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--    augroup end
--  ]]
--)
