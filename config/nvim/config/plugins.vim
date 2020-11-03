"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')
    "Plug 'tomasr/molokai'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'manugildev/vim-material-monokai'
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on
 
