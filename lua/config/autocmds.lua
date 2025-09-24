-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local utils = require("config.utils")
-- Disable spelling check.
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set expandtab = false when opening Makefile
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "mk" },
    callback = function()
        -- only affect the current buffer
        vim.bo.expandtab = false
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 0
    end,
})

-- Treat "*.jsp" files as HTML files.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.jsp" },
    callback = function()
        vim.bo.filetype = "html"
    end,
})

------------------ Neo-tree ------------------

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume" }, {
    pattern = "*",
    callback = utils.refresh_neo_tree_if_git,
    desc = "Auto refresh neo-tree when git status changed",
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
            vim.g.neovide_cursor_vfx_mode = "" -- Disable particle effects
            vim.g.neovide_cursor_trail_size = 0 -- Trail length
        else
            vim.g.neovide_cursor_animation_length = 0.15 -- Cursor movement animation speed
            vim.g.neovide_cursor_vfx_mode = "pixiedust" -- Particle effect mode
            vim.g.neovide_cursor_trail_size = 0.2 -- Trail length
        end
    end,
})

------------------ End Of Neovide ------------------

------------------ Outline ------------------
vim.api.nvim_create_autocmd({ "WinEnter", "VimResume" }, {
    pattern = "*",
    callback = function(args)
        if vim.bo.filetype == "Outline" and utils.has_avante_window() then
            -- vim.schedule(function()
            --     vim.cmd("normal! 0")
            -- end)
            vim.defer_fn(function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>0", true, false, true), "n", true)
            end, 350)
        end
    end,
})
------------------ End Of Outline ------------------
------------------ Welcome Buffer ------------------
-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     desc = "Joreh's Welcome Buffer",
--     once = true,
--     callback = function()
--         if not utils.has_yazi then
--             vim.defer_fn(function()
--                 utils.focus_largest_window()
--                 utils.set_welcome_buffer(2)
--                 if utils.is_plugin_loaded("neo-tree.nvim") then
--                     vim.cmd("Neotree")
--                 end
--             end, 100) -- make sure buffer-2 has been created
--         else
--             utils.set_welcome_buffer()
--         end
--     end,
-- })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "*",
    desc = "Joreh's Welcome Buffer",
    callback = function(args)
        local no_name_buf_id_neo_tree = 2
        local no_name_buf_id_yazi = 1
        if not utils.has_yazi() and no_name_buf_id_neo_tree == args.buf then
            vim.defer_fn(function()
                utils.focus_largest_window()
                utils.set_welcome_buffer(no_name_buf_id_neo_tree)
                if utils.is_plugin_loaded("neo-tree.nvim") then
                    vim.cmd("Neotree")
                end
                vim.api.nvim_del_autocmd(args.id)
            end, 100)
        elseif utils.has_yazi() and no_name_buf_id_yazi == args.buf then
            utils.set_welcome_buffer(no_name_buf_id_yazi)
            vim.api.nvim_del_autocmd(args.id)
        end
    end,
})
--------------- End of Welcome Buffer --------------

--------------- Auto update config --------------
vim.api.nvim_create_autocmd({ "VimEnter", "BufWinEnter" }, {
    pattern = "*",
    desc = "Auto update config from git repo once a day",
    callback = function(args)
        local config_path = vim.fn.stdpath("config")
        -- Use vim.fs.joinpath for cross-platform compatibility
        local today_file = vim.fs.joinpath(config_path, ".last_git_pull")
        local today = os.date("%Y-%m-%d")

        local last_pull_date = ""
        if vim.fn.filereadable(today_file) == 1 then
            local content = vim.fn.readfile(today_file)
            last_pull_date = content[1] or ""
        end

        -- Only check for updates once a day
        if last_pull_date == today then
            return
        end

        local stdout_lines = {}
        local stderr_lines = {}

        vim.fn.jobstart({ "git", "-C", config_path, "pull", "--ff-only" }, {
            on_stdout = function(_, data)
                for _, line in ipairs(data) do
                    if line ~= "" then
                        table.insert(stdout_lines, line)
                    end
                end
            end,
            on_stderr = function(_, data)
                for _, line in ipairs(data) do
                    if line ~= "" then
                        table.insert(stderr_lines, line)
                    end
                end
            end,
            on_exit = function(_, code)
                if code ~= 0 then
                    local msg = "Configuration updated failed, err：" .. code
                    if #stderr_lines > 0 then
                        local err_lines = {}
                        for i = 1, math.min(3, #stderr_lines) do
                            table.insert(err_lines, stderr_lines[i])
                        end
                        msg = msg .. "\n" .. table.concat(err_lines, "\n")
                    end
                    vim.notify(msg, vim.log.levels.ERROR, { title = "Git Pull" })
                    return
                end

                -- Success, so write the date to the file
                vim.fn.writefile({ today }, today_file)

                local output_str = table.concat(stdout_lines, "\n")

                -- Check if there was an actual update by checking the git pull output
                -- for English and Chinese messages.
                if not output_str:match("Already up to date") and not output_str:match("已经是最新的") then
                    vim.notify("Configuration updated successfully", vim.log.levels.INFO, { title = "Git Pull" })
                end
            end,
        })

        -- Delete the autocmd so it doesn't run again in this session
        if args and args.id then
            vim.api.nvim_del_autocmd(args.id)
        end
    end,
})

--------------- End of auto update config --------------
