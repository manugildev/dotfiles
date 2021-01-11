"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')
    " Editor
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'psliwka/vim-smoothie'
    Plug 'Yggdroot/indentLine'

    " Theme
    Plug 'manugildev/vim-material-monokai'

    " Language
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rust-lang/rust.vim'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'tikhomirov/vim-glsl'
    Plug 'cespare/vim-toml'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on
 
