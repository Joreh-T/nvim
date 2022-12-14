return {
	on_setup = function(server)
		server.setup({
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
			on_attach = function(client, bufnr)
                --client.resolved_capabilities.offset_encoding = 'utf8'
                -- 禁用格式化功能，交给专门插件插件处理
				client.resolved_capabilities.document_formatting = true
				client.resolved_capabilities.document_range_formatting = true
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				-- 绑定快捷键
				require("keybindings").mapLSP(buf_set_keymap)
			end,
		})
	end,
}
