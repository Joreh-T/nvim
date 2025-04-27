-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local icons = require("lazyvim.config").icons

if vim.g.neovide then
    icons.diagnostics.Error = " "
    icons.diagnostics.Warn = " "
    icons.diagnostics.Info = " "
    icons.diagnostics.Hint = "󰌵 "
else
    icons.diagnostics.Error = "😡 "
    icons.diagnostics.Warn = "😟 "
    icons.diagnostics.Info = "🙂 "
    icons.diagnostics.Hint = "🤔 "
end
