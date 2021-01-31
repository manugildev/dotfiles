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

    
    " Language
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rust-lang/rust.vim'
    Plug 'tikhomirov/vim-glsl'
    Plug 'cespare/vim-toml'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Custom
    Plug 'manugildev/vim-material-monokai' " Theme
    Plug 'manugildev/vim-rust-syntax-ext'  " Rust proper syntax
call plug#end()
filetype plugin indent on
 
