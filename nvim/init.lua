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
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- configs...
    end,
  },
  { 
    'echasnovski/mini.statusline', 
    version = '*' 
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


-- [[cmp: completion]]
-- ref: https://github.com/hrsh7th/nvim-cmp
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

-- [[neovim: reset cursor]]
-- ref: https://github.com/alacritty/alacritty/issues/5450
-- vim.api.nvim_create_autocmd("ExitPre", {
--   group = vim.api.nvim_create_augroup("Exit", { clear = true }),
--   command = "set guicursor=a:hor20-blinkwait100-blinkoff100-blinkon100", -- a:hor20-Cursor", default = a:ver90
--   desc = "Set cursor back to beam when leaving Neovim."
-- }) 

-- [[presistant save]]
-- ref: https://toddknutson.bio/posts/how-to-enable-neovim-undo-backup-and-swap-files-when-switching-linux-groups/
USER = os.getenv("USER")
local curr_group = vim.fn.system("id -ng 2> /dev/null | tr -d '\n'")

SWAPDIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/swap//"
BACKUPDIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/backup//"
UNDODIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/undo//"

if vim.fn.isdirectory(SWAPDIR) == 0 then
	vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
	vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end

-- Enable swap, backup, and persistant undo
vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})


-- [[barbecue.nvim: VS Code like winbar]]
-- ref: https://github.com/utilyre/barbecue.nvim
vim.opt.updatetime = 200 -- triggers CursorHold event faster
require("barbecue").setup({
  create_autocmd = false, -- prevent barbecue from updating itself automatically
})
vim.api.nvim_create_autocmd(
  {
    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",

    -- include this if you have set `show_modified` to `true`
    "BufModifiedSet",
  }, 
  {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
      require("barbecue.ui").update()
    end,
  }
)


-- [[tabby.nvim: tabui]] 
-- ref: https://github.com/nanozuki/tabby.nvim
local tabline_theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = tabline_theme.head },
      line.sep('|', tabline_theme.head, tabline_theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and tabline_theme.current_tab or tabline_theme.tab
      return {
        line.sep('|', hl, tabline_theme.fill),
        tab.is_current() and '' or '󰆣',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep('|', hl, tabline_theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('|', tabline_theme.win, tabline_theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('|', tabline_theme.win, tabline_theme.fill),
        hl = tabline_theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('|', tabline_theme.tail, tabline_theme.fill),
      { '  ', hl = tabline_theme.tail },
    },
    hl = tabline_theme.fill,
  }
end)

-- [[mini-statusline: status line]]
-- ref: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md
require('mini.statusline').setup()

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

