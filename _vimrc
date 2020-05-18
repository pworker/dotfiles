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

"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree'                                 " Project and file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'                                   " Class/module browser
Plug 'tpope/vim-fugitive'                                  " Git
"-------------------=== Other ===-------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
"-------------------=== Languages support ===-------------------
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
 "-------------------=== Python  ===-----------------------------

call plug#end()



"=====================================================
" Plugin : NERDTree
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']    " Ignore files in NERDTree
let NERDTreeWinSize=40

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
let g:tagbar_width=32
autocmd BufEnter *.py :call tagbar#autoopen(0)

"=====================================================
"" Python settings
"=====================================================

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}

augroup LspAutoFormatting
    autocmd!
    autocmd BufWritePre *.py LspDocumentFormatSync
augroup END

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
let base16colorspace=256
colorscheme base16-helios

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
set mouse=a

"set clipboard=unnamed                       " use system clipboard

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <silent> <F9> :bprev<CR>
nmap <silent> <F10> :bnext<CR>
nmap <silent> <F4> :NERDTreeToggle<CR>
let maplocalleader = "\\"
nnoremap <C-]> :<C-u>LspDefinition<CR>
nnoremap K :<C-u>LspHover<CR>
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
