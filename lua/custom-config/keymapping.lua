-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping

-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["W"] = "<cmd>w<cr>"

lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["Q"] = "<cmd>BufferKill<cr>"
-- lvim.keys.normal_mode["<c-q>"] = "<cmd>quitall<cr>"
-- lvim.keys.normal_mode["<c-a>"] = "<cmd>close<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- lvim.keys.normal_mode["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
-- lvim.keys.normal_mode["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
-- lvim.keys.normal_mode["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
-- lvim.keys.normal_mode["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
-- lvim.keys.normal_mode["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
-- lvim.keys.normal_mode["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
-- lvim.keys.normal_mode["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
-- lvim.keys.normal_mode["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
-- lvim.keys.normal_mode["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"

-- windows
lvim.builtin.which_key.mappings["w"] = {
    name = "Windows",
    -- split windows
    l = { "<cmd>set splitright<CR><cmd>vsplit<CR>", "Split right" },
    h = { "<cmd>set nosplitright<CR><cmd>vsplit<CR>", "Split left" },
    j = { "<cmd>set splitbelow<CR><cmd>split<CR>", "Split below" },
    k = { "<cmd>set nosplitbelow<CR><cmd>split<CR>", "Split up" },
}

-- search
lvim.builtin.which_key.mappings["sn"] = {
    "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer fuzzy"
}

-- lsp
lvim.builtin.which_key.mappings["lh"] = {
    "<cmd>AerialToggle<cr>", "Symbols windows"
}

-- hopword
lvim.keys.normal_mode["<leader>j"] = "<cmd>HopWord<cr>"
lvim.keys.normal_mode["<leader>p"] = "<cmd>HopPattern<cr>"
lvim.keys.normal_mode["<leader>n"] = "<cmd>HopLine<cr>"
lvim.keys.visual_mode["<leader>j"] = "<cmd>HopWord<cr>"
lvim.keys.visual_mode["<leader>p"] = "<cmd>HopPattern<cr>"
lvim.keys.visual_mode["<leader>n"] = "<cmd>HopLine<cr>"

-- vim-interestingwords
lvim.keys.normal_mode["<a-h>"] = "<cmd>call InterestingWords('n')<cr>"
lvim.keys.visual_mode["<a-h>"] = "<cmd>call InterestingWords('v')<cr>"
lvim.keys.normal_mode["<a-H>"] = "<cmd>call UncolorAllWords()<cr>"
