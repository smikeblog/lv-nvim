--function config.telescope()
    -- if not packer_plugins['plenary.nvim'].loaded then
    --     vim.cmd [[packadd plenary.nvim]]
    --     vim.cmd [[packadd popup.nvim]]
    --     vim.cmd [[packadd telescope-fzy-native.nvim]]
    --     vim.cmd [[packad telescope-media-files]]
    -- end
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('media_files')
    require('telescope').setup {
        defaults = {
            vimgrep_arguments = {
                'rg', '--color=never', '--no-heading', '--with-filename',
                '--line-number', '--column', '--smart-case'
            },
            prompt_position = "bottom",
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            layout_defaults = {
                horizontal = {mirror = false},
                vertical = {mirror = false}
            },
            file_sorter = require'telescope.sorters'.get_fzy_sorter,
            file_ignore_patterns = {},
            generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
            shorten_path = true,
            winblend = 0,
            width = 0.75,
            preview_cutoff = 120,
            results_height = 1,
            results_width = 0.8,
            border = {},
            borderchars = {
                '─', '│', '─', '│', '╭', '╮', '╯', '╰'
            },
            color_devicons = true,
            use_less = true,
            set_env = {['COLORTERM'] = 'truecolor'},
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new,
            buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            },
            media_files = {
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg"
            }
        }
    }
--endd
