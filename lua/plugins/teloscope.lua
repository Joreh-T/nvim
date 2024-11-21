
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "mollerhoj/telescope-recent-files.nvim" },
  config = function()
    -- Keep LazyVim's Telescope config intact, and add your custom settings
    require('telescope').setup {
      -- defaults = {
      -- },
      pickers = {
        find_files = {
          -- Customize or modify behavior, while keeping LazyVim's defaults
          file_sorter = require('telescope.sorters').get_fuzzy_file,
        },
      },
    }

    -- Add the extension
    require('telescope').load_extension('recent-files')
  end,
}
