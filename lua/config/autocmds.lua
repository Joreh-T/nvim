-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local utils = require("config.utils")
-- Disable spelling check.
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Treat "*.jsp" files as HTML files.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.jsp" },
    callback = function()
        vim.bo.filetype = "html"
    end,
})

------------------ Neo-tree ------------------

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "BufRead"}, {
    pattern = "*",
    callback = utils.refresh_neo_tree_if_git,
    desc = "Auto refresh neo-tree on focus or buffer enter",
})

------------------End Of Neo-tree ------------------

------------------ Avante------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = "Avante",
    callback = function()
        if vim.g.colors_name ~= "sonokai" then
            return
        end

        vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { link = "Normal" })
        vim.api.nvim_set_hl(0, "AvanteSidebarWinSeparator", { link = "WinSeparator" })

        local normal_bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0)
        vim.api.nvim_set_hl(0, "AvanteSidebarWinHorizontalSeparator", { bg = normal_bg })
        vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { fg = "#353b45", bg = normal_bg })
    end,
})

local group = vim.api.nvim_create_augroup("AvanteAutoToggle", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    callback = function(args)
        local ft = vim.bo[args.buf].filetype

        if utils.is_avante_monitor_ft(ft) then
            vim.schedule(function()
                utils.debounce_toggle_avante(ft)
            end)
        end
    end,
})
------------------ End Of Avante------------------

------------------ Neovide ------------------
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        if vim.fn.mode() == "i" then
            vim.g.neovide_cursor_animation_length = 0.0
            vim.g.neovide_cursor_vfx_mode = "" -- 粒子效果模式
            vim.g.neovide_cursor_trail_size = 0 -- 拖尾长度
        else
            vim.g.neovide_cursor_animation_length = 0.15 -- 光标移动动画速度
            vim.g.neovide_cursor_vfx_mode = "pixiedust" -- 粒子效果模式
            vim.g.neovide_cursor_trail_size = 0.2 -- 拖尾长度
        end
    end,
})

------------------ End Of Neovide ------------------

------------------ Outline ------------------
vim.api.nvim_create_autocmd({ "WinEnter", "CursorMoved", "CursorMovedI" }, {
    pattern = "*",
    callback = function(args)
        if vim.bo.filetype == "Outline" and utils.has_avante_window() then
            vim.schedule(function()
                vim.cmd("normal! 0")
            end)
            if vim.fn.mode() ~= "n" then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
        end
    end,
})
------------------ End Of Outline ------------------
