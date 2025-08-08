local utils = require("config.utils")

return {
    -- Auto switch input method depends on Nvim's edit mode.
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
    },

    {
        -- Search and replace keywords
        "MagicDuck/grug-far.nvim",
        version = utils.is_nvim_le(0, 10, 4) and "v1.6.3" or nil,

        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            local width = utils.get_global_col_scaled(0.35)
            require("grug-far").setup({
                windowCreationCommand = string.format("%d vsplit", width),
            })
        end,
    },

    {
        -- Fuzzy finder which is used by fzf-lua
        "junegunn/fzf",
        build = function()
            if vim.fn.executable("fzf") == 0 then
                return "./install --bin"
            else
                return nil -- Don't inastall if fzf is already installed
            end
        end,
    },

    {
        -- Fuzzy finder for nvim. Replaced telescope.nvim
        "ibhagwan/fzf-lua",
        keys = {
            { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
            { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
            { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },

            { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
            { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
            -- { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
            { "<leader>fR", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
            { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
            { "<leader><leader>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
        },

        opts = function(_, opts)
            opts.winopts = {
                width = 0.8,
                height = 0.85,
                row = 0.5,
                col = 0.5,
                preview = {
                    layout = "vertical",
                    vertical = "down:55%", -- The height position of the preview window in the layout & ratio
                    scrollchars = { "┃", "" },
                },
                on_create = function()
                    -- <C-\><C-n>: Switch from terminal mode to normal mode;
                    -- "+p: Paste from the system clipboard (+ register);
                    -- i: Return to insert mode (fzf is interactive input);
                    -- buffer = true: Only effective for fzf's temporary buffer, does not affect global settings;
                    -- silent = true: Avoid command-line prompts;
                    -- noremap = true: Avoid recursive mappings
                    --
                    -- '+' register
                    vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+pi]], { noremap = true, silent = true, buffer = true })
                    -- '*' register
                    -- vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"*pi]], { noremap = true, silent = true, buffer = true })
                end,
            }
        end,
    },
    -- {
    --   -- Cursor Animation
    --   "sphamba/smear-cursor.nvim",
    --   opts = {
    --     -- cursor_color = "#ff8800",
    --     stiffness = 0.5,
    --     trailing_stiffness = 0.4,
    --     -- trailing_exponent = 1,
    --     -- distance_stop_animating = 0.5,
    --     -- gamma = 1,
    --     --  -- Smear cursor when switching buffers or windows.
    --     smear_between_buffers = true,
    --
    --     -- Smear cursor when moving within line or to neighbor lines.
    --     smear_between_neighbor_lines = false,
    --
    --     -- Draw the smear in buffer space instead of screen space when scrolling
    --     scroll_buffer_space = true,
    --
    --     -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    --     -- Smears will blend better on all backgrounds.
    --     legacy_computing_symbols_support = false,
    --   },
    -- },
    {
        -- Multiple cursors support
        "brenton-leighton/multiple-cursors.nvim",
        version = "*", -- Use the latest tagged version
        opts = {}, -- This causes the plugin setup function to be called
        keys = {
            -- { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
            -- { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

            { "<A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
            {
                "<A-Down>",
                "<Cmd>MultipleCursorsAddDown<CR>",
                mode = { "n", "i", "x" },
                desc = "Add cursor and move down",
            },

            {
                "<A-LeftMouse>",
                "<Cmd>MultipleCursorsMouseAddDelete<CR>",
                mode = { "n", "i" },
                desc = "Add or remove cursor",
            },
            { "<Leader>a", false },
            { "<Leader>A", false },

            -- {
            --   "<Leader>a",
            --   "<Cmd>MultipleCursorsAddMatches<CR>",
            --   mode = { "n", "x" },
            --   desc = "Add cursors to all the cword",
            -- },
            -- {
            --   "<Leader>A",
            --   "<Cmd>MultipleCursorsAddMatchesV<CR>",
            --   mode = { "n", "x" },
            --   desc = "Add cursors to cword in previous area",
            -- },

            {
                "<A-j>",
                "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
                mode = { "n", "x" },
                desc = "Add cursor and jump to next cword",
            },
            -- { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

            -- { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
        },
    },

    {
        -- Replaces the UI for messages, cmdline and the popupmenu.
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.messages = {
                view_search = false, -- disable  virtual text when use "/" or "?"
            }
            local cmdline_pos = {
                row = utils.get_global_row_scaled(0.2),
                col = "50%",
            }
            opts.views = {
                -- position of cmdline
                cmdline_popup = {
                    position = {
                        row = cmdline_pos.row,
                        col = cmdline_pos.col,
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                -- position of cmdline's completion
                cmdline_popupmenu = {
                    position = {
                        row = cmdline_pos.row + 3,
                    },
                },
            }
        end,
    },

    {
        -- Display hexadecimal colors in the editor
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    -- {
    --     "lewis6991/hover.nvim",
    --     pin = true,
    --     config = function()
    --         require("hover").setup({
    --             init = function()
    --                 -- Require providers
    --                 require("hover.providers.lsp")
    --                 -- require('hover.providers.gh')
    --                 -- require('hover.providers.gh_user')
    --                 -- require('hover.providers.jira')
    --                 -- require('hover.providers.dap')
    --                 -- require('hover.providers.fold_preview')
    --                 require("hover.providers.diagnostic")
    --                 -- require('hover.providers.man')
    --                 -- require('hover.providers.dictionary')
    --             end,
    --             preview_opts = {
    --                 border = "none",
    --             },
    --             -- Whether the contents of a currently open hover window should be moved
    --             -- to a :h preview-window when pressing the hover keymap.
    --             preview_window = false,
    --             title = false,
    --             mouse_providers = {
    --                 "LSP",
    --             },
    --             mouse_delay = 1000,
    --         })
    --
    --         -- Setup keymaps
    --         -- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    --         -- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    --         -- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
    --         -- vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
    --         --
    --         -- Mouse support
    --         vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
    --         vim.o.mousemoveevent = true
    --     end,
    -- },

    {
        -- Save and restore sessions
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {
            dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
            -- minimum number of file buffers that need to be open to save
            -- Set to 0 to always save
            need = 1,
            branch = true, -- use git branch to save session
        },
        keys = {
            {
                "<leader>qS",
                function()
                    require("persistence").load()
                end,
                desc = "Restore Session",
            },
            {
                "<leader>qs",
                function()
                    require("persistence").select()
                end,
                desc = "Select Session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "Restore Last Session",
            },
            {
                "<leader>qd",
                function()
                    require("persistence").stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
    },
    {
        "Joreh-T/caseConverter.nvim",
        -- config = function()
        --     require("case_converter").setup({
        --         -- Optional configuration
        --     })
        -- end,
        -- defualt keymaps:
        --  `<Leader>tt` - Convert between snake_case and camelCase/PascalCase
        --  `<Leader>tc` - Cycle through cases: snake_case → camelCase → PascalCase → snake_case
        --  `<Leader>ts` - Convert to snake_case
        --  `<Leader>tm` - Convert to camelCase
        --  `<Leader>tp` - Convert to PascalCase
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "FIX_N" }, -- a set of other keywords that all map to this FIX keywords
                },
                TODO = { icon = " ", color = "info", alt = { "TODO_N", "TODO" } },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "WARN_N", "WARN" } },
                PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO", "INFO_N", "HINT_N", "HINT" } },
                -- TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED", "TEST_Q" } },
            },
            gui_style = {
                fg = "NONE", -- The gui style to use for the fg highlight group.
                bg = "BOLD", -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            highlight = {
                multiline = true, -- enable multiline todo comments
                multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
                before = "", -- "fg" or "bg" or empty
                keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
                after = "fg", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {}, -- list of file types to exclude highlighting
            },
            -- colors = {
            --   error = { "Red" },
            --   warning = { "Yellow" },
            --   info = { "Orange" },
            --   hint = { "Green" },
            --   default = { "Purple" },
            --   test = { "Blue" }
            -- },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                pattern = [[\b(KEYWORDS)_N\b]], -- ripgrep regex
            },
        },
    },

    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                {
                    mode = { "v" },
                    { "<leader>t", group = "Text case switch", icon = { icon = "" } },
                },
                {
                    mode = { "n", "v" },
                    { "<leader>p", group = "File path", icon = { icon = "󰴠", color = "cyan" } },
                    {
                        "<leader>pn",
                        ':let @+ = expand("%:t")<CR>',
                        mode = "n",
                        desc = "Copy filename",
                    },
                    {
                        "<leader>pc",
                        ':let @+ = fnamemodify(expand("%:p"), ":." )<CR>',
                        mode = "n",
                        desc = "Copy relative path",
                    },
                    {
                        "<leader>pC",
                        ':let @+ = expand("%:p")<CR>',
                        mode = "n",
                        desc = "Copy absolute path",
                    },
                    {
                        "<leader>ps",
                        ':echo fnamemodify(expand("%:p"), ":." )<CR>',
                        mode = "n",
                        desc = "Show relative path",
                    },
                    {
                        "<leader>pS",
                        ':echo expand("%:p")<CR>',
                        mode = "n",
                        desc = "Show absolute path",
                    },
                },
                { "<leader>m", group = "Bookmarks", icon = { icon = "", color = "yellow" } },
                { "<leader>i", group = "Get Icons", icon = { icon = "", color = "green" } },
                { "<leader>K", group = "Keyword Manual", icon = { icon = "󰷈", color = "" } },
                { "<leader>r", group = "Restart LSP", icon = { icon = "", color = "red" } },
                { "<leader>a", group = "Avante", icon = { icon = "󰆾", color = "yellow" } },
            },
        },
    },

    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "kevinhwang91/nvim-hlslens",
            {
                "lewis6991/gitsigns.nvim",
                commit = utils.is_nvim_le(0, 10) and "ee7e50dfbdf49e3acfa416fd3ad3abbdb658582c" or nil,
            },
        },
        config = function()
            require("scrollbar").setup({})
            require("gitsigns").setup({})
            require("scrollbar.handlers.gitsigns").setup()
            require("scrollbar.handlers.search").setup({
                -- override_lens = function() end,
            })
        end,
    },

    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            keymaps = {
                up_and_jump = "<up>",
                down_and_jump = "<down>",
            },
            outline_window = {
                position = "right",
                split_command = nil,
                width = 18,
                -- relative_width = true,
                wrap = false,
                focus_on_open = true,
                auto_close = false,
                auto_jump = false,
                show_numbers = false,
                show_relative_numbers = false,
                ---@type boolean|string?
                show_cursorline = true,
                hide_cursor = false,
                winhl = "",
                jump_highlight_duration = 400,
                center_on_jump = true,
            },
            preview_window = {
                -- Border option for floating preview window.
                -- Options include: single/double/rounded/solid/shadow or an array of border
                -- characters.
                -- See :help nvim_open_win() and search for "border" option.
                border = "rounded",
                -- Experimental feature that let's you edit the source content live
                -- in the preview window. Like VS Code's "peek editor".
                live = true,
            },
            symbols = {
                ---@type outline.FilterConfig?
                filter = nil,
                icon_source = nil,
                icon_fetcher = nil,
                icons = {
                    File = { icon = "󰈔", hl = "Identifier" },
                    Module = { icon = "󰆧", hl = "Include" },
                    Namespace = { icon = "󰅪", hl = "Include" },
                    Package = { icon = "󰏗", hl = "Include" },
                    Class = { icon = "𝓒", hl = "Type" },
                    Method = { icon = "", hl = "Function" },
                    Property = { icon = "", hl = "Identifier" },
                    Field = { icon = "󰆨", hl = "Identifier" },
                    Constructor = { icon = "", hl = "Special" },
                    Enum = { icon = "ℰ", hl = "Type" },
                    Interface = { icon = "󰜰", hl = "Type" },
                    Function = { icon = "ƒ", hl = "Function" },
                    Variable = { icon = "", hl = "Constant" },
                    Constant = { icon = "", hl = "Constant" },
                    String = { icon = "𝓐", hl = "String" },
                    Number = { icon = "#", hl = "Number" },
                    Boolean = { icon = "⊨", hl = "Boolean" },
                    Array = { icon = "󰅪", hl = "Constant" },
                    Object = { icon = "⦿", hl = "Type" },
                    Key = { icon = "🔐", hl = "Type" },
                    Null = { icon = "NULL", hl = "Type" },
                    EnumMember = { icon = "", hl = "Identifier" },
                    Struct = { icon = "𝓢", hl = "Structure" },
                    Event = { icon = "🗲", hl = "Type" },
                    Operator = { icon = "+", hl = "Identifier" },
                    TypeParameter = { icon = "𝙏", hl = "Identifier" },
                    Component = { icon = "󰅴", hl = "Function" },
                    Fragment = { icon = "󰅴", hl = "Constant" },
                    -- ccls
                    TypeAlias = { icon = " ", hl = "Type" },
                    Parameter = { icon = " ", hl = "Identifier" },
                    StaticMethod = { icon = " ", hl = "Function" },
                    Macro = { icon = " ", hl = "Function" },
                },
            },
        },
        config = function(_, opts)
            require("outline").setup(opts)

            -- Dynamic width adjustment logic
            vim.api.nvim_create_autocmd("VimResized", {
                callback = function()
                    local outline_buf = nil

                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.bo[buf].filetype == "Outline" then
                            outline_buf = buf
                            break
                        end
                    end

                    if outline_buf then
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            if vim.api.nvim_win_get_buf(win) == outline_buf then
                                local total_width = vim.o.columns
                                local new_width = math.max(18, math.floor(total_width * 0.18))
                                vim.api.nvim_win_set_width(win, new_width)
                            end
                        end
                    end
                end,
            })
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
            { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
        },
        opts = function(_, opts)
            -- vim.diagnostic.config({
            --   signs = {
            --     text = {
            --       [vim.diagnostic.severity.ERROR] = '',
            --       [vim.diagnostic.severity.WARN] = '',
            --       [vim.diagnostic.severity.INFO] = '',
            --       [vim.diagnostic.severity.HINT] = '󰌵',
            --     },
            --   }
            -- })
            opts.default_component_configs.diagnostics = {
                enabled = false,
            }
            opts.window = opts.window or {}
            opts.window = {
                position = "left",
                width = function()
                    local total_width = vim.o.columns
                    return math.max(33, math.floor(total_width * 0.20))
                end,
            }
            -- opts.window.width = function()
            --     local total_width = vim.o.columns
            --     return math.max(33, math.floor(total_width * 0.20))
            -- end
            opts.window.title = ""

            opts.filesystem = opts.filesystem or {}
            opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
            opts.filesystem.filtered_items.hide_dotfiles = false
            opts.filesystem.filtered_items.follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            }
            opts.filesystem.window = { title = "" }
            opts.default_component_configs = opts.default_component_configs or {}
            opts.default_component_configs.icon = {
                folder_closed = "",
                folder_open = "",
                provider = function(icon, node, state)
                    if node.type == "file" or node.type == "terminal" then
                        local success, web_devicons = pcall(require, "nvim-web-devicons")
                        local name = node.type == "terminal" and "terminal" or node.name
                        if success then
                            local devicon, hl = web_devicons.get_icon(name)
                            icon.text = devicon or icon.text
                            icon.highlight = hl or icon.highlight
                        end
                    end
                end,
            }
            opts.default_component_configs.modified = {
                symbol = "● ",
                highlight = "NeoTreeGitModified",
            }
            opts.default_component_configs.git_status = {
                symbols = {
                    added = "",
                    modified = "",
                    deleted = "󰗨",
                    renamed = "󰁕",
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            }
            return opts
        end,
    },

    {
        "crusj/bookmarks.nvim",
        branch = "main",
        dependencies = { "kyazdani42/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
        config = function()
            local mark_icon = ""
            if vim.g.neovide then
                mark_icon = "󰍎"
            else
                mark_icon = "🚥"
            end

            require("bookmarks").setup({
                vim.api.nvim_set_hl(0, "bookmarks_virt_text_hl", { fg = "#879FA7", bg = "#21242C" }),

                -- default keymap
                keymap = {
                    toggle = "<leader>mt", -- Toggle bookmarks(global keymap)
                    close = "q", -- close bookmarks (buf keymap)
                    add = "<leader>ma", -- Add bookmarks(global keymap)
                    add_global = "<leader>mA", -- Add global bookmarks(global keymap), global bookmarks will appear in all projects. Identified with the symbol '󰯾'
                    jump = "<CR>", -- Jump from bookmarks(buf keymap)
                    delete = "dd", -- Delete bookmarks(buf keymap)
                    order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
                    delete_on_virt = "<leader>md", -- Delete bookmark at virt text line(global keymap)
                    show_desc = "<leader>ms", -- show bookmark desc(global keymap)
                    focus_tags = "<c-j>", -- focus tags window
                    focus_bookmarks = "<c-k>", -- focus bookmarks window
                    toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
                },
                width = 0.8, -- Bookmarks window width:  (0, 1]
                height = 0.7, -- Bookmarks window height: (0, 1]
                preview_ratio = 0.42, -- Bookmarks preview window ratio (0, 1]
                tags_ratio = 0.07, -- Bookmarks tags window ratio
                fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

                virt_text = "", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.

                sign_icon = mark_icon, -- if it is not empty, show icon in signColumn.

                virt_pattern = {
                    "*.go",
                    "*.lua",
                    "*.sh",
                    "*.php",
                    "*.rs",
                    "*.c",
                    "*.cpp",
                    "*.h",
                    "*.hpp",
                    "*.py",
                    "*.xml",
                    "*.yaml",
                    "*.xml",
                    "*.html",
                }, -- Show virt text only on matched pattern
                virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
                border_style = "rounded", -- 可选："single", "double", "rounded"
                hl = {
                    -- border = "CustomBorder", -- 使用自定义高亮组设置边框颜色
                    cursorline = "guibg=Gray guifg=White", -- 游标行高亮
                },
                datetime_format = "%Y.%m.%d %H:%M", -- os.date
                -- •%Y: Four-digit year
                -- •%m: Two-digit month (01 to 12)
                -- •%d: Two-digit day (01 to 31)
                -- •%H: Hour in 24-hour format (00 to 23)
                -- •%I: Hour in 12-hour format (01 to 12)
                -- •%M: Two-digit minute (00 to 59)
                -- •%S: Two-digit second (00 to 59)
                -- •%p: AM/PM indicator
            })
            require("telescope").load_extension("bookmarks")
            -- vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>", { noremap = true, silent = true })
            --INFO_N: vim.api.nvim_set_hl(0, "CustomBorder", { fg = "#56b6c2"} )
        end,
    },

    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })

            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "<Leader>ip", "<cmd>IconPickerNormal<cr>", opts)
            vim.keymap.set("n", "<Leader>iy", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
            -- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
        end,
    },
}
