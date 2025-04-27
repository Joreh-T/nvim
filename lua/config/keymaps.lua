-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local utils = require("config.utils")

local map = vim.keymap.set
local del = vim.keymap.del

-----------------------------------------------------------
-- 映射 'yw' 为 'viwy' 避免复制多余的空格
map("n", "yw", "viwy", { noremap = true, silent = true })
map("n", "<A-j>", "<C-d>", { noremap = true, silent = true, desc = "Scroll Up Half Page" })
map("n", "<A-k>", "<C-u>", { noremap = true, silent = true, desc = "Scroll Down Half Page" })
map("n", "<C-i>", "<C-i>", { noremap = true, silent = true })
map("n", "<C-o>", "<C-o>", { noremap = true, silent = true })
map("n", "<S-u>", "<C-r>", { noremap = true, silent = true })
map("n", "<leader>r", "<cmd>LspRestart<CR>", { noremap = true, silent = false, desc = "Restart LSP" })
map("n", "<CR>", "o<esc>", { noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })

--open/close terminal
-- map("n", "<a-`>", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- map("n", "<a-`>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Open Terminal (Root Dir)" })
-- { map("t", "<a-`>", "<cmd>close<cr>", { desc = "Hide Terminal" }) },
--
map("n", "<a-`>", utils.open_terminal_rezise_height, { desc = "Terminal (cwd)" })
map("t", "<a-`>", utils.close_terminal_and_focus_largest, { desc = "Hide Terminal and Focus Largest Window" })

map("n", "<leader>ft", function()
    Snacks.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", function()
    Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- buffer motion
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- map("n", "<leader>fr", function()
--   require("telescope").extensions["recent-files"].recent_files({})
-- end, { noremap = true, silent = true, desc = "Recent Files" })
-- map("n", "<leader><leader>", function()
--   require("telescope").extensions["recent-files"].recent_files({})
-- end, { noremap = true, silent = true, desc = "Recent Files" })

del("n", "<leader>|") -- del keymap: map("<leader>|", "<C-W>v", { desc = "Split Window Right" }) },
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = false })
-----------------------------------------------------------
map({ "n", "v" }, "<S-h>", "^", { noremap = true, silent = true })
map("n", "<S-l>", "$", { noremap = true, silent = true })
map("v", "<S-l>", "$h", { noremap = true, silent = true })
-- map({ "n", "v" }, "<S-l>", "$", { noremap = true, silent = true }) --这俩放一起，v模式下会选中换行符

-----------------------------------------------------------
map("i", "jk", "<esc>", { noremap = true, silent = true })

-----------------------------------------------------------
map("v", "jkl", "<esc>", { noremap = true, silent = true })
-- diagnostic 浮动窗口显示diagnostic内容

map("n", "gh", function()
    vim.diagnostic.open_float(nil, {
        border = "rounded", -- You can choose "single", "double", "rounded", or "solid"
    })
end, { noremap = true, silent = true, desc = "Hover diagnostic" })

-- 复制：Ctrl + c
map({ "n", "v" }, "<C-c>", '"+y', { noremap = true, desc = "Copy to system clipboard" })

-- 粘贴：Ctrl + v
map("n", "<C-v>", '"+p', { noremap = true, desc = "Paste from system clipboard" })
-- map("i", "<C-v>", "<C-r>+", { noremap = true, desc = "Paste from system clipboard" }) -- 这样在neovide中如果待粘贴数据中带有注释符号，则会触发自动注释
map("i", "<C-v>", '<esc>"+p', { noremap = true, desc = "Paste from system clipboard" })
-- map('c', '<C-v>', '<C-r>+', { noremap = true, silent = true }) -- 这样ui不会马上刷新
map("c", "<C-v>", function()
    return vim.fn.getreg("+")
end, { noremap = true, expr = true, desc = "Paste clipboard in cmdline" })

--   {map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })},
--   {map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })}
--   { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },


------------------------- Git Tools -------------------------
local diffview_open = false -- 状态标志
local diffviewFileHistory_open = false -- 状态标志
-- 定义切换函数
local function toggle_diffview()
    if diffview_open then
        vim.cmd("DiffviewClose") -- 如果已打开，则关闭
        diffview_open = false
    else
        vim.cmd("DiffviewOpen") -- 如果未打开，则打开
        diffview_open = true
    end
end

local function toggle_history_view()
    if diffviewFileHistory_open then
        vim.cmd("DiffviewClose") -- 如果已打开，则关闭
        diffviewFileHistory_open = false
    else
        vim.cmd("DiffviewFileHistory") -- 如果未打开，则打开
        diffviewFileHistory_open = true
    end
end

map("n", "<leader>gd", toggle_diffview, { noremap = true, silent = true, desc = "Toggle Diffview" })
map("n", "<leader>gH", toggle_history_view, { noremap = true, silent = true, desc = "Toggle File History" })

map("n", "q", function()
    local closed_diffview = false
    -- 安全遍历所有窗口
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        -- 检查窗口是否有效
        local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
        if ok then
            -- 检查文件类型
            local cur_buf_type = vim.bo[buf].filetype
            if cur_buf_type == "DiffviewFiles" or cur_buf_type == "DiffviewFileHistory" then
                vim.api.nvim_win_call(win, function()
                    vim.cmd("DiffviewClose")
                end)
                closed_diffview = true
                diffview_open = false
                diffviewFileHistory_open = false
            end
        end
    end
    -- 如果没有关闭任何 Diffview，执行默认 q 行为
    if not closed_diffview then
        vim.api.nvim_feedkeys("q", "n", false)
    end
end)

-- lazygit
-- if vim.fn.executable("lazygit") == 1 then
--     local util = require(("config.util"))
--     map("n", "<leader>gg", function()
--         -- 如果avante中打开了ask功能自动进入insert模式就不用下面的步骤
--         if util.has_avante_window() then
--             vim.cmd("AvanteToggle")
--         end
--         Snacks.lazygit({ cwd = LazyVim.root.git() })
--         vim.defer_fn(function()
--             if vim.fn.mode() ~= "i" then
--                 vim.cmd("startinsert")
--             end
--         end, 500)
--     end, { desc = "Lazygit (Root Dir)" })
--
--     map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
--     map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
--     map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
--     map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
-- end
-------------------------End Of Git Tools -------------------------
