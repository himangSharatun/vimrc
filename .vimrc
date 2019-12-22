set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'lifepillar/vim-solarized8'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'jlanzarotta/bufexplorer'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neoclide/coc.nvim'

"---- Go Suppport ----------------------------------------------------
Plugin 'fatih/vim-go'
Plugin 'sebdah/vim-delve'

" ---- Shell integration ---------------------------------------------
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on
set background=dark
set termguicolors
colorscheme solarized8_high

set updatetime=300

" Folding method
" set foldmethod=indent

" Tab length
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Display indentation guides
" set list listchars=tab:|-,trail:·,extends:»,precedes:«,nbsp:x
 
" Delete trailing white space on write
func! DeleteTrailingWS()
	normal mZ
	%s/\s\+$//ge
	normal `Z
endfunc
             
" ----- Split Config ----------------------------------------------
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j
" map <C-K> <C-W>k
set splitright
set splitbelow

" ----- NERDTree Config ----------------------------------------------
map <F6> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----- CTRLP Config ----------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore='\v[\/](vendor|node_modules|target|dist|\.git)|(\.(swp|ico|gif|svn))$'

" ----- COC-GOPLS Config ----------------------------------------------
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
