"""""""""""""""""""""""""""""""""""""""
" KeyBindings
"""""""""""""""""""""""""""""""""""""""
nnoremap <space> <Nop>
let mapleader = " "
 
imap jk <ESC>l
map E $
map B 0
" Unmap CTRL+T to avoid Tmux ghosting
nnoremap <C-T> <Nop>
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

" AutoComplete
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

