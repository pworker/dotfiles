set encoding=utf-8
set number
set ts=4
set expandtab
set shiftwidth=4
set cursorline
set cursorcolumn
set showmatch
let python_highlight_all = 1


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',  { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-airline/vim-airline'
Plug 'python-mode/python-mode'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()


"""""""""""""""""""""""""""""
" Plugin : NERDTree
"""""""""""""""""""""""""""""
"bind F4 to open NERDTree
nnoremap <silent> <F4> :NERDTree<CR>


""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
let g:airline#extensions#ale#enabled = 1

"function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"
"    return l:counts.total == 0 ? 'OK' : printf(
"    \   '%dW %dE',
"    \   all_non_errors,
"    \   all_errors
"    \)
"endfunction
"
"set statusline=%{LinterStatus()}
"
"function! CurDir()
"    let curdir = substitute(getcwd(), '/Users/pworker/', "~/", "g")
"    return curdir
"endfunction
"
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    else
"        return ''
"    endif
"endfunction


autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
