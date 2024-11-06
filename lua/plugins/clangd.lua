return {
  {
    "neovim/nvim-lspconfig", -- 引入 nvim-lspconfig 插件
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
    },
  },
}
