local M = {}

------------------------ OS Info ------------------------
function M.is_windows()
    return SYSTEM_NAME == "windows_nt"
end

function M.is_linux()
    return SYSTEM_NAME == "linux"
end

function M.is_macos()
    return SYSTEM_NAME == "darwin"
end

------------------------ End Of OS Info ------------------------

-- Global table to store cursor positions
local cursor_positions = {}

-- Record the current window, cursor position, and input mode
local function record_cursor_position()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local pos = vim.api.nvim_win_get_cursor(win)
    local mode = vim.api.nvim_get_mode().mode
    cursor_positions = {
        win = win,
        buf = buf,
        pos = pos,
        mode = mode,
    }
end

-- Restore the cursor to the recorded window, position, and input mode
local function restore_cursor_position(ft)
    if cursor_positions.win and vim.api.nvim_win_is_valid(cursor_positions.win) then
        vim.api.nvim_set_current_win(cursor_positions.win)
        vim.api.nvim_win_set_cursor(cursor_positions.win, cursor_positions.pos)

        -- Restore input mode
        local current_mode = vim.api.nvim_get_mode().mode
        if current_mode ~= cursor_positions.mode then
            if cursor_positions.mode == "n" then
                vim.api.nvim_command("stopinsert")
            elseif cursor_positions.mode == "i" then
                vim.api.nvim_command("startinsert")
            end
        end
    else
        vim.notify("No valid recorded cursor position to restore", vim.log.levels.WARN)
    end
end

