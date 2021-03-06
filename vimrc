set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/a.vim'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'jeaye/color_coded'
"Plugin 'skywind3000/asyncrun.vim'
Plugin 'fatih/vim-go'
Plugin 'ianva/vim-youdao-translater'
Plugin 'skywind3000/vim-preview'

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
set laststatus=2

let mapleader="\<Space>"

" ycm conf
nnoremap <C-Y>f :YcmCompleter GoToDeclaration<CR>
nnoremap <C-Y>t :YcmCompleter GetType<CR>
let g:ycm_goto_buffer_command = 'new-or-existing-tab'

augroup quickfix
    autocmd!
    " automatic location/quickfix window
    autocmd QuickFixCmdPost [^l]* cwindow 15
    autocmd QuickFixCmdPost    l* lwindow
augroup END

"Gtags
set csprg=gtags-cscope

"cscope conf
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
if has("cscope")
"    if filereadable("cscope.out")
    if filereadable("GTAGS")
       cs add GTAGS
    endif
endif

nnoremap <leader>s <CR> :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>g <CR> :cs find g <C-R>=expand("<cword>")<CR><CR> ?<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>c <CR> :cs find c <C-R>=expand("<cword>")<CR><CR> ?<C-R>=expand("<cword>")<CR><CR>

"quickfix up and down
nnoremap  <leader>n :cnext<CR>
nnoremap  <leader>p :cprev<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"vim-go conf
let g:go_highlight_types=1
let g:go_highlight_methods=1
let g:go_highlight_functions=1
let g:go_highlight_fields=1
let g:go_highlight_function_arguments=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_format_strings=1
let g:go_highlight_variable_assignments=1

"LeaderF conf
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_GtagsAutoGenerate = 1

"YouDaoDict
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

