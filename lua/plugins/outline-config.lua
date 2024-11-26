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
    symbols = {
      ---@type outline.FilterConfig?
      filter = nil,
      icon_source = nil,
      icon_fetcher = nil,
      icons = {
        File = { icon = "󰈔", hl = "Identifier" },
        Module = { icon = "󰆧", hl = "Include" },
        Namespace = { icon = "󰅪", hl = "Include" },
        Package = { icon = "󰏗", hl = "Include" },
        Class = { icon = "𝓒", hl = "Type" },
        Method = { icon = "", hl = "Function" },
        Property = { icon = "", hl = "Identifier" },
        Field = { icon = "󰆨", hl = "Identifier" },
        Constructor = { icon = "", hl = "Special" },
        Enum = { icon = "ℰ", hl = "Type" },
        Interface = { icon = "󰜰", hl = "Type" },
        Function = { icon = "ƒ", hl = "Function" },
        Variable = { icon = "", hl = "Constant" },
        Constant = { icon = "", hl = "Constant" },
        String = { icon = "𝓐", hl = "String" },
        Number = { icon = "#", hl = "Number" },
        Boolean = { icon = "⊨", hl = "Boolean" },
        Array = { icon = "󰅪", hl = "Constant" },
        Object = { icon = "⦿", hl = "Type" },
        Key = { icon = "🔐", hl = "Type" },
        Null = { icon = "NULL", hl = "Type" },
        EnumMember = { icon = "", hl = "Identifier" },
        Struct = { icon = "𝓢", hl = "Structure" },
        Event = { icon = "🗲", hl = "Type" },
        Operator = { icon = "+", hl = "Identifier" },
        TypeParameter = { icon = "𝙏", hl = "Identifier" },
        Component = { icon = "󰅴", hl = "Function" },
        Fragment = { icon = "󰅴", hl = "Constant" },
        -- ccls
        TypeAlias = { icon = " ", hl = "Type" },
        Parameter = { icon = " ", hl = "Identifier" },
        StaticMethod = { icon = " ", hl = "Function" },
        Macro = { icon = " ", hl = "Function" },
      },
    },
  },
}
