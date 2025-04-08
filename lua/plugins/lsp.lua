return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function(_, opts)
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
          root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".clangd"), -- 根目录
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

      opts.codelens.enabled = false
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
      },

      checkbox = {
        enabled = false,
      },
    },
  },
}
