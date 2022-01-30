call plug#begin()
 " Plugin Section
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'mhinz/vim-startify'
 Plug 'junegunn/fzf'
 Plug 'tpope/vim-surround'
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
 Plug 'zchee/deoplete-jedi'
 Plug 'rbgrouleff/bclose.vim'
 Plug 'francoiscabrol/ranger.vim'
call plug#end()

let g:deoplete#enable_at_startup = 1
map <leader>F :RangerNewTab<CR> :inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>
:map <leader>z :FZF ~ <CR>
:map <leader>t :tabnew <CR>
nmap <leader>s :split term
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$

" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
" colorscheme evening
colorscheme dracula
" open new split panes to right and below

set splitright
set splitbelow

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


