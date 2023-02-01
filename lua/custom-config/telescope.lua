-- local trouble = require("trouble.providers.telescope")
-- telescope.load_extension("media_files")
-- telescope.load_extension('aerial')

-- telescope.load_extension("emoji")
-- telescope.load_extension('vim_bookmarks')
-- -- telescope.load_extension('trouble')
-- telescope.load_extension('dap')
-- -- telescope.load_extension('lazygit')

local function get_pickers(actions)
    return {
        find_files = {
            -- theme = "dropdown",
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            -- hidden = true,
            previewer = false,
        },
        live_grep = {
            only_sort_text = true,
            -- theme = "dropdown",
            vimgrep_arguments = {
                "rg",
                "--hidden",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "-g",
                "!.git"
            },
        },
        grep_string = {
            only_sort_text = true,
            -- theme = "dropdown",
        },
        buffers = {
            -- theme = "dropdown",
            previewer = true,
            initial_mode = "normal",
        },
        planets = {
            show_pluto = true,
            show_moon = true,
        },
        git_files = {
            -- theme = "dropdown",
            hidden = true,
            previewer = false,
            show_untracked = true,
        },
        lsp_references = {
            -- theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_definitions = {
            -- theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_declarations = {
            -- theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_implementations = {
            -- theme = "dropdown",
            initial_mode = "normal",
        },
    }
end

local function telescope_config()
    local actions = require("telescope.actions")
    return {
        defaults = {
            pickers = get_pickers(actions),
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<Down>"] = actions.cycle_history_next,
                    ["<Up>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    ["<C-c>"] = actions.close,

                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    -- ["<c-t>"] = trouble.open_with_trouble,
                },

                n = {
                    ["<esc>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,

                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    ["?"] = actions.which_key,
                    -- ["<c-t>"] = trouble.open_with_trouble,
                },
            },
        },
        pickers = get_pickers(actions),
        extensions = {
            aerial = {
                show_nesting = {
                    ['_'] = false, -- This key will be the default
                    json = true, -- You can set the option for specific filetypes
                    yaml = true,
                }
            }
        },
    }
end

-- vim.tbl_extend("force", telescope, telescope_config())
local config = telescope_config()
lvim.builtin.telescope.defaults = config.defaults
lvim.builtin.telescope.pickers = config.pickers
