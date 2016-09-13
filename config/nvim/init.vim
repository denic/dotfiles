" ########## PLUGINS #####################
call plug#begin('~/.vim/plugged')

" --- HAProxy ---
Plug 'sclo/haproxy.vim'

" --- Elixir-Lang ---
Plug 'elixir-lang/vim-elixir'
" Plug 'carlosgaldino/elixir-snippets'
Plug 'slashmili/alchemist.vim'
Plug 'thinca/vim-ref'
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" --- Snippets ---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jordwalke/VimJSDocSnippets'
Plug 'chrisgillis/vim-bootstrap3-snippets'

" JS
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'majutsushi/tagbar'

" --- git integration ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- Colorschemes ---
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

" Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-bufferline'
Plug 'ihacklog/HiCursorWords'
Plug 'tmhedberg/matchit'

" insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" MISC
Plug 'triglav/vim-visual-increment'
Plug 'neomake/neomake'

" Add plugins to &runtimepath
call plug#end()

" ########## MISC #####################

let g:airline_powerline_fonts = 1

set rnu

set hlsearch
set incsearch

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

let g:tern_map_keys=1

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" LOCAL-VIM-RC: Store and restore decisions only if the answer was given in upper case (Y/N/A).
let g:localvimrc_persistent=1

" ########## SYNTASTIC ################
let g:syntastic_javascript_checkers = ['eslint']
nnoremap <silent> <C-e> :Errors<CR>

" ########## MAPPINGS #################

" Configure YouCompleteMe.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview

" Configure Ultisnips.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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

" Window resizing mappings
map <up> <C-W>-
map <down> <C-W>+
map <left> <c-w><
map <right> <c-w>>


" narrow the list down with a word under cursor
nnoremap <silent> <Leader>, :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMixed<cr>

let g:ctrlp_funky_syntax_highlight = 1

" TagBar
nmap <F8> :TagbarToggle<CR>

" "########## The Silver Searcher #####################
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

command FormatJSON :%!python -mjson.tool

augroup elixir
    autocmd!
    let g:UltiSnipsJumpForwardTrigger='<tab>'
    " autocmd FileType elixir setlocal tags+=/Users/hq1/dev/elixir/tags

    autocmd FileType eelixir setlocal textwidth=0
    autocmd FileType eelixir setlocal wrapmargin=0

    let g:neomake_serialize = 1
    let g:neomake_serialize_abort_on_error = 1

    let g:neomake_elixir_mix_maker = {
                \ 'exe': 'mix',
                \ 'args': ['compile', '%:p', '--warnings-as-errors'],
                \ 'errorformat':
                \ '** %s %f:%l: %m,' .
                \ '%f:%l: warning: %m'
                \ }

    let g:neomake_elixir_lint_maker = {
                \ 'exe': 'mix',
                \ 'args': ['credo', 'list', '%:p', '--one-line', '-i', 'readability'],
                \ 'errorformat': '[%t] %. %f:%l:%c %m'
                \ }

    let g:neomake_elixir_enabled_makers = ['mix', 'lint']
    let g:neomake_open_list = 2
    let g:neomake_list_height = 4
    let g:neomake_serialize = 1
    let g:neomake_serialize_abort_on_error = 1
    let g:neomake_verbose = 2

    autocmd BufWritePost *.ex Neomake
    autocmd BufWritePost *.exs Neomake

    let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
    \ }

    " let test#strategy = 'tslime'
    " nnoremap <leader>tf :TestFile<CR>
    " nnoremap <leader>tt :TestNearest<CR>
    " nnoremap <leader>tl :TestLast<CR>
    " nnoremap <leader>tv :TestVisit<CR>
    " nnoremap K :call Exdoc()<CR>

    " bits stolen from alchemist-vim and slightly modified 
    function! Exdoc(...) 
        let query = ''
        if empty(a:000)
            let query = Lookup_name_under_cursor()
        else
            let query = a:000[0]
        endif
        silent! execute 'botright new'
        call termopen('elixir -e "require IEx.Helpers; IEx.Helpers.h '.query.'"')
        execute 'nnoremap <buffer> q :bd!<cr>'
    endfunction

    function! Lookup_name_under_cursor()
        "looking for full function/module string
        "ex. OptionParse.parse
        "ex. GenServer
        "ex. List.Chars.Atom
        "ex. {:ok, Map.new}
        "ex. Enum.map(&Guard.execute(&1))
        "ex. Enum.all?(&(&1.valid?))
        let module_func_match = '[A-Za-z0-9\._?!]\+'
        let before_cursor = strpart(getline('.'), 0, col('.'))
        let after_cursor = strpart(getline('.'), col('.'))
        let elixir_erlang_module_func_match = ':\?' . module_func_match
        let before_match = matchlist(before_cursor, elixir_erlang_module_func_match . '$')
        let after_match = matchlist(after_cursor, '^' . module_func_match)
        let query = ''
        let before = ''
        if len(before_match) > 0
            let before = before_match[0]
        endif
        let after = ''
        if len(after_match) > 0
            let after = after_match[0]
        endif
        if before =~ '\.$'
            "case before = List.Chars. after = to_char_list
            let query = substitute(before, '[.]$', '', '')
        elseif after =~ '^\.'
            "case before = List.Chars  after = .to_char_list
            let query = before
        elseif after =~ '.*\.'
            "case before = OptionParse after = r.parse
            "case before = Mix.Shel    after = l.IO.cmd
            let up_to_dot = matchlist(after, '\([A-Za-z0-9_]\+\)\.')
            let query = before . up_to_dot[1]
        else
            let query = before . after
        endif
        return query
    endfunction
augroup END