-- Avoid abnormal terminal height when an outline buffer exists in the current window.
function M.open_terminal_rezise_height()
    -- 保存当前窗口列表用于对比
    local prev_wins = vim.api.nvim_list_wins()

    local has_outline = false
    for _, win in ipairs(prev_wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype:match("Outline") then
            has_outline = true
            break
        end
    end

    Snacks.terminal()

    -- 异步处理窗口尺寸调整
    vim.schedule(function()
        if has_outline then
            -- 获取新创建的终端窗口
            local new_wins = vim.api.nvim_list_wins()
            local term_win = nil
            for _, win in ipairs(new_wins) do
                if not vim.tbl_contains(prev_wins, win) then
                    term_win = win
                    break
                end
            end

            local ui_height = vim.api.nvim_list_uis()[1].height

            if term_win then
                -- 切换到终端窗口进行操作
                vim.api.nvim_set_current_win(term_win)
                -- 计算并设置高度（至少保留 5 行高度）
                local new_height = math.max(5, math.floor(ui_height * 0.21))
                vim.api.nvim_win_set_height(term_win, new_height)
                -- 锁定窗口高度（可选）
                -- vim.wo[term_win].winfixheight = true
            end
        end
    end)
    -- 避免有avante窗口时无法自动进入t模式
    vim.defer_fn(function()
        if vim.fn.mode() ~= "t" then
            vim.cmd("startinsert")
        end
    end, 100)
end

function M.focus_largest_window()
    local max_area = 0
    local target_win = nil

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local config = vim.api.nvim_win_get_config(win)
        if not config.relative or config.relative == "" then
            local width = vim.api.nvim_win_get_width(win)
            local height = vim.api.nvim_win_get_height(win)
            local area = width * height
            if area > max_area then
                max_area = area
                target_win = win
            end
        end
    end

    if target_win then
        vim.api.nvim_set_current_win(target_win)
    end
end

function M.close_terminal_and_focus_largest()
    -- 关闭当前窗口
    vim.cmd("close")
    -- Snacks.terminal(nil, { cwd = LazyVim.root() })

    -- 查找剩余窗口中面积最大的窗口
    M.focus_largest_window()
end

function M.has_target_ft_window(filetype_pattern)
    -- 遍历当前标签页中的所有窗口
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        -- 检查文件类型是否匹配给定的模式
        if vim.bo[buf].filetype:match(filetype_pattern) then
            return true
        end
    end
    return false
end

------------------------ Avante ------------------------
-- 检查是否存在 Avante 开头的文件类型窗口
function M.has_avante_window()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype:match("^Avante") then
            return true
        end
    end
    return false
end

-- 定义需要监视的文件类型列表（支持部分匹配）
local avante_monitor_ft = {
    "terminal$", -- 匹配以 "terminal" 结尾的文件类型
    "Outline$",
    -- "neo-tree"
}

-- 检查文件类型是否匹配目标列表（支持部分匹配）
function M.is_avante_monitor_ft(ft)
    for _, pattern in ipairs(avante_monitor_ft) do
        if ft:match(pattern) then
            return true
        end
    end
    return false
end

-- 安全防抖函数 (支持 Neovim 0.5+)
M.debounce_toggle_avante = (function()
    local cooldown = false -- 新增冷却状态标志
    local timer = nil
    return function(ft)
        -- 如果处于冷却状态则直接返回
        if cooldown then
            print("[Avante] In cooldown, skip toggle")
            return
        end

        -- 立即执行操作
        record_cursor_position()
        if M.has_avante_window() then
            vim.cmd("AvanteToggle")
            vim.cmd("AvanteToggle")
            restore_cursor_position(ft)
            -- focus_largest_window()
            -- vim.defer_fn(function()
            --   vim.cmd("stopinsert")
            -- end, 320)
        end

        -- 启动冷却计时器
        cooldown = true
        timer = vim.loop.new_timer()
        if not timer then
            vim.notify("Failed to create avanteCheck timer", vim.log.levels.ERROR)
            return
        end

        timer:start(
            200, -- 冷却时间 200ms
            0,
            vim.schedule_wrap(function()
                -- 安全释放资源
                pcall(function()
                    timer:close()
                end)
                timer = nil
                cooldown = false -- 解除冷却状态
                -- print("[Avante] Cooldown ended")
            end)
        )
    end
end)()
------------------------ End Of Avante ------------------------

------------------------ Neo-tree ------------------------
-- local neotree_refresh_timer = nil
-- local neotree_refresh_interval = 2000 --ms
local is_refresh_neotree_need = false
local last_neotree_refresh_time = 0

local function is_git_repo_cached()
    if vim.g.is_git_repo_cache ~= nil then
        return vim.g.is_git_repo_cache
    end

    -- 构建跨平台命令
    local command
    if M.is_windows() then
        -- 在 Windows 中显式调用 CMD 并兼容 PowerShell 环境
        command = 'cmd /c "git rev-parse --is-inside-work-tree 2>nul"'
        -- vim.notify("windows env")
    else
        -- Linux/Mac 使用标准静默方式
        command = "git rev-parse --is-inside-work-tree 2>/dev/null"
        -- vim.notify("linux env")
    end

    local handle = io.popen(command)
    if not handle then
        vim.g.is_git_repo_cache = false
        return false
    end

    local result = handle:read("*a")
    handle:close()

    -- 空白处理
    local trimmed = result:gsub("%s+", "")
    -- vim.notify("git rev-parse output: '" .. trimmed .. "'", vim.log.levels.INFO)
    vim.g.is_git_repo_cache = trimmed == "true"

    -- vim.notify(string.format("final result %s", trimmed), vim.log.levels.INFO)
    return vim.g.is_git_repo_cache
end

local function has_neotree_window()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
            -- vim.notify("have neo-tree", vim.log.levels.INFO)
            return true
        end
    end
    -- vim.notify("have not neo-tree", vim.log.levels.WARN)
    return false
end


function M.refresh_neo_tree_if_git()
    -- 检查是否需要刷新（Diffview 相关条件）
    if not is_refresh_neotree_need and (M.has_target_ft_window("DiffviewFiles") or M.has_target_ft_window("DiffviewFileHistory")) then
        is_refresh_neotree_need = true
        -- vim.notify("need refresh neo-tree", vim.log.levels.INFO)
    end
    if not has_neotree_window() or M.has_target_ft_window("snacks_dashboard") then
        return
    end
    -- 检查 Git 仓库状态
    if not is_git_repo_cached() then
        return
    end

    local current_buf = vim.api.nvim_get_current_buf()
    local current_ft = vim.bo[current_buf].filetype
    if current_ft == "neo-tree" then
        return
    end

    -- 防抖逻辑：记录最后一次刷新时间 ms
    local is_refresh_interval_passed = true
    local now = vim.loop.now()
    if last_neotree_refresh_time and (now - last_neotree_refresh_time < 2000) then
        is_refresh_interval_passed = false
        -- vim.notify("refresh interval too short", vim.log.levels.INFO)
        return
    end
    last_neotree_refresh_time = now

    if not is_refresh_interval_passed and not is_refresh_neotree_need then
        return
    end

    -- 执行一次性刷新
    vim.defer_fn(function()
        if has_neotree_window() then
            require("neo-tree.sources.manager").refresh("filesystem")
            is_refresh_neotree_need = false
            -- vim.notify("Refreshed neo-tree once (with delay)", vim.log.levels.INFO)
        end
    end, 500)
end

------------------------ End Of Neo-tree ------------------------
return M
