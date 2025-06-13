local utils = require("config.utils")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                version = utils.is_nvim_le(0, 10) and "v1.32.0" or nil,
                config = function() end,
            },
            opts = function(_, opts)
                opts.ensure_installed = {
                    "clangd",
                    "bash-language-server",
                    "gitui",
                    "html-lsp",
                    "json-lsp",
                    "lua-language-server",
                    "markdown-toc",
                    "markdownlint-cli2",
                    "marksman",
                    "pyright",
                    "shellcheck",
                    "shfmt",
                    "stylua",
                    "typescript-language-server",
                    "yaml-language-server",
                }
            end,
        },
        opts = function(_, opts)
            opts.servers = opts.servers or {}
            opts.servers.harper_ls = {
                autostart = false,
                filetypes = {},
            }
            opts.servers.clangd = vim.tbl_deep_extend("force", opts.servers.clangd or {}, {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "-j=4",
                    "--header-insertion=never",
                    "--completion-style=detailed",
                    "--function-arg-placeholders=false",
                },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".clangd"),
                settings = {
                    clangd = {
                        usePlaceholders = true,
                        semanticHighlighting = true,
                        clangdFileStatus = true,
                        enableConfig = true,
                        index = {
                            enable = true,
                        },
                    },
                },
            })
            opts.diagnostics.virtual_text = false
            if vim.g.neovide then
                opts.diagnostics.signs = {
                    text = {
                        -- [vim.diagnostic.severity.ERROR] = "😡",
                        -- [vim.diagnostic.severity.WARN] = "😟",
                        -- [vim.diagnostic.severity.INFO] = "🙂",
                        -- [vim.diagnostic.severity.HINT] = "🤔",

                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "󰌵",
                    },
                }
            else
                opts.diagnostics.signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "😡",
                        [vim.diagnostic.severity.WARN] = "😟",
                        [vim.diagnostic.severity.INFO] = "🙂",
                        [vim.diagnostic.severity.HINT] = "🤔",

                        -- [vim.diagnostic.severity.ERROR] = '',
                        -- [vim.diagnostic.severity.WARN] = '',
                        -- [vim.diagnostic.severity.INFO] = '',
                        -- [vim.diagnostic.severity.HINT] = '󰌵',
                    },
                }
            end

            -- opts.codelens.enabled = true
            return opts
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            code = {
                sign = true,
                width = "block",
                right_pad = 1,
            },
            heading = {
                enabled = true,
                render_modes = false,
                width = "full",
                right_pad = 5,
                -- left_pad = 5,
                border = false,
                border_virtual = true,
                border_prefix = true,
                -- Used above heading for border.
                above = "",
                -- Used below heading for border.
                below = "󰽿",
                -- atx = false,
                backgrounds = {
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH2Bg",
                },
                foregrounds = {
                    "RenderMarkdownH1",
                    "RenderMarkdownH2",
                    "RenderMarkdownH3",
                    "RenderMarkdownH4",
                    "RenderMarkdownH5",
                    "RenderMarkdownH6",
                },
            },

            checkbox = {
                enabled = false,
            },
        },
    },
}
