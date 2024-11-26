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
    preview_window = {
      -- Border option for floating preview window.
      -- Options include: single/double/rounded/solid/shadow or an array of border
      -- characters.
      -- See :help nvim_open_win() and search for "border" option.
      border = "rounded",
      -- Experimental feature that let's you edit the source content live
      -- in the preview window. Like VS Code's "peek editor".
      live = true,
    },
  },
}
