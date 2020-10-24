set nocompatible
filetype off
 
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
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
call plug#end()
filetype plugin indent on
 
"""""""""""""""""""""""""""""""""""""""
" Theme / Editor Settings
"""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme material-monokai
set termguicolors
set background=dark
set relativenumber
set ignorecase 
""" Tabs
set tabstop=4 
set shiftwidth=4
set expandtab
" Vertical center align to current line
set scrolloff=999
" set cursorline
set lazyredraw
set wildmenu
set colorcolumn=80
set nowrap
" Make the shell work when nvim.app is opened
let &shell='/bin/zsh -i --login'
set splitbelow
set splitright
set timeout timeoutlen=300
set showmatch
set matchtime=3
set nobackup
set undodir=~/.vim/undodir
set undofile
 
"""""""""""""""""""""""""""""""""""""""
" KeyBindings
"""""""""""""""""""""""""""""""""""""""
nnoremap <space> <Nop>
let mapleader = " "
 
imap jk <ESC>l
map E $
map B 0
" Use ESC to exit remove highlighted words
nnoremap <silent> <ESC> :noh<CR>
" Shortcuts for resizing pannels
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) + 10)<CR>
nnoremap <silent> <leader>_ :exe "resize " . (winheight(0) - 10)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) + 10)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) - 10)<CR>
 
" Quickly open/reload vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>  
 
" Avoid common shift-pressing errors
command! Q q
command! WQ wq
command! W w
 
" Disable scroll wheel (lags sometimes)
map <ScrollWheelUp> <nop>
map <S-ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <S-ScrollWheelDown> <nop>
 
nnoremap <leader><Up> :silent! let &guifont = substitute( \ &guifont, \ ':h\zs\d\+', \ '\=eval(submatch(0)+1)', \ '')<CR>
nnoremap <leader><Down> :silent! let &guifont = substitute( \ &guifont, \ ':h\zs\d\+', \ '\=eval(submatch(0)-1)', \ '')<CR>
 
"""""""""""""""""""""""""""""""""""""""
" MarkDown
"""""""""""""""""""""""""""""""""""""""
 
"""""""""""""""""""""""""""""""""""""""
" LightVim 
"""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:lightline = { 'colorscheme': 'material_monokai' }
 
"""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
 
let g:fzf_nvim_statusline = 0 
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
let g:fzf_colors = { 'fg':      ['fg', 'Normal'],
                   \ 'bg':      ['bg', 'Normal'],
                   \ 'hl':      ['fg', 'String'],
                   \ 'hl+':     ['fg', 'Statement'],
                   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                   \ 'info':    ['fg', 'Keyword'],
                   \ 'border':  ['fg', 'Ignore'],
                   \ 'prompt':  ['fg', 'Statement'],
                   \ 'pointer': ['fg', 'Statement'],
                   \ 'marker':  ['fg', 'Keyword'],
                   \ 'spinner': ['fg', 'Label'],
                   \ 'header':  ['fg', 'Comment']
                   \ }
let g:fzf_layout = {'window' : {'width' : 0.8, 'height' : 0.8}}
let $FZF_DEFAULT_OPTS = '--reverse'
 
"""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2 " Change root dir to current dir
 
"""""""""""""""""""""""""""""""""""""""
" Coc
"""""""""""""""""""""""""""""""""""""""
let g:coc_node_path='/usr/local/bin/node'
" GoTo code navigation.
nnoremap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
 
"""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rs i//=======================================================
                      \======================<ESC>
"  Close cargo terminal using ESC
au BufRead,BufNewFile *cargo* nnoremap <buffer> <Esc> <c-\><c-n> :q!<CR>
