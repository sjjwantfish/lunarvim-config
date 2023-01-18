-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
-- lvim.colorscheme = "lunar"
lvim.transparent_window = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

require("custom-config.keymapping")
require("custom-config.colorscheme")
require("custom-config.options")
require("custom-config.telescope")
require("custom-config.nvimtree")
require("custom-config.aerial")
-- require("custom-config.illuminate")
require("custom-config.dadbod")
require("custom-config.vim-interestingwords")
require("custom-config.treesitter")
require("custom-config.cmp")

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--     name = "+Trouble",
--     r = { "<cmd>Trouble lsp_references<cr>", "References" },
--     f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--     d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--     q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--     l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--     w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.lualine.style = "lvim" -- or "none"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "python",
    "lua",
    "json",
    "go",
    "html",
    "javascript",
    "vue",
    "vim",
    "dockerfile",
    "markdown",
    "sql",
    "regex",
    "bash"
}
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.telescope.autopairs = { enable = true }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
-----
-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    -- python
    'pyright',
    -- html js vue
    'eslint',
    'vuels',
    -- lua
    'sumneko_lua',
    -- golang
    'gopls',
    -- shell
    'bashls',
    -- json
    'jsonls',
    -- vim
    'vimls',
}
-- change UI setting of `LspInstallInfo`
-- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
    -- { command = "isort", filetypes = { "python" } },
    -- {
    --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    --     command = "prettier",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--print-with", "100" },
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    --     filetypes = { "typescript", "typescriptreact" },
    -- },
    { command = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" } }
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    { command = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" } },
}

-- Additional Plugins
lvim.plugins = {
    -- colorscheme
    { "rafamadriz/neon" },
    { 'projekt0n/github-nvim-theme', tag = '0.0.6' },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { "stevearc/aerial.nvim" },
    -- jumping
    { "phaazon/hop.nvim",
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    -- selection
    { "gcmt/wildfire.vim" },
    -- database
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-ui" },
    { "kristijanhusak/vim-dadbod-completion" },
    -- code runner
    { "michaelb/sniprun", run = "bash ./install.sh" },
    -- ts
    { "lfv89/vim-interestingwords" },
    {
        "p00f/nvim-ts-rainbow",
    },
    { 'windwp/nvim-ts-autotag' },
    -- lsp
    { "jayp0521/mason-null-ls.nvim",
        -- config = function()
        --   require("mason-null-ls").setup(
        --     {
        --       -- A list of sources to install if they're not already installed.
        --       -- This setting has no relation with the `automatic_installation` setting.
        --       -- ensure_installed = require("user.lsp.config").null_ls,

        --       -- Run `require("null-ls").setup`.
        --       -- Will automatically install masons tools based on selected sources in `null-ls`.
        --       -- Can also be an exclusion list.
        --       -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
        --       automatic_installation = false,

        --       -- Whether sources that are installed in mason should be automatically set up in null-ls.
        --       -- Removes the need to set up null-ls manually.
        --       -- Can either be:
        --       -- 	- false: Null-ls is not automatically registered.
        --       -- 	- true: Null-ls is automatically registered.
        --       -- 	- { types = { SOURCE_NAME = {TYPES} } }. Allows overriding default configuration.
        --       -- 	Ex: { types = { eslint_d = {'formatting'} } }
        --       automatic_setup = false,
        --     }
        --   )
        -- end
    },
    -- bookmarks
    { "MattesGroeger/vim-bookmarks" },
    { "tom-anders/telescope-vim-bookmarks.nvim" },

    -- undo
    { "mbbill/undotree" },
    -- diff
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "vue", "javascript", "*.jsonc" },
    command = "set shiftwidth=2"
})
-- autocmd FileType javascript set shiftwidth=2
-- autocmd FileType vue set shiftwidth=2
