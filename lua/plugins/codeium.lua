return {

  -- codeium cmp source
  {
    "nvim-cmp",
    dependencies = {
      -- codeium
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  {
    -- 如果启用了codeium则在lualine右下角显示相应符号
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      -- Check if 'codeium' is already loaded
      if pcall(require, "codeium") then
        -- Insert a new component (symbol) if codeium is found
        table.insert(opts.sections.lualine_x, 2, {
          -- function() return "󱠁" end,
          function()
            return "󱠀"
          end,
          color = { fg = "#e5c07b" },
          padding = { left = 1, right = 1 },
        })
      end
    end,
  },
}
