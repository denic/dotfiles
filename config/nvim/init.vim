" ########## PLUGINS #####################
call plug#begin('~/.vim/plugged')

" HAProxy
Plug 'sclo/haproxy.vim'

" Elixir-Lang
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets'
Plug 'jordwalke/VimJSDocSnippets'

" JS
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'rking/ag.vim'
Plug 'Sclarki/neonwave.vim'
Plug 'sickill/vim-monokai'
Plug 'vim-scripts/Relaxed-Green'
Plug 'vim-scripts/blackdust.vim'
Plug 'vim-scripts/summerfruit256.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-bufferline'

" Add plugins to &runtimepath
call plug#end()

" ########## MISC #####################

let g:airline_powerline_fonts = 1

set rnu

set hlsearch
set background=dark
colorscheme gruvbox

" highlight current line
set cursorline

set autoindent
" set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap

" ########## MAPPINGS #################

" change the mapleader from \ to ,
let mapleader=","

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" NERDTree
map <silent> <leader>n :NERDTreeToggle<CR>

" Window resizing mappings
map <up> <C-W>-
map <down> <C-W>+
map <left> <c-w><
map <right> <c-w>>
