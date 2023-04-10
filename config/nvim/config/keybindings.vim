"""""""""""""""""""""""""""""""""""""""
" KeyBindings
"""""""""""""""""""""""""""""""""""""""
nnoremap <space> <NOP>
let mapleader = " "

imap jk <ESC>l
nnoremap E $
nnoremap B 0
vnoremap E $
vnoremap B 0
" Unmap CTRL+T to avoid Tmux ghosting
nnoremap <C-T> <NOP>
" Use ESC to exit remove highlighted words
nnoremap <silent> <ESC> :noh<CR>
" Shortcuts for resizing pannels
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) + 10)<CR>
nnoremap <silent> <leader>_ :exe "resize " . (winheight(0) - 10)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) + 10)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) - 10)<CR>
" Switch between two files
nnoremap <leader><leader> <C-^>
" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<CR>
" Quickly open/reload vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>kv :vsp $HOME/.config/nvim/config/keybindings.vim<CR>
nnoremap <leader>sc :source $MYVIMRC<CR>
" Faster close and save of files with leader key
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>
" Viw Highlight Group under the current cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Avoid common shift-pressing errors
command! Q q
command! WQ wq
command! W w

"""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""
" Split window
nmap ss :split<Return><C-w>h
nmap sv :vsplit<Return><C-w>l

" Navigate windows
" nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>j
map s<down> <C-w>k
map s<right> <C-w>l
map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l

"""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""
" Coc
"""""""""""""""""""""""""""""""""""""""
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" AutoComplete
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
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
" Snippets
"""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
