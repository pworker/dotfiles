set nocompatible                                           " Be iMproved

"=====================================================
"" VIM-plug settings
"=====================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

function! BuildYCM(info)
  if a:info.status == 'updated' || a:info.force
    !./install.py
  endif
endfunction

"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }   " Project and file navigation
Plug 'Xuyuanp/nerdtree-git-plugin',  { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'                                   " Class/module browser
Plug 'ctrlpvim/ctrlp.vim'                                      " Fast transitions on project files
Plug 'tpope/vim-fugitive'                                  " Git
"-------------------=== Other ===-------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
"-------------------=== Languages support ===-------------------
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
 "-------------------=== Python  ===-----------------------------

call plug#end()



"=====================================================
" Plugin : NERDTree
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']    " Ignore files in NERDTree
let NERDTreeWinSize=40
nnoremap <silent> <F4> :NERDTree<CR>                       "bind F4 to open NERDTree

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#ale#enabled = 1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" Python settings
"=====================================================



"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
let base16colorspace=256
colorscheme base16-solarized-dark

set number                                  " show line numbers

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start), Fix macOS backspace

set scrolloff=10                            " let 10 lines before/after cursor during scroll

"set clipboard=unnamed                       " use system clipboard

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
