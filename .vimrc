call plug#begin()
 " Plug 'dracula/vim'
 " Visual
 Plug 'morhetz/gruvbox'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " Stuff I like
 Plug 'ryanoasis/vim-devicons'
 Plug 'mhinz/vim-startify'
 Plug 'preservim/nerdtree'
 " React and typscript
 " Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

map <SPACE> <leader>
set expandtab
set ts=4 sw=4
set guifont=fonts-hack-ttf
set modelines=5
let g:airline_theme='simple'
let g:deoplete#enable_at_startup = 1
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <leader>a :! git add %
nnoremap <leader>f :vim <C-R>" * <CR>
:map <C-t> :NERDTree <CR>
:map <leader>t :tabnew <CR>
:map <leader>gd :w !diff % - <CR>
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$

"Run command based on filetype!
"
autocmd FileType groovy nnoremap <F10> :w<CR>:!groovy %<CR>
autocmd FileType python nnoremap <F10> :w<CR>:!python %<CR>
autocmd FileType bash nnoremap <F10> :w<CR>:!bash %<CR>
autocmd FileType md nnoremap <F10> :w<CR>:!bat %<CR>

autocmd FileType python nnoremap <F8> :w<CR>:!pylint %<CR>
" Run pylint on save for Python files
autocmd BufWritePost *.py !pylint %
autocmd BufWritePost *.groovy !npm-groovy-lint -l warning warning --failon error %
"
"Copilot mappings for vim

inoremap <silent><script><expr> <PageUp> copilot#Previous()
inoremap <silent><script><expr> <PageDown> copilot#Next()
inoremap <silent><script><expr> <Home> copilot#Accept()
inoremap <silent><script><expr> <End> copilot#Dismiss()


function Escape()
  if pumvisible()
    return "\<c-e>"
  else
    call feedkeys("\<esc>","nit")
    return ""
  endif
endfunction

" For local replace
nnoremap gr gd[{V%::s/\<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/\<C-R>///gc<left><left><left>
"
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Tab> pumvisible() ? "<C-n>" :"<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" :"<S-Tab>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <esc> pumvisible() ? "<C-e>" : Escape()
"
" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
" colorscheme evening
"colorscheme dracula
"colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
"open new split panes to right and below

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

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8 " TextEdit might fail if hidden is not set.  set hidden Some servers have issues with backup files, see #649.  set nobackup set nowritebackup Give more space for displaying messages.  set cmdheight=2 Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.  set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! AddGngsTags()
    let gngs_tags = "/home/alex/vcgs/groovy-ngs-utils/src/tags"
    if filereadable(gngs_tags)
      execute "set tags+=" . gngs_tags
    endif
endfunction

function! AddTags()
  let cwd = getcwd()
  if cwd =~# '/home/alex/vcgs/giphub/routes/**'
    let camel_tags = "/home/alex/vcgs/giphub/camelpack/src/tags"
    if filereadable(camel_tags)
      execute "set tags+=" . camel_tags
    endif
    let gngs_tags = "/home/alex/vcgs/groovy-ngs-utils/src/tags"
    if filereadable(gngs_tags)
      execute "set tags+=" . gngs_tags
    endif
  endif
endfunction

au BufNewFile,BufRead *.nf set filetype=groovy
au BufNewFile,BufRead *.nf.test set filetype=groovy
au BufNewFile,BufRead nextflow.config set filetype=groovy
au BufNewFile,BufRead bpipe.config set filetype=groovy
