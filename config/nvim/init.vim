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
filetype off
syntax on
set nocompatible
colorscheme material-monokai
set termguicolors
set background=dark
set relativenumber
set number
set ignorecase 
""" Tabs
set tabstop=4 
set shiftwidth=4
set expandtab
" Vertical center align to current line
set scrolloff=999
" set cursorline
" set lazyredraw
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
set undofile
set undodir=~/.vim/undodir
" Set the clipboard as the main register
set clipboard+=unnamed 
 

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

" Faster close and save of files with leader key
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

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
let g:coc_node_path='/usr/bin/node'
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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rs i//=======================================================
                      \======================<ESC>
"  Close cargo terminal using ESC
au BufRead,BufNewFile *cargo* nnoremap <buffer> <Esc> <c-\><c-n> :q!<CR>
