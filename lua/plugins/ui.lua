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
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
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
            text = "", -- Set the text to empty
            highlight = "Directory",
            text_align = "left",
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

    ---@module 'edgy'
    ---@param opts Edgy.Config
    opts = function(_, opts)
      opts.wo = vim.tbl_deep_extend("force", opts.wo or {}, {
        winhighlight = "WinBar:EdgyWinBarNC,WinBarNC:EdgyWinBarNC",
      })
      opts.animate = vim.tbl_deep_extend("force", opts.animate or {}, {
        enabled = false, -- 禁用动画效果
      })
      opts.icons = {
        closed = " ",
        open = " ",
      }
      opts.keys = {
        -- increase width
        ["<c-Right>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<c-Left>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<c-Up>"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<c-Down>"] = function(win)
          win:resize("height", -2)
        end,
      }

      -- snacks_terminal configuration
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "snacks_terminal",
          size = { height = 0.2 },

          title = function()
            local term_title = vim.b.term_title or "Terminal"
            term_title = string.match(term_title, "[^/\\]+$") or term_title
            local max_length = 20 -- 设置最大长度
            if #term_title > max_length then
              term_title = string.sub(term_title, 1, max_length) .. "…" -- 截断并添加省略号
            end
            local open_time = vim.b.open_time or os.date("%H:%M:%S")
            vim.b.open_time = open_time -- 确保时间在 terminal 打开后固定
            return string.format("%s (Opened at %s)", term_title, open_time)
          end,
          -- title = "%{:pos}: %{b:term_title}",
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end

      -- if LazyVim.has("neo-tree.nvim") then
      --   -- opts["left"] = {  // 直接写会覆盖掉上面的内容
      --   -- Neo-tree filesystem always takes half the screen height
      --   opts["left"] = opts["left"] or {}
      --   vim.list_extend(opts["left"], {
      --     {
      --       title = "FileTree",
      --       ft = "neo-tree",
      --       filter = function(buf)
      --         return vim.b[buf].neo_tree_source == "filesystem"
      --       end,
      --       size = { height = 0.3 },
      --     },
      --     -- {
      --     --   title = "Git Status",
      --     --   ft = "neo-tree",
      --     --   filter = function(buf)
      --     --     return vim.b[buf].neo_tree_source == "git_status"
      --     --   end,
      --     --   pinned = true,
      --     --   collapsed = true, -- show window as closed/collapsed on start
      --     --   open = "Neotree position=right git_status",
      --     -- },
      --     -- {
      --     --   title = "Buffers",
      --     --   ft = "neo-tree",
      --     --   filter = function(buf)
      --     --     return vim.b[buf].neo_tree_source == "buffers"
      --     --   end,
      --     --   pinned = true,
      --     --   collapsed = true, -- show window as closed/collapsed on start
      --     --   open = "Neotree position=top buffers",
      --     -- },
      --     -- {
      --     --   title = function()
      --     --     local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
      --     --     return vim.fn.fnamemodify(buf_name, ":t")
      --     --   end,
      --     --   ft = "Outline",
      --     --   pinned = true,
      --     --   open = "SymbolsOutlineOpen",
      --     -- },
      --   })
      -- end
    end,
  },
}
