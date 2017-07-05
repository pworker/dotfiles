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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',  { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'python-mode/python-mode'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'updated' || a:info.force
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
let g:airline#extensions#ale#enabled = 1


autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
