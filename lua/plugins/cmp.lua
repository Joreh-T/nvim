-- if true then return {} end
-- return {
--
--   -- auto completion
--   {
--     "hrsh7th/nvim-cmp",
--     version = false, -- last release is way too old
--     event = "InsertEnter",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--     },
--     -- Not all LSP servers add brackets when completing a function.
--     -- To better deal with this, LazyVim adds a custom option to cmp,
--     -- that you can configure. For example:
--     --
--     -- ```lua
--     -- opts = {
--     --   auto_brackets = { "python" }
--     -- }
--     -- ```
--     opts = function()
--       vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--       local cmp = require("cmp")
--       local defaults = require("cmp.config.default")()
--       local auto_select = true
--       return {
--         auto_brackets = {}, -- configure any filetype to auto add brackets
--         completion = {
--           completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--         },
--         preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<Tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
--           ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
--           ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--           ["<C-CR>"] = function(fallback)
--             cmp.abort()
--             fallback()
--           end,
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "path" },
--         }, {
--           { name = "buffer" },
--         }),
--         formatting = {
--           format = function(entry, item)
--             local icons = LazyVim.config.icons.kinds
--             if icons[item.kind] then
--               item.kind = icons[item.kind] .. item.kind
--             end
--
--             local widths = {
--               abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
--               menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
--             }
--
--             for key, width in pairs(widths) do
--               if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
--                 item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
--               end
--             end
--
--             return item
--           end,
--         },
--         experimental = {
--           ghost_text = {
--             hl_group = "CmpGhostText",
--           },
--         },
--         sorting = defaults.sorting,
--          -- 添加边框
--         window = {
--         completion = cmp.config.window.bordered(), -- 为补全窗口添加边框
--         documentation = cmp.config.window.bordered(), -- 为文档窗口添加边框
--         },
--       }
--     end,
--     main = "lazyvim.util.cmp",
--   },
-- }
--

-- blink.cmp as a replacement for nvim-cmp (lazy.vim 14.x)
return {
  "saghen/blink.cmp",

  opts = {
    keymap = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
    },

  --   sources = {
  --     providers = {
  --       lsp = {
  --         name = "LSP",
  --         module = "blink.cmp.sources.lsp",
  --
  --         --- *All* providers have the following options available
  --         --- NOTE: All of these options may be functions to get dynamic behavior

  --         --- See the type definitions for more information.
  --         enabled = true, -- Whether or not to enable the provider
  --         async = false, -- Whether we should wait for the provider to return before showing the completions
  --         timeout_ms = 30000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
  --         transform_items = nil, -- Function to transform the items before they're returned
  --         should_show_items = true, -- Whether or not to show the items
  --         max_items = nil, -- Maximum number of items to display in the menu
  --         min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
  --         -- If this provider returns 0 items, it will fallback to these providers.
  --         -- If multiple providers falback to the same provider, all of the providers must return 0 items for it to fallback
  --         fallbacks = { "buffer" },
  --         score_offset = 0, -- Boost/penalize the score of the items
  --         override = nil, -- Override the source's functions
  --       },
  --     },
  --   },
  },
}
