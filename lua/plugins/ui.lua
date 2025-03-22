-- if true then return {} end
return {
  -- { "MunifTanjim/nui.nvim", lazy = true },

  --     {
  --       "nvimdev/dashboard-nvim",
  --       lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  --       opts = function()
  --         --   local logo = [[
  --         --               ▀████▀▄▄              ▄█
  --         --                 █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█
  --         --         ▄        █          ▀▀▀▀▄  ▄▀
  --         --        ▄▀ ▀▄      ▀▄              ▀▄▀
  --         --       ▄▀    █     █▀   ▄█▀▄      ▄█
  --         --       ▀▄     ▀▄  █     ▀██▀     ██▄█
  --         --        ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █
  --         --         █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀
  --         --        █   █  █      ▄▄           ▄▀
  --         --       ]]
  --         --     local logo = [[
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠋⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈⠉⠉⠙⠛⠛⠻⢿⣿⡿⠟⠁⠀⣀⣴⣿⣿⣿⣿⣿⠟
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⣉⣡⠀⣠⣴⣶⣶⣦⠄⣀⡀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⡿⢃⣾
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⣾⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣾⡟⢡⣾⣿⣿⣿⡿⢋⣴⣿⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⢡⣾⣿
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⡟⣰⣿⣿⣿⣿⠏⣰⣿⣿⠟⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢚⣛⢿
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠸⣿⠟⢰⣿⣿⣿⣿⠃⣾⣿⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣾
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠻⠻⠃⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢉⣴⣿⣿⣿⣿⡇⠘⣿⣿⠋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿
  --         --     ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⠁⢀⣀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠟⠉⠉⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌
  --         --     ⣿⣿⣿⣿⣿⣿⡿⠁⣀⣤⡀⠀⠈⠻⢿⠀⣼⣿⣷⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⣿⣿⣿⠟⠛⠙⠃⠀⣿⣿⣿⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿
  --         --     ⣿⠟⠁⢀⣴⣶⣶⣾⣿⣿⣿⣿⣶⡐⢦⣄⠀⠀⠈⠛⢿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢀⣼⡿⢛⣩⣴⣶⣶⣶⣶⣶⣶⣭⣙⠻⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿
  --         --     ⠁⠀⣴⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣦⡙⠻⣶⣄⡀⠀⠈⠙⢿⣿⣷⣦⣤⣤⣴⣿⡏⣠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⣿⠋⣠⠔⠀⠀⠻⣿⣿⣿⣿⢉⡳⢦⣉⠛⢷⣤⣀⠀⠈⠙⠿⣿⣿⣿⣿⢸⣿⡄⠻⣿⣿⠟⡈⣿⣿⣿⣿⣿⢉⣿⣧⢹⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⡇⠠⡇⠀⠀⠀⠀⣿⣿⣿⣿⢸⣿⣷⣤⣙⠢⢌⡛⠷⣤⣄⠀⠈⠙⠿⣿⣿⣿⣿⣷⣦⣴⣾⣿⣤⣙⣛⣛⣥⣾⣿⣿⡌⣿⣿⣿⣷⣤⣀⣀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⣷⡀⠡⠀⠀⠀⣰⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣦⣌⡓⠤⣙⣿⣦⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⣿⣿⣶⣤⣴⣾⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣷⠀⣶⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⣿⣿⣿⠟⠻⣿⣿⡏⣉⣭⣭⡘⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢠⡀⠈⠙⠋⠉⠉⠉⠉⠛⠫⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⠛⣿⣿⣀⣀⣾⡿⢀⣿⣿⣿⢻⣷⣦⢈⡙⠻⢿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢸⣿⠀⣦⠀⠀⠶⣶⣦⣀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⢸⣿⣿⣦⣈⡛⠿⠟⣋⣤⣾⣿⣿⣿⣸⣿⣿⢸⡇⢰⡆⢈⡙⠻⢿⣿⣿⣿⠀⢿⡇⢸⡇⢸⣿⢠⣿⡇⣿⡆⢈⡙⠻⠧⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --         --     ⠀⠀⣝⠛⢿⣿⣿⣿⣿⣿⣿⠟⣁⠀⠀⢈⠛⠿⢸⣇⢸⡇⢸⡇⣶⣦⣌⡙⠻⢄⡀⠁⠘⠇⠘⣿⢸⣿⡇⣿⡇⢸⡛⠷⣦⣄⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  --                 -- ]]
  --                 local logo = [[
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⠙⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⣿⠹⣿⡟⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣰⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣏⣙⣢⣽⣷⣿⣷⣿⣿⣟⡼⢹⣿⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⡿⢻⡓⣄⢝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣁⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⢙⠿⠿⠿⠿⢛⣠
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⢃⢎⡇⣿⡌⣦⣉⠻⣿⣿⣿⣿⣿⣉⣬⣿⡿⠿⠿⠟⢛⣩⣥⣤⣶⣶⣾⣦⢱⣶⣘⢛⣛⣫
  -- ⣿⣿⣿⣿⣿⣿⣿⠇⣞⣾⡇⣿⡇⣿⣿⣷⣌⡙⢿⣿⣿⣿⡾⢿⣿⣿⣿⣿⣿⡏⣤⣨⣿⣿⣿⣧⣬⡙⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⡏⢸⣿⣿⣷⣼⣇⢸⣿⣿⣿⣿⣦⣌⠻⣿⡖⢻⢿⣿⣿⣿⣿⡇⠿⢻⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⠈⣿⣿⣿⣿⣿⣿⣷⡤⠙⠭⣾⣿⣿⣿⣿⣿⠧⣹⣿⣿⣿⣿⣿⠃⣼⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣷⡘⢿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⠟⣋⣤⣶⣶⣌⠒⢶⣬⡛⢧⣿⡿⣛⣭⣭⣧⣤⣾⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⣛⣛⣋⣴⣿⣿⣿⡿⣡⣾⣿⣿⣿⣿⣿⣷⣦⡙⢿⣆⢧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣍⠊⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣦⣙⠋⣰⡄⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⣿⣿⣿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢸⡿⢃⣤⣐⠻⢿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⠁⣼⢿⣆⠸⣿⣿⣿⣿⣿⠋⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⣠⣾⣿⣿⣿⣦⣽⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⠀⣧⣈⢁⣴⣿⣿⣿⣿⠏⣰⣿⡏⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⣿⣿⣿⣉⣴⠿⡟⣠⣿⢁⣾⡿⠃⣿⡿⠉⣿⡏⢩⣟⢉⣇⣸⣿⡿⠟⠛⠛⠿⣿⣿⣿
  -- ⣿⣿⣿⣿⣿⣿⣶⣤⣉⣉⣛⠉⣉⣡⣤⣶⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠘⣵⣾⣿⣿⣿⣶⡄⠹⣿
  -- ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣻⣿⣿⣿⣿⠟⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⣉⡉⢻⣿⣿⣿⡟⠀⣿
  -- ⣿⣿⣿⣿⣿⠟⣋⣥⣶⣿⣿⣿⣯⠩⣥⣶⣶⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⠻⠟⣃⣼⣿⣿⣿⡏⢸⣿
  -- ⣿⣿⠟⣋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿
  -- ⠟⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡅⢸⣿
  --         ]]
  --
  --         -- log 前 x 个换行，后n个换行
  --         logo = string.rep("\n", 1) .. logo .. "\n"
  --
  --         local opts = {
  --           theme = "doom",
  --           hide = {
  --             -- this is taken care of by lualine
  --             -- enabling this messes up the actual laststatus setting after loading a file
  --             statusline = false,
  --           },
  --           config = {
  --             header = vim.split(logo, "\n"),
  --           -- stylua: ignore
  --           center = {
  --             { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
  --             { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
  --             { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
  --             { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
  --             { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
  --             { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
  --             { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
  --             { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
  --             { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
  --           },
  --             footer = function()
  --               local stats = require("lazy").stats()
  --               local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --               return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  --             end,
  --           },
  --         }
  --
  --         -- 设置高亮颜色
  --         vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#9caa9d" })
  --         vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#85868b" })
  --         vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#6f7887" })
  --
  --         for _, button in ipairs(opts.config.center) do
  --           -- 使用 'nvim_set_hl' 设置按钮的颜色
  --           button.icon = vim.fn.expand("%#DashboardIcon#") .. button.icon
  --           button.desc = vim.fn.expand("%#DashboardDesc#") .. button.desc
  --           -- 调整描述长度
  --           button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  --           button.key = vim.fn.expand("%#DashboardKey#") .. button.key
  --           button.key_format = "[ %s ]"
  --         end
  --
  --         -- open dashboard after closing lazy
  --         if vim.o.filetype == "lazy" then
  --           vim.api.nvim_create_autocmd("WinClosed", {
  --             pattern = tostring(vim.api.nvim_get_current_win()),
  --             once = true,
  --             callback = function()
  --               vim.schedule(function()
  --                 vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
  --               end)
  --             end,
  --           })
  --         end
  --
  --         return opts
  --       end,
  --     },
  --   },
  --
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      -- 设置 rainbow-delimiters 插件的配置
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          --           header = [[
          -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

          header = [[
                                                                         
           ████ ██████           █████      ██                     
          ███████████             █████                             
          █████████ ███████████████████ ███   ███████████   
         █████████  ███    █████████████ █████ ██████████████   
        █████████ ██████████ █████████ █████ █████ ████ █████   
      ███████████ ███    ███ █████████ █████ █████ ████ █████  
     ██████  █████████████████████ ████ █████ █████ ████ ██████ 
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰛡 ", key = "p", desc = "Plugins", action = ":Lazy" },
            -- { icon = " ", key = "x", desc = "Extras", action = ":LazyExtras" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "header",
            height = 8,
            padding = 3,
          },
          -- 动态判断窗口宽度来决定是否添加终端面板
          {
            pane = 2,
            section = "terminal",
            enabled = function()
              -- 获取当前窗口的列数（宽度）
              local width = vim.o.columns

              -- 判断窗口宽度大于一定值时才显示这个面板
              return width >= 120
            end,
            cmd = "pokemon-colorscripts -n pikachu --no-title; sleep .2", -- 运行终端命令
            random = 10,
            padding = 0,
            indent = 6,
            height = 12,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = (function()
              -- 检查 'hub' 是否可用
              if vim.fn.executable("hub") == 1 then
                return "hub status --short --branch --renames"
              else
                return "git status --short --branch --renames"
              end
            end)(), -- 注意这里直接执行函数，将返回值作为结果
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          -- { section = "startup" },
        },
      },
      indent = {
        indent = {
          priority = 1,
          enabled = true, -- enable indent guides
          char = "│",
          only_scope = false, -- only show indent guides of the scope
          only_current = false, -- only show indent guides in the current window
          -- hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
          -- can be a list of hl groups to cycle through
          -- hl = {
          --     "SnacksIndent1",
          --     "SnacksIndent2",
          --     "SnacksIndent3",
          --     "SnacksIndent4",
          --     "SnacksIndent5",
          --     "SnacksIndent6",
          --     "SnacksIndent7",
          --     "SnacksIndent8",
          -- },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = "│",
          underline = false, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = {
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        },
      },
      styles = {
        split = {
          position = "bottom",
          height = math.floor(vim.o.lines * 0.21),
          -- width = 0.4,
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = " FileTree",
            highlight = "Green",
            text_align = "left",
          },
          {
            filetype = "snacks_layout_box",
          },
        },
      },
    },
  },

  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = function(_, opts)
      -- 插件加载顺序检查
      local edgy_idx = LazyVim.plugin.extra_idx("ui.edgy")
      local symbols_idx = LazyVim.plugin.extra_idx("editor.outline")
      if edgy_idx and edgy_idx > symbols_idx then
        LazyVim.warn(
          "The `edgy.nvim` extra must be **imported** before the `outline.nvim` extra to work properly.",
          { title = "LazyVim" }
        )
      end

      -- 基础配置
      local base_opts = {
        options = {
          left = { size = 25 },
          bottom = { size = 50 },
          right = { size = 25 },
          top = { size = 10 },
        },
        animate = {
          enabled = false,
          fps = 60, -- frames per second
          cps = 200, -- cells per second
          -- on_begin = function()
          --   vim.g.minianimate_disable = true
          -- end,
          -- on_end = function()
          --   vim.g.minianimate_disable = false
          -- end,
          -- Spinner for pinned views that are loading.
          -- if you have noice.nvim installed, you can use any spinner from it, like:
          -- spinner = require("noice.util.spinners").spinners.circleFull,
          -- spinner = {
          --   frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
          --   interval = 80,
          -- },
        },
        wo = {
          winbar = true,
          winhighlight = "WinBar:EdgyWinBarNC,WinBarNC:EdgyWinBarNC",
        },
        icons = {
          closed = "",
          open = "",
        },
        keys = {
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }

      -- 终端窗口配置模板
      local terminal_spec = function(pos)
        return {
          ft = "snacks_terminal",
          -- size = { height = math.floor(vim.o.lines * 0.35) },
          -- title = function()
          --   local term_title = vim.b.term_title or "Terminal"
          --   term_title = term_title:match("[^/\\]+$") or term_title
          --   term_title = #term_title > 20 and term_title:sub(1, 20) .. "…" or term_title
          --   local open_time = vim.b.open_time or os.date("%H:%M:%S")
          --   return ("%s (Opened at %s)"):format(term_title, open_time)
          -- end,
          filter = function(buf, win)
            return vim.bo[buf].filetype == "snacks_terminal"
              or (vim.w[win].snacks_win and vim.w[win].snacks_win.position == pos and not vim.w[win].trouble_preview)
          end,
        }
      end

      -- 文件树配置
      local neo_tree_spec = {
        title = "FileTree",
        ft = "neo-tree",
        wo = {
          winbar = false,
        },
        size = { width = math.max(base_opts.options.left.size, math.floor(vim.o.columns * 0.18)) },
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = false,
      }

      -- Outline 配置
      -- opts.right = opts.right or {}
      -- table.insert(opts.right, {
      --   title = "Outline",
      --   ft = "Outline",
      --   size = { width = math.max(base_opts.options.right.size, math.floor(vim.o.columns * 0.17)) },
      --   pinned = true,
      --   open = "Outline",
      -- })

      local outline_spec = {
        title = "Outline",
        ft = "Outline",
        size = { width = math.max(base_opts.options.right.size, math.floor(vim.o.columns * 0.17)), height = 0.4},
        -- pinned = true,
        -- open = "Outline",
      }

      local left = {}

      if LazyVim.has("neo-tree.nvim") then
        table.insert(left, neo_tree_spec)
      end

      if LazyVim.has("outline.nvim") then
        table.insert(left, outline_spec)
      end

      if vim.tbl_isempty(left) then
        left = nil
      end

      -- 合并配置
      return vim.tbl_deep_extend("force", opts or {}, {
        options = base_opts.options,
        animate = base_opts.animate,
        wo = base_opts.wo,
        icons = base_opts.icons,
        keys = base_opts.keys,
        left = left,
        positions = {
          top = { terminal_spec("top") },
          bottom = { terminal_spec("bottom") },
          left = { terminal_spec("left") },
          right = { terminal_spec("right") },
        },
      })
    end,
  },
}
