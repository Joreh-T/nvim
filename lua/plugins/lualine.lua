return {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        local icons = LazyVim.config.icons
        -- opts.options.component_separators =  { left = '|', right = '' }
        opts.options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            component_separators = {
                left = "%#WinBarNC#%*",
                right = "%#WinBarNC#%*",
            },
        }
        opts.sections.lualine_a = { "mode" }
        opts.sections.lualine_b = { "branch" }
        opts.sections.lualine_c = {
            LazyVim.lualine.root_dir(),
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path(), separator = "", padding = { left = 1, right = 0 } },
            {
                function()
                    return vim.bo.modified and "●" or " "
                end,
                color = function()
                    -- return vim.bo.modified and { fg = "#e5c07b" } or { fg = "#98c379" }
                    local group = vim.bo.modified and "NeoTreeGitModified" or "Green"
                    local hl = vim.api.nvim_get_hl(0, { name = group })
                    return { fg = hl.fg and string.format("#%06x", hl.fg) or "#e5c07b" }
                end,
                padding = { left = 1, right = 1 },
            },

            -- {
            --     function() return vim.bo.modified and "[+]" or "[-]" end,
            --     color = { fg = "#ff9e64" },
            --     padding = { left = 0, right = 1 },
            -- },
        }
        opts.sections.lualine_x = {
            Snacks.profiler.status(),
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            -- {
            --   require("lazy.status").updates,
            --   cond = require("lazy.status").has_updates,
            --   color = function() return { fg = Snacks.util.color("Special") } end,
            -- },
            {
                "diff",
                symbols = {
                    added = icons.git.added,
                    modified = icons.git.modified,
                    removed = icons.git.removed,
                },
                source = function()
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed,
                        }
                    end
                end,
            },
        }
        opts.sections.lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
        }
        opts.sections.lualine_z = {}

        if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
            local trouble = require("trouble")
            local symbols = trouble.statusline({
                mode = "symbols",
                groups = {},
                title = false,
                filter = { range = true },
                format = "{kind_icon}{symbol.name:Normal}",
                hl_group = "lualine_c_normal",
            })

            local get_clean = function()
                if not symbols or not symbols.has() then
                    return ""
                end
                local raw = symbols.get()
                return string.gsub(raw, "%s*$", "") -- 正则删除尾部空格
            end

            table.insert(opts.sections.lualine_c, {
                get_clean, -- 替换原有的 symbols.get
                cond = function()
                    return vim.b.trouble_lualine ~= false and symbols.has()
                end,
            })
        end
    end,
}
