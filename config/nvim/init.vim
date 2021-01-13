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
let g:materialmonokai_italic=1
"let g:materialmonokai_gui_italic = 1

"Crc/main.rs
":NERDTree
"orscheme moonfly
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
set relativenumber
set number
set ignorecase 
""" Tabs
set tabstop=4 
set shiftwidth=4
set expandtab
set autoindent
set smartindent
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
" Search
set smartcase
set showmatch
set matchtime=3
set nobackup
set undofile
set undodir=~/.vim/undodir
" Set the clipboard as the main register
set clipboard+=unnamed 
" Enable mouse support
set mouse=a
let g:smoothie_base_speed=38

"""""""""""""""""""""""""""""""""""""""
" LightVim 
"""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'material_monokai',
            \ 'component_function': {
            \   'filename': 'FilenameForLightline' }
            \ }

" Show full path of filename
function! FilenameForLightline()
    let full_dir = expand('%:p:h')
    let folders = split(full_dir, '/')[0:-2]
    let reduced_path = '/'
    for i in folders
        " Get only first letter unless is a hiden folder
        if i[0] == "."
            let reduced_path .= i[0:1].'/'
        else
            let reduced_path .= i[0].'/'
        endif
    endfor
    return reduced_path.expand('%:p:h:t').'/'.expand('%:t')
endfunction

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

let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Hide fzf status line
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif

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

" Column based on rust fmt
au Filetype rust set colorcolumn=100

" Highlight TODO, FIXME, NOTE, etc.
" if has("autocmd")
"    if v:version > 701
"      autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
"      autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
"    endif
" endif

" Rust Function Folding
function! MakeRustFuncDefs()
    let b:RustFuncDefs = []

    let lnum = 1
    while lnum <= line('$')
        let current_line = getline(lnum)
        if match(current_line, '^ *\(pub \)\?fn') > -1
            call AddRustFunc(lnum)
        endif

        let lnum += 1
    endwhile
endfunction

function! AddRustFunc(lnum)
    let save_pos = getpos('.')
    call setpos('.', [0, a:lnum, 1, 0])

    call search('{')
    let start_lnum = line('.')

    let end_lnum = searchpair('{', '', '}', 'n')
    if end_lnum < 1
        call setpos('.', save_pos)
        return
    endif

    call add(b:RustFuncDefs, [start_lnum, end_lnum]);
    call setpos('.', save_pos)
endfunction

function! RustFold()
    if !exists("b:RustFuncDefs")
        call MakeRustFuncDefs()
    endif

    for [start_lnum, end_lnum] in b:RustFuncDefs
        if start_lnum > v:lnum
            return 0
        endif

        if v:lnum == start_lnum + 1
            return ">1"
        elseif v:lnum == end_lnum -1
            return "<1"
        elseif v:lnum > start_lnum && v:lnum < end_lnum - 1
            return "="
        endif
    endfor
endfunction

"autocmd FileType rust setlocal foldmethod=expr foldexpr=RustFold()
