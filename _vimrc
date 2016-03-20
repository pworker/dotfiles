set encoding=utf-8
"""""""""""""""""""""""""""""
" Plugin : Vundle
"""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/YouCompleteMe'
Bundle 'python.vim'
Bundle 'pyflakes.vim'
Bundle 'bling/vim-airline'
filetype plugin indent on 
filetype on    

"""""""""""""""""""""""""""""
" Colorscheme : Solarized  
"""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""
" Plugin : NERDTree
"""""""""""""""""""""""""""""
"bind F5 to open NERDTree
nnoremap <silent> <F4> :NERDTree<CR>



""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""
:set nu
filetype on
filetype plugin on

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set foldmethod=indent
set foldlevel=99
"Fix backspace
set backspace=indent,eol,start

"""""""""""""""""""""""""""""
"indent-guides
"""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * : hi IndentGuidesEven ctermbg=darkgrey


nnoremap <silent> <F8> :IndentGuidesToggle<CR>





