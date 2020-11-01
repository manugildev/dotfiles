" List of configuration files
let configs = [
\ 'keybindings.vim',
\ 'plugins.vim'
\ ]

" Configuration directory
let s:nvim_home = '${HOME}/.config/nvim/config'

" Source all configuration files
for f in configs
  exec 'source '.s:nvim_home.'/'.f
endfor

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
" LightVim 
"""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:lightline = { 'colorscheme': 'material_monokai' }


"""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""
let g:fzf_nvim_statusline = 0 
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
let g:NERDTreeChDirMode = 2 " Change root dir to current dir
 

"""""""""""""""""""""""""""""""""""""""
" Coc
"""""""""""""""""""""""""""""""""""""""
let g:coc_node_path='/usr/bin/node'


"""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rs i//=======================================================
                      \======================<ESC>
"  Close cargo terminal using ESC
au BufRead,BufNewFile *cargo* nnoremap <buffer> <Esc> <c-\><c-n> :q!<CR>
