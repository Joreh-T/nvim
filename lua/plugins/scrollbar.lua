local utils = require("config.utils")

return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "kevinhwang91/nvim-hlslens",
        {
            "lewis6991/gitsigns.nvim",
            commit = utils.is_nvim_le(0, 10) and "ee7e50dfbdf49e3acfa416fd3ad3abbdb658582c" or nil,
        },
    },
    config = function()
        require("scrollbar").setup({})
        require("gitsigns").setup({})
        require("scrollbar.handlers.gitsigns").setup()
        require("scrollbar.handlers.search").setup({
            -- override_lens = function() end,
        })
    end,
}
