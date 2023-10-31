return {
   -- Theme https://github.com/ellisonleao/gruvbox.nvim
   {
      'ellisonleao/gruvbox.nvim',
      priority = 1000,
      config = true
   },

   -- Highlight, edit, and navigate code
   {
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
         'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
   },

   -- LSP Configuration & Plugins
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         -- Automatically install LSPs to stdpath for neovim
         'williamboman/mason.nvim',
         'williamboman/mason-lspconfig.nvim',

         -- Useful status updates for LSP
         -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
         { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

         -- Additional lua configuration, makes nvim stuff amazing!
         'folke/neodev.nvim',
      },
   },

   -- https://github.com/simrat39/rust-tools.nvim
   { 'simrat39/rust-tools.nvim' },

   {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
         -- Snippet Engine & its associated nvim-cmp source
         'L3MON4D3/LuaSnip',
         'saadparwaiz1/cmp_luasnip',

         -- Adds LSP completion capabilities
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-nvim-lsp-signature-help',

         -- Adds a number of user-friendly snippets
         'rafamadriz/friendly-snippets',
      },
   },

   -- Fuzzy Finder (files, lsp, etc)
   {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
         'nvim-lua/plenary.nvim',
         -- Fuzzy Finder Algorithm which requires local dependencies to be built.
         -- Only load if `make` is available. Make sure you have the system
         -- requirements installed.
         {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
               return vim.fn.executable 'make' == 1
            end,
         },
      },
   },

   {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = {
         "nvim-telescope/telescope.nvim",
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
      },
   },

   -- https://github.com/nvim-lualine/lualine.nvim
   { 'nvim-lualine/lualine.nvim' },

   -- https://github.com/lukas-reineke/indent-blankline.nvim
   -- { 'lukas-reineke/indent-blankline.nvim', main="ibl", opts = {} }

   -- Useful plugin to show you pending keybinds.
   { 'folke/which-key.nvim',             opts = {} },

   -- https://github.com/numToStr/Comment.nvim
   -- "gc" to comment visual regions/lines
   { 'numToStr/Comment.nvim',            opts = {} },

   -- Git related plugins
   { 'tpope/vim-fugitive' },      -- https://github.com/tpope/vim-fugitive
   { 'tpope/vim-rhubarb' },       -- https://github.com/tpope/vim-rhubarb
   { 'lewis6991/gitsigns.nvim' }, -- https://github.com/lewis6991/gitsigns.nvim

   -- Debugging
   { 'mfussenegger/nvim-dap' },             -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
   { 'leoluz/nvim-dap-go' },                -- https://github.com/leoluz/nvim-dap-go
   { 'theHamsta/nvim-dap-virtual-text' },   -- https://github.com/theHamsta/nvim-dap-virtual-text
   { 'rcarriga/nvim-dap-ui' },              -- https://github.com/rcarriga/nvim-dap-ui
   { 'nvim-telescope/telescope-dap.nvim' }, -- https://github.com/nvim-telescope/telescope-dap.nvim

   -- https://github.com/iamcco/markdown-preview.nvim
   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
   },

   --[[

   Focus current block
   https://github.com/folke/twilight.nvim

   Better Notifications
   https://github.com/rcarriga/nvim-notify

   Better Input + Select UI
   https://github.com/stevearc/dressing.nvim

   Buffers as tabs
   https://github.com/akinsho/bufferline.nvim

   Undo History
   https://github.com/mbbill/undotree

   ]] --
}
