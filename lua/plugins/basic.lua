return {

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    {
        'stevearc/dressing.nvim',
        opts = {},
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        config = function()
            require('lualine').setup({ options = { theme = 'iceberg_dark' } })
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "mrbjarksen/neo-tree-diagnostics.nvim", },
        opts = {
            popup_border_style = "rounded",
            enable_git_status = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
                "diagnostics",
            },
            -- diagnostics = {},
        },
        keys = {
            { "<leader>te", "<cmd>Neotree toggle left filesystem<cr>",        desc = "NeoTree Files" },
            { "<leader>ts", "<cmd>Neotree toggle right document_symbols<cr>", desc = "NeoTree Symbols" },
            { "<leader>td", "<cmd>Neotree diagnostics reveal bottom<cr>",     desc = "NeoTree Diagnostics" },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            --"ibhagwan/fzf-lua",      -- optional
            --"echasnovski/mini.pick", -- optional
        },
        config = true
    },


    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup({
                signcolumn = true,
                numhl      = true,
            })
        end,
    },

    {
        'nvim-orgmode/orgmode',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-orgmode/telescope-orgmode.nvim',
        },
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
            require('telescope').setup()
            require('telescope').load_extension('orgmode')
        end,
    },
}
