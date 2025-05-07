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

                on_attach  = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'stage hunk' })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'reset hunk' })

                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'stage buffer' })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'reset buffer' })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'preview hunk' })
                    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'preview hunk inline' })

                    map('n', '<leader>hb', function()
                        gitsigns.blame_line({ full = true })
                    end, { desc = 'blame line' })

                    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'diffthis' })

                    map('n', '<leader>hD', function()
                        gitsigns.diffthis('~')
                    end, { desc = 'diffthis(~)' })

                    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
                    map('n', '<leader>hq', gitsigns.setqflist)

                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle current line blame' })
                    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'toggle word diff' })

                    -- Text object
                    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'select hunk' })
                end,
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
