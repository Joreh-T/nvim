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
                { "<leader>p", group = "File path", icon = { icon = "󰴠", color = "cyan" } },
                {
                    "<leader>pn",
                    ':let @+ = expand("%:t")<CR>',
                    mode = "n",
                    desc = "Copy filename",
                },
                {
                    "<leader>pc",
                    ':let @+ = fnamemodify(expand("%:p"), ":." )<CR>',
                    mode = "n",
                    desc = "Copy relative path",
                },
                {
                    "<leader>pC",
                    ':let @+ = expand("%:p")<CR>',
                    mode = "n",
                    desc = "Copy absolute path",
                },
                {
                    "<leader>ps",
                    ':echo fnamemodify(expand("%:p"), ":." )<CR>',
                    mode = "n",
                    desc = "Show relative path",
                },
                {
                    "<leader>pS",
                    ':echo expand("%:p")<CR>',
                    mode = "n",
                    desc = "Show absolute path",
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
