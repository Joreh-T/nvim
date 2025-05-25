local utils = require("config.utils")
return {
    "MagicDuck/grug-far.nvim",
    version = utils.is_nvim_le(0, 10, 4) and "v1.6.3" or nil,

    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    -- config = function()
    --   -- optional setup call to override plugin options
    --   -- alternatively you can set options with vim.g.grug_far = { ... }
    --   require('grug-far').setup({
    --     -- options, see Configuration section below
    --     -- there are no required options atm
    --   });
    -- end
}
