return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      require("scrollbar").setup({})
      require("gitsigns").setup({})
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.search").setup({
        -- override_lens = function() end,
      })

    end,
  },
}
