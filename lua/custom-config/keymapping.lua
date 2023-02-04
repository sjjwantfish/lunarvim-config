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



local keymap = lvim.builtin.which_key.mappings

-- windows
keymap["w"] = {
    name = "Windows",
    -- split windows
    l = { "<cmd>set splitright<CR><cmd>vsplit<CR>", "Split right" },
    h = { "<cmd>set nosplitright<CR><cmd>vsplit<CR>", "Split left" },
    j = { "<cmd>set splitbelow<CR><cmd>split<CR>", "Split below" },
    k = { "<cmd>set nosplitbelow<CR><cmd>split<CR>", "Split up" },
}

-- search
keymap["sn"] = {
    "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer fuzzy"
}
keymap["ss"] = {
    "<cmd>Telescope lsp_document_symbols<cr>", "Symbols fuzzy"
}

-- lsp
keymap["lh"] = {
    "<cmd>AerialToggle<cr>", "Symbols windows"
}
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Find references" }
lvim.keys.normal_mode["F"] = "<cmd>lua vim.lsp.buf.format()<cr>"

-- temp buffer
vim.api.nvim_create_user_command("TempBuffer", function()
    local filetype = vim.fn.input("Input filetype: ")
    if filetype ~= "" then
        vim.cmd("new temp_buffer_" .. filetype)
        vim.cmd("setfiletype " .. filetype)
    end
    vim.cmd("wincmd L")
end, { nargs = "?", complete = "dir" })

lvim.keys.normal_mode["C"] = ":TempBuffer<CR>"

-- undotree
lvim.keys.normal_mode["<leader>u"] = "<cmd>UndotreeToggle<cr>"

-- hopword
lvim.keys.normal_mode["<leader>j"] = "<cmd>HopWordMW<cr>"
lvim.keys.normal_mode["<leader>p"] = "<cmd>HopPattern<cr>"
lvim.keys.normal_mode["<leader>n"] = "<cmd>HopLineMW<cr>"
lvim.keys.visual_mode["<leader>j"] = "<cmd>HopWord<cr>"
lvim.keys.visual_mode["<leader>p"] = "<cmd>HopPattern<cr>"
lvim.keys.visual_mode["<leader>n"] = "<cmd>HopLine<cr>"

-- vim-interestingwords
lvim.keys.normal_mode["<a-h>"] = "<cmd>call InterestingWords('n')<cr>"
lvim.keys.visual_mode["<a-h>"] = "<cmd>call InterestingWords('v')<cr>"
lvim.keys.normal_mode["<a-H>"] = "<cmd>call UncolorAllWords()<cr>"

-- wildfire
lvim.keys.normal_mode["<a-m>"] = "<Plug>(wildfire-quick-select)"
-- lvim.keys.normal_mode["<a-,>"] = "<Plug>(wildfire-fuel)"

-- search-replace
keymap["r"] = { name = "SearchReplaceSingleBuffer" }
keymap["r"]["s"] = { "<CMD>SearchReplaceSingleBufferSelections<CR>", "SearchReplaceSingleBuffer [s]elction list" }
keymap["r"]["o"] = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "[o]pen" }
keymap["r"]["w"] = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "[w]ord" }
keymap["r"]["W"] = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "[W]ORD" }
keymap["r"]["e"] = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "[e]xpr" }
keymap["r"]["f"] = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "[f]ile" }
keymap["r"]["b"] = { name = "SearchReplaceMultiBuffer" }
keymap["r"]["b"]["s"] = { "<CMD>SearchReplaceMultiBufferSelections<CR>", "SearchReplaceMultiBuffer [s]elction list" }
keymap["r"]["b"]["o"] = { "<CMD>SearchReplaceMultiBufferOpen<CR>", "[o]pen" }
keymap["r"]["b"]["w"] = { "<CMD>SearchReplaceMultiBufferCWord<CR>", "[w]ord" }
keymap["r"]["b"]["W"] = { "<CMD>SearchReplaceMultiBufferCWORD<CR>", "[W]ORD" }
keymap["r"]["b"]["e"] = { "<CMD>SearchReplaceMultiBufferCExpr<CR>", "[e]xpr" }
keymap["r"]["b"]["f"] = { "<CMD>SearchReplaceMultiBufferCFile<CR>", "[f]ile" }

lvim.keys.visual_block_mode["<C-r>"] = [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]]
lvim.keys.visual_block_mode["<C-s>"] = [[<CMD>SearchReplaceWithinVisualSelection<CR>]]
lvim.keys.visual_block_mode["<C-b>"] = [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]]

-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"
