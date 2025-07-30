return {
    cmd = {
        "/root/.local/share/nvim/mason/bin/clangd",
        "--background-index",
        "--clang-tidy",
        "-j=4",
        "--header-insertion=never",
        "--completion-style=detailed",
        "--function-arg-placeholders=false",
    },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
}
