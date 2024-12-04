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
        },
        sections = {
          {
            section = "header",
            height = 8,
            padding = 3,
          },
          {
            pane = 2,
            section = "terminal",
            cmd = "pokemon-colorscripts -n pikachu --no-title; sleep .2", -- https://github.com/gricardo87/pokemon-colorscripts.git
            random = 10,
            padding = 0,
            indent = 2,
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
}
