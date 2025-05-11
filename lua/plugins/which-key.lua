return {
    "folke/which-key.nvim",
    opts = {
        spec = {
            {
                mode = { "v" },
                { "<leader>t", group = "Text case switch", icon = { icon = "" } },
            },
            {
                mode = { "n", "v" },
                { "<leader>y", group = "Yank path", icon = { icon = "󰴠", color = "cyan" } },
                {
                    "<leader>yn",
                    ':let @+ = expand("%:t")<CR>',
                    mode = "n",
                    desc = "Yank filename",
                },
                {
                    "<leader>yr",
                    ':let @+ = fnamemodify(expand("%:p"), ":." )<CR>',
                    mode = "n",
                    desc = "Yank relative path",
                },
                {
                    "<leader>ya",
                    ':let @+ = expand("%:p")<CR>',
                    mode = "n",
                    desc = "Yank absolute path",
                },
            },
            { "<leader>m", group = "Bookmarks", icon = { icon = "", color = "yellow" } },
            { "<leader>i", group = "Get Icons", icon = { icon = "", color = "green" } },
            { "<leader>K", group = "Keyword Manual", icon = { icon = "󰷈", color = "" } },
            { "<leader>r", group = "Restart LSP", icon = { icon = "", color = "red" } },
            { "<leader>a", group = "Avante", icon = { icon = "󰆾", color = "yellow" } },
        },
    },
}
