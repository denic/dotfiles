call plug#begin('~/.local/share/nvim/plugged')

" --- # PLUGINS ---

Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-surround'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'thinca/vim-localrc'
Plug 'mklabs/mdn.vim'
Plug 'dkarter/bullets.vim'

Plug 'IN3D/vim-raml'

" --- ## JavaScript ---
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/jsdoc-syntax.vim'

" --- ## React ---
Plug 'mxw/vim-jsx'
Plug 'justinj/vim-react-snippets'
Plug 'cristianoliveira/vim-react-html-snippets'

" --- ## Snippets ---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'jordwalke/VimJSDocSnippets'
Plug 'chrisgillis/vim-bootstrap3-snippets'
"
" --- ## git integration ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- ## colorschemes ---
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'rking/ag.vim'
Plug 'sickill/vim-monokai'
Plug 'vim-scripts/Relaxed-Green'
Plug 'vim-scripts/blackdust.vim'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nightsense/simplifysimplify'
Plug 'nightsense/wonka'
Plug 'rakr/vim-one'
Plug 'skreek/skeletor.vim'
Plug 'tjammer/blayu.vim'
Plug 'szorfein/fromthehell.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()

" --- # CONFIG ---

let g:airline_powerline_fonts = 1

set rnu

set hlsearch
set incsearch

" highlight current line
set cursorline

set autoindent
" set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set nowrap

" if hidden not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" LOCAL-VIM-RC: Store and restore decisions only if the answer was given in upper case (Y/N/A).
let g:localvimrc_persistent=1

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
nmap <F11> :NERDTreeFind<CR>


" CtrlP Funky
" let g:ctrlp_funky_syntax_highlight = 1
nnoremap <leader>f :CtrlPFunky<CR>

" narrow the list down with a word under cursor
nnoremap <silent> <Leader>, :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMixed<cr>

" TagBar
nmap <F8> :TagbarToggle<CR>

" JSON format
command FormatJSON :%!python -mjson.tool

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

if has('gui_running')
  set guioptions-=T  " no toolbar
  set lines=60 columns=108 linespace=0
  set guifont=DejaVu\ Sans\ Mono\ 10
else
    if &term =~ '256color'
        " disable Background Color Erase (BCE) so that color schemes
        " render properly when inside 256-color tmux and GNU screen.
        " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
        set t_ut=
    endif

    " let g:one_allow_italics = 1 " I love italic for comments

    set background=dark
    let g:gruvbox_contrast_dark = 'soft'
    " let g:airline_theme='seoul256'
    colorscheme gruvbox 

    " set termguicolors
endif
