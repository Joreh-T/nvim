return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    outline_window = {
      position = "right",
      split_command = nil,
      width = 15,
      relative_width = true,
      wrap = false,
      focus_on_open = true,
      auto_close = false,
      auto_jump = false,
      show_numbers = false,
      show_relative_numbers = false,
      ---@type boolean|string?
      show_cursorline = true,
      hide_cursor = false,
      winhl = "",
      jump_highlight_duration = 400,
      center_on_jump = true,
    },
  },
}

