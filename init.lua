-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local icons = require("lazyvim.config").icons

icons.diagnostics.Error = " "
icons.diagnostics.Warn = " "
icons.diagnostics.Info = " "
icons.diagnostics.Hint = "󰌵 "
