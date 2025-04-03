return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      -- 在 opts 中配置 clangd
      servers = {
        clangd = {
          -- 运行命令
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "-j=4",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders=false",
          },
          filetypes = { "c", "cpp", "objc", "objcpp" }, -- 支持的文件类型
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
          on_attach = function(client, bufnr) end,
        },
      },

      -- 诊断配置
      diagnostics = {
        virtual_text = false, -- 禁用虚拟文本
        underline = true,
        update_in_insert = false, -- 插入模式下不进行诊断
        severity_sort = true, -- 诊断信息按严重性排序。通常，错误会排在最前面，警告排在其次，信息和提示排在最后。
        -- signs = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      },

      -- 禁用 CodeLens
      codelens = {
        enabled = false, -- 禁用 CodeLens
      },
    },
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
        width = "block",
        right_pad = 5,
        -- left_pad = 5,
        border = true,
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
