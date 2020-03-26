" --- # PLUGINS ---
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mileszs/ack.vim'

Plug 'liuchengxu/eleline.vim'
Plug 'vim-airline/vim-airline-themes'

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

" --- ## Elixir ---
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" --- ## JavaScript ---
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'

" --- ## Typescript ---
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

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
Plug 'rakr/vim-two-firewatch'
Plug 'xero/blaquemagick.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

