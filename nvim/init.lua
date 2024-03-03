-- [[defaults]]
local leader_key = " "
local tab_length = 2


-- [[setting defaults]]
vim.g.mapleader = leader_key
vim.opt.tabstop = tab_length 
vim.opt.shiftwidth = tab_length
vim.opt.softtabstop = tab_length
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.relativenumber = true


-- [[plugins: lazy.nvim]]
local plugins = {
  { 
    "AstroNvim/astrotheme", 
    priority = 1000 
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'VonHeikemen/lsp-zero.nvim', 
    branch = 'v3.x'
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/nvim-cmp'
  },
  {
    'L3MON4D3/LuaSnip'
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'goolord/alpha-nvim',
  },
}

local opts = {}


-- [[lazy: package manager]] 
-- ref: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts) -- plugins, opts are defined at the top


-- [[astrotheme: colorscheme]]
-- ref: https://github.com/AstroNvim/astrotheme
require("astrotheme").setup()
vim.cmd.colorscheme "astrodark"


-- [[telescope: file/dir browser]]
-- ref: https://github.com/nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- [[treesitter: syntax highlighting]]
-- ref: https://github.com/nvim-treesitter/nvim-treesitter
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "c", "cpp", "python", "lua" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})


-- [[lsp zero: lsp]]
-- ref: https://github.com/VonHeikemen/lsp-zero.nvim
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  lsp_zero.default_keymaps({buffer = bufnr})
end)


-- [[mason: lsp + dep for lsp zero]]
-- ref: https://github.com/williamboman/mason.nvim
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})


-- [[autopairs: for brackets]]
-- ref: https://github.com/windwp/nvim-autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


-- [[Comment.nvim: for comments]]
-- ref: https://github.com/numToStr/Comment.nvim
require('Comment').setup()


-- [[gitsings: for git]]
-- ref: https://github.com/lewis6991/gitsigns.nvim
require('gitsigns').setup()


-- [[alpha: startup screen]]
-- ref: https://github.com/goolord/alpha-nvim
require('alpha').setup(require('alpha.themes.dashboard').config)


-- [[sync clipboard: for wsl]]
-- ref: https://www.reddit.com/r/neovim/comments/vxdjyb/neovim_in_wsl2_cant_copypaste_tofrom_system/
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
