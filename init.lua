-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Get the Os Name in lowercase
_G.SYSTEM_NAME = (vim.loop.os_uname().sysname):lower()

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

local utils = require("config.utils")
if utils.is_windows() then
    vim.defer_fn(function()
        local shada_dir = vim.fn.stdpath("data") .. "/shada/"
        local tmp_files = vim.fn.glob(shada_dir .. "main.shada.tmp.*", true, true)
        for _, file in ipairs(tmp_files) do
            vim.fn.delete(file)
        end
    end, 5000) -- 延迟 n 秒执行，避免干扰启动流程
end
