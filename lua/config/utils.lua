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

----------------------- NVIM version Check --------------------
-- 0.10.4
-- │  │ └── patch version
-- │  └────── minor version
-- └───────── major version
-- Greater than or Equal
function M.is_nvim_ge(major, minor, patch)
    local v = vim.version()
    -- vim.notify(("Checking if Neovim >= %d.%d%s (current: %d.%d.%d)"):format(
    --   major, minor, patch and ("." .. patch) or "", v.major, v.minor, v.patch
    -- ), vim.log.levels.DEBUG)

    if v.major > major then
        return true
    elseif v.major < major then
        return false
    end

    if v.minor > minor then
        return true
    elseif v.minor < minor then
        return false
    end

    if patch == nil then
        return true
    end

    return v.patch >= patch
end

function M.is_nvim_le(major, minor, patch)
    local v = vim.version()
    -- vim.notify(("Checking if Neovim <= %d.%d%s (current: %d.%d.%d)"):format(
    --   major, minor, patch and ("." .. patch) or "", v.major, v.minor, v.patch
    -- ), vim.log.levels.DEBUG)

    if v.major < major then
        return true
    elseif v.major > major then
        return false
    end

    if v.minor < minor then
        return true
    elseif v.minor > minor then
        return false
    end

    if patch == nil then
        return true
    end

    return v.patch <= patch
end

-------------------- End Of NVIM version Check ------------------

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
    -- Save current window list for comparison
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

    -- Handle window size adjustment asynchronously
    vim.schedule(function()
        if has_outline then
            -- Get newly created terminal window
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
                -- Switch to terminal window for operations
                vim.api.nvim_set_current_win(term_win)
                -- Calculate and set height (minimum 5 lines)
                local new_height = math.max(5, math.floor(ui_height * 0.21))
                vim.api.nvim_win_set_height(term_win, new_height)
                -- Lock window height (optional)
                -- vim.wo[term_win].winfixheight = true
            end
        end
    end)
    -- Avoid inability to automatically enter t mode when there's an avante window
    if M.has_target_ft_window("^Avante") and vim.fn.mode() ~= "t" and M.has_target_ft_window("snacks_terminal") then
        vim.defer_fn(function()
            vim.cmd("startinsert")
        end, 100)
    end
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
    -- Close current window
    vim.cmd("close")
    -- Snacks.terminal(nil, { cwd = LazyVim.root() })

    -- Find the window with the largest area among remaining windows
    M.focus_largest_window()
end

function M.has_target_ft_window(filetype_pattern)
    -- Iterate through all windows in current tab
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        -- Check if filetype matches the given pattern
        if vim.bo[buf].filetype:match(filetype_pattern) then
            return true
        end
    end
    return false
end

------------------------ Avante ------------------------
-- Check if there's a window with filetype starting with Avante
function M.has_avante_window()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype:match("^Avante") then
            return true
        end
    end
    return false
end

-- Define list of filetypes to monitor (supports partial matching)
local avante_monitor_ft = {
    "terminal$", -- Match filetypes ending with "terminal"
    "Outline$",
    -- "neo-tree"
}

-- Check if filetype matches target list (supports partial matching)
function M.is_avante_monitor_ft(ft)
    for _, pattern in ipairs(avante_monitor_ft) do
        if ft:match(pattern) then
            return true
        end
    end
    return false
end

-- Safe debounce function (supports Neovim 0.5+)
M.debounce_toggle_avante = (function()
    local cooldown = false -- Add cooldown status flag
    local timer = nil
    return function(ft)
        -- Return directly if in cooldown state
        if cooldown then
            print("[Avante] In cooldown, skip toggle")
            return
        end

        -- Execute operation immediately
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

        -- Start cooldown timer
        cooldown = true
        timer = vim.loop.new_timer()
        if not timer then
            vim.notify("Failed to create avanteCheck timer", vim.log.levels.ERROR)
            return
        end

        timer:start(
            200, -- Cooldown time 200ms
            0,
            vim.schedule_wrap(function()
                -- Safely release resources
                pcall(function()
                    timer:close()
                end)
                timer = nil
                cooldown = false -- Release cooldown state
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

    -- Build cross-platform command
    local command
    if M.is_windows() then
        -- Explicitly call CMD in Windows and be compatible with PowerShell environment
        command = 'cmd /c "git rev-parse --is-inside-work-tree 2>nul"'
        -- vim.notify("windows env")
    else
        -- Linux/Mac use standard silent mode
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

    -- Tail whitespace trimming
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
    -- Check if refresh is needed (Diffview related conditions)
    if not is_refresh_neotree_need and (M.has_target_ft_window("DiffviewFiles") or M.has_target_ft_window("DiffviewFileHistory")) then
        is_refresh_neotree_need = true
        -- vim.notify("need refresh neo-tree", vim.log.levels.INFO)
    end
    if not has_neotree_window() or M.has_target_ft_window("snacks_dashboard") then
        return
    end
    -- Check Git repository status
    if not is_git_repo_cached() then
        return
    end

    local current_buf = vim.api.nvim_get_current_buf()
    local current_ft = vim.bo[current_buf].filetype
    if current_ft == "neo-tree" then
        return
    end

    -- Debounce logic: record last refresh time in ms
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

    -- Execute one-time refresh
    vim.defer_fn(function()
        if has_neotree_window() then
            require("neo-tree.sources.manager").refresh("filesystem")
            is_refresh_neotree_need = false
            -- vim.notify("Refreshed neo-tree once (with delay)", vim.log.levels.INFO)
        end
    end, 500)
end

------------------------ End Of Neo-tree ------------------------

function M.get_global_row_scaled(factor)
    local total_rows = vim.o.lines

    if factor == nil then
        return total_rows
    end

    if type(factor) ~= "number" then
        vim.notify("Input arg not a number", vim.log.levels.ERROR)
        return total_rows
    end

    if factor <= 0 then
        vim.notify("Input factor must be greater than 0", vim.log.levels.ERROR)
        return total_rows
    end

    local result = math.floor(total_rows * factor + 0.5)
    return math.max(1, result)
end

function M.get_global_col_scaled(factor)
    local total_cols = vim.api.nvim_win_get_width(0)

    if factor == nil then
        return total_cols
    end

    if type(factor) ~= "number" or factor <= 0 then
        return total_cols
    end

    if factor <= 0 then
        vim.notify("Input factor must be greater than 0", vim.log.levels.ERROR)
        return total_cols
    end

    local result = math.floor(total_cols * factor + 0.5)
    return math.max(1, result)
end

function M.get_focused_window_row_scaled(factor)
    local total_rows = vim.api.nvim_win_get_height(0)

    if factor == nil then
        return total_rows
    end

    if type(factor) ~= "number" then
        vim.notify("Input arg not a number", vim.log.levels.ERROR)
        return total_rows
    end

    if factor <= 0 then
        vim.notify("Input factor must be greater than 0", vim.log.levels.ERROR)
        return total_rows
    end

    local result = math.floor(total_rows * factor + 0.5)
    return math.max(1, result)
end

function M.get_focused_window_col_scaled(factor)
    local total_cols = vim.o.columns

    if factor == nil then
        return total_cols
    end

    if type(factor) ~= "number" or factor <= 0 then
        return total_cols
    end

    if factor <= 0 then
        vim.notify("Input factor must be greater than 0", vim.log.levels.ERROR)
        return total_cols
    end

    local result = math.floor(total_cols * factor + 0.5)
    return math.max(1, result)
end

return M
