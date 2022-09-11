vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	-- 在输入模式下也更新提示，设置为 true 也许会影响性能
	update_in_insert = true,
})
--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--local signs = { Error = "🤕", Warn = "😦", Info = "🤔", Hint = "😐" }
local signs = { Error = "😡", Warn = "😥", Info = "😤", Hint = "🤔" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspkind
local lspkind = require("lspkind")
lspkind.init({
	-- default: true
	-- with_text = true,
	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",
	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",
	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})

local lspsaga = require("lspsaga")
lspsaga.init_lsp_saga({
	-- your configuration
	-- -- Options with default value
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "rounded",
	--the range of 0 for fully opaque window (disabled) to 100 for fully
	--transparent background. Values between 0-30 are typically most useful.
	saga_winblend = 0,
	-- when cursor in saga window you config these to move
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- Error, Warn, Info, Hint
	-- use emoji like
	-- { "🙀", "😿", "😾", "😺" }
	-- or
	-- { "😡", "😥", "😤", "😐" }
	-- and diagnostic_header can be a function type
	-- must return a string and when diagnostic_header
	-- is function type it will have a param `entry`
	-- entry is a table type has these filed
	-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
	diagnostic_header = { "😡", "😥", "😤", "🤔" },

	-- use emoji lightbulb in default
	code_action_icon = "💡",
	-- set antoher colorscheme in preview window
	-- finder_preview_hl_ns = 0,
	-- if true can press number to execute the codeaction in codeaction window
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
	},
	code_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	definition_action_keys = {
		edit = "<C-c>o",
		vsplit = "<C-c>v",
		split = "<C-c>i",
		tabe = "<C-c>t",
		quit = "<Esc>",
	},
	rename_action_quit = "<Esc>",
	rename_in_select = true,
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = " ",
		show_file = true,
		click_support = false,
	},
	-- show outline
	show_outline = {
		win_position = "right",
		--set special filetype win that outline window split.like NvimTree neotree
		-- defx, db_ui
		win_with = "",
		win_width = 30,
		auto_enter = true,
		auto_preview = true,
		virt_text = "┃",
		jump_key = "o",
		-- auto refresh when change buffer
		auto_refresh = true,
	},
	-- custom lsp kind
	-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
	custom_kind = {},
	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = { metals = { "sbt", "scala" } }
	server_filetype_map = {},
})

-- lspsaga.setup { -- defaults ...
--   debug = false,
--   use_saga_diagnostic_sign = true,
--   -- diagnostic sign
--   error_sign = "😡",
--   warn_sign = "😥",
--   hint_sign = "😤",
--   infor_sign = "🤔",
--   diagnostic_header_icon = "   ",
--   -- code action title icon
--   code_action_icon = "💡",
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 40,
--     virtual_text = true,
--   },
--   finder_definition_icon = "  ",
--   finder_reference_icon = "諭 ",
--   max_preview_lines = 1000,
--   finder_action_keys = {
--     -- open = "o",
--     open = "<CR>",
--     vsplit = "s",
--     split = "i",
--     -- quit = "q",
--     quit = "<ESC>",
--     scroll_down = "<C-f>",
--     scroll_up = "<C-b>",
--   },
--   code_action_keys = {
--     -- quit = "q",
--     quit = "<ESC>",
--     exec = "<CR>",
--   },
--   rename_action_keys = {
--     -- quit = "<C-c>",
--     quit = "<ESC>",
--     exec = "<CR>",
--   },
--   definition_preview_icon = "  ",
--   border_style = "single",
--   rename_prompt_prefix = "➤",
--   rename_output_qflist = {
--     enable = false,
--     auto_open_qflist = false,
--   },
--   server_filetype_map = {},
--   diagnostic_prefix_format = "%d. ",
--   diagnostic_message_format = "%m %c",
--   highlight_prefix = false,
-- }

local M = {}
-- 为 cmp.lua 提供参数格式
M.formatting = {
	format = lspkind.cmp_format({
		mode = "symbol_text",
		--mode = 'symbol', -- show only symbol annotations

		maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		-- The function below will be called before any actual modifications from lspkind
		-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		before = function(entry, vim_item)
			-- Source 显示提示来源
			vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
			return vim_item
		end,
	}),
}

return M
