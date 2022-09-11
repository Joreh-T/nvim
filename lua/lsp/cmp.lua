--local cmp = require("cmp")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

--local snip_status_ok, luasnip = pcall(require, "luasnip")
--if not snip_status_ok then
--  return
--end

-- require("luasnip/loaders/from_vscode").lazy_load()

--   פּ ﯟ   some other good icons
--local kind_icons = {
--	Text = "",
--	Method = "m",
--	Function = "",
--	Constructor = "",
--	Field = "",
--	Variable = "",
--	Class = "",
--	Interface = "",
--	Module = "",
--	Property = "",
--	Unit = "",
--	Value = "",
--	Enum = "",
--	Keyword = "",
--	Snippet = "",
--	Color = "",
--	File = "",
--	Reference = "",
--	Folder = "",
--	EnumMember = "",
--	Constant = "",
--	Struct = "",
--	Event = "",
--	Operator = "",
--	TypeParameter = "",
--}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
--	formatting = {
--		fields = { "kind", "abbr", "menu" },
--		format = function(entry, vim_item)
--			-- Kind icons
--			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			--vim_item.menu = ({
			--nvim_lsp = "[LSP]",
			--vsnip = "[Snippet]",
			--buffer = "[Buffer]",
			--path = "[Path]",
			--})[entry.source.name]

--			vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
--			return vim_item
--		end,
--	},

	-- 补全源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- For vsnip users.
		{ name = "vsnip" },

		-- For luasnip users.
		-- { name = 'luasnip' },

		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
	}, { { name = "buffer" }, { name = "path" } }),

	-- 快捷键设置
	mapping = require("keybindings").cmp(cmp),
	-- 使用lspkind-nvim显示类型图标 (新增)
	formatting = require("lsp.ui").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
