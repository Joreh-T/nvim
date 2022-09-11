local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	on_init = function(new_client, _)
      --new_client.offset_encoding = 'utf-8'
    end,
    debug = false,
	sources = {
		--formatting.clang_format,
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- frontend
		formatting.prettier.with({ -- 只比默认配置少了 markdown
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			prefer_local = "node_modules/.bin",
		}),
		-- formatting.fixjson,
		-- python
		formatting.black.with({ extra_args = { "--fast" } }),

		-----------------------------------------------------
		-- formatting.fixjson,
		-- Diagnostics  ---------------------
		diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		-- diagnostics.markdownlint,
		-- markdownlint-cli2
		-- diagnostics.markdownlint.with({
		--   prefer_local = "node_modules/.bin",
		--   command = "markdownlint-cli2",
		--   args = { "$FILENAME", "#node_modules" },
		-- }),
		--
		-- code actions ---------------------
		-- code_actions.gitsigns,
		code_actions.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "[#{s}] #{m}",
	-- 保存自动格式化
	on_attach = function(_) -- client
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
		-- if client.resolved_capabilities.document_formatting then
		--	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- end
	end,
})
