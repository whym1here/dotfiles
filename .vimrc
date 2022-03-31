set number
syntax on

"learder key
let mapleader = " "

"tab settings
set tabstop=4 "tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab

"remembers previous undo
if has('persistent_undo')
    set undodir=/mnt/e/vim/undo
    set undofile
endif

"smart search
set ignorecase
set smartcase

"search as chars are being typed
set incsearch

"open terminal
nnoremap <leader>t :term<CR>

"bracket complete
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
