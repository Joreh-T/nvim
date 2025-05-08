return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        -- lazy = false,
        -- version = "v0.0.23",
        opts = {
            provider = "aihubmix",
            auto_suggestions_provider = "deepseek",
            vendors = {
                deepseek = {
                    __inherited_from = "openai",
                    api_key_name = "DEEPSEEK_API_KEY",
                    endpoint = "https://api.deepseek.com/v1",
                    model = "deepseek-coder",
                    timeout = 30000,
                    max_tokens = 8192,
                },
            },
            aihubmix = {
                model = "gemini-2.5-pro-preview-05-06",
                api_key_name = "AIHUBMIX_API_KEY",
            },
            windows = {
                ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
                position = "right",
                wrap = true, -- similar to vim.o.wrap
                width = 24, -- default % based on available width in vertical layout
                height = 100, -- default % based on available height in horizontal layout
                sidebar_header = {
                    enabled = true, -- true, false to enable/disable the header
                    align = "center", -- left, center, right for title
                    rounded = true,
                },
                input = {
                    prefix = "> ",
                    height = 8, -- Height of the input window in vertical layout
                },
                edit = {
                    border = "rounded",
                    start_insert = true, -- Start insert mode when opening the edit window
                },
                ask = {
                    floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                    border = "rounded",
                    start_insert = true, -- Start insert mode when opening the ask window
                    ---@alias AvanteInitialDiff "ours" | "theirs"
                    focus_on_apply = "ours", -- which diff to focus after applying
                },
            },
            behaviour = {
                --   auto_focus_sidebar = true,
                --   auto_suggestions = false, -- Experimental stage
                --   auto_suggestions_respect_ignore = false,
                --   auto_set_highlight_group = true,
                --   auto_set_keymaps = true,
                --   auto_apply_diff_after_generation = false,
                --   jump_result_buffer_on_finish = true,
                --   support_paste_from_clipboard = false,
                --   minimize_diff = true,
                enable_token_counting = false,
                enable_cursor_planning_mode = true,
                enable_claude_text_editor_tool_mode = true,
                --   use_cwd_as_project_root = false,
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = (function()
            local sysname = vim.loop.os_uname().sysname
            if sysname == "Windows_NT" then
                return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            else
                return "make"
            end
        end)(),
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
            -- {
            --   -- support for image pasting
            --   "HakonHarnes/img-clip.nvim",
            --   event = "VeryLazy",
            --   opts = {
            --     -- recommended settings
            --     default = {
            --       embed_image_as_base64 = false,
            --       prompt_for_file_name = false,
            --       drag_and_drop = {
            --         insert_mode = true,
            --       },
            --       -- required for Windows users
            --       use_absolute_path = true,
            --     },
            --   },
            -- },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
