return {
    -- git blame
    {
        "APZelos/blamer.nvim",
        config = function()
            -- 检测操作系统
            local os_name = vim.loop.os_uname().sysname
            -- 如果不是 Windows，则启用 Blamer
            if os_name ~= "Windows_NT" then
                vim.g.blamer_enabled = true
                vim.g.blamer_delay = 500
            end
        end,
    },

    -- diffview
    {
        "sindrets/diffview.nvim",
        opts = function(_, opts)
            local actions = require("diffview.actions")

            -- 覆盖默认的快捷键映射
            opts.keymaps = {
                view = {
                    ["<leader>e"] = actions.toggle_files,
                    { desc = "Toggle the file panel" },
                },
                file_panel = {
                    ["<leader>e"] = actions.toggle_files,
                    { desc = "Toggle the file panel" },
                },
                file_history_panel = {
                    ["<leader>e"] = actions.toggle_files,
                    { desc = "Toggle the file panel" },
                },
            }

            -- 移除 `<leader>b` 键位（如果默认存在）
            opts.keymaps.view["<leader>b"] = nil
            opts.keymaps.file_panel["<leader>b"] = nil
            opts.keymaps.file_history_panel["<leader>b"] = nil

            return opts -- 返回修改后的配置
        end,
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            lazygit = {
                -- automatically configure lazygit to use the current colorscheme
                -- and integrate edit with the current neovim instance
                configure = true,
                -- extra configuration for lazygit that will be merged with the default
                -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
                -- you need to double quote it: `"\"test\""`
                config = {
                    os = { editPreset = "nvim-remote" },
                    gui = {
                        -- set to an empty string "" to disable icons
                        nerdFontsVersion = "3",
                    },
                },
                theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),

                -- Theme for lazygit
                theme = {
                    [241] = { fg = "Special" },
                    activeBorderColor = { fg = "Special", bold = true },
                    cherryPickedCommitBgColor = { fg = "Identifier" },
                    cherryPickedCommitFgColor = { fg = "Function" },
                    defaultFgColor = { fg = "Normal" },
                    inactiveBorderColor = { fg = "NormalFloat" },
                    optionsTextColor = { fg = "Function" },
                    searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                    selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
                    unstagedChangesColor = { fg = "DiagnosticError" },
                },

                win = {
                    style = "lazygit",
                },
            },
        },
    },
}
