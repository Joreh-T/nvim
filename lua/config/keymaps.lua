-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function close_terminal_and_focus_largest()
  -- 关闭当前窗口
  vim.cmd("close")

  -- 查找剩余窗口中面积最大的窗口
  local max_area = 0
  local target_win = nil
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local config = vim.api.nvim_win_get_config(win)
    if not config.relative or config.relative == "" then -- 忽略浮动窗口
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      local area = width * height
      if area > max_area then
        max_area = area
        target_win = win
      end
    end
  end

  -- 如果找到了目标窗口，则跳转到该窗口
  if target_win then
    vim.api.nvim_set_current_win(target_win)
  end
end

local map = vim.keymap.set

return {
  -----------------------------------------------------------
  { map("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" }) },
  { map("n", "<S-u>", "<C-r>", { noremap = true, silent = true }) },
  { map("n", "<leader>r", "<cmd>LspRestart<CR>", { noremap = true, silent = false, desc = "Restart LSP" }) },
  { map("n", "<CR>", "o<esc>", { noremap = true, silent = true }) },

  {
    map("n", "<a-`>", function()
      Snacks.terminal(nil, { cwd = LazyVim.root() })
      vim.cmd("resize " .. math.floor(vim.api.nvim_win_get_height(0) / 1.5)) -- resize the terminal window height
    end, { desc = "Open Terminal (Root Dir)" }),
  },
  -- { map("t", "<a-`>", "<cmd>close<cr>", { desc = "Hide Terminal" }) },
  { map("t", "<a-`>", close_terminal_and_focus_largest, { desc = "Hide Terminal and Focus Largest Window" }) },

  { map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" }) },
  { map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" }) },
  { map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search In Curren Buffer" }) },

  {
    map("n", "<leader>fr", function()
      require("telescope").extensions["recent-files"].recent_files({})
    end, { noremap = true, silent = true, desc = "Recent Files" }),
  },

  -----------------------------------------------------------
  { map({ "n", "v" }, "<S-h>", "^", { noremap = true, silent = true }) },
  { map({ "n", "v" }, "<S-l>", "$", { noremap = true, silent = true }) },

  -----------------------------------------------------------
  { map("i", "jk", "<esc>", { noremap = true, silent = true }) },

  -----------------------------------------------------------
  { map("v", "jkl", "<esc>", { noremap = true, silent = true }) },
  -- diagnostic 浮动窗口显示diagnostic内容
  {
    map("n", "gh", function()
      vim.diagnostic.open_float(nil, {
        border = "rounded", -- You can choose "single", "double", "rounded", or "solid"
      })
    end, { noremap = true, silent = true, desc = "Hover diagnostic" }),
  },
  --   {map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })},
  --   {map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })}
  --   { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
}
