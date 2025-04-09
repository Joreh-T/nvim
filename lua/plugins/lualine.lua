return {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
        -- 直接覆盖 lualine_c 配置
      local icons = LazyVim.config.icons
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
            { LazyVim.lualine.pretty_path(), separator = "" },  -- 去除路径后的分隔符
            {
                function()
                    return vim.bo.modified and "[+]" or "[-]"
                end,
                color = function()
                    return vim.bo.modified and { fg = "#e5c07b" } or { fg = "#98c379" }
                end,
                padding = { left = 0, right = 1 },
            }


            -- {
            --     function() return vim.bo.modified and "[+]" or "[-]" end,
            --     color = { fg = "#ff9e64" },
            --     padding = { left = 0, right = 1 },
            -- },
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
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end
    end,

}
