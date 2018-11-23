set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'jeaye/color_coded'
"Plugin 'skywind3000/asyncrun.vim'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

colorscheme desert
syntax on
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set backspace=indent,eol,start
set hlsearch
set colorcolumn=100

nnoremap <C-F> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-T> :YcmCompleter GetType<CR>
let g:ycm_goto_buffer_command = 'new-or-existing-tab'

augroup quickfix
    autocmd!
   " automatic location/quickfix window
    autocmd QuickFixCmdPost [^l]* cwindow 15
    autocmd QuickFixCmdPost    l* lwindow
augroup END

set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap qn :cnext<CR>
nnoremap qp :cprev<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
