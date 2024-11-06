-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- -- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

return {
  {
    map("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" }),
  },
  -- Resize window using <ctrl> arrow keys
  -- {map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })},
  -- {map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })},
  -- {map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })},
  -- {map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })},
  { map("n", "<leader>r", "<cmd>LspRestart<CR>", { noremap = true, silent = false, desc = "Restart LSP" }) },
  { map({ "n", "v" }, "<S-h>", "^", { noremap = true, silent = true }) },
  { map({ "n", "v" }, "<S-l>", "$", { noremap = true, silent = true }) },
}
