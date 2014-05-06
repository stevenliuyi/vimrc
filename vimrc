" ----------------------------------------
" general
" ----------------------------------------
set history=100
set nocompatible
set autoread                    " auto read when file is changed outside
filetype plugin on              " enable filetype plugins
filetype indent on
let mapleader= ","              " <leader> key
let g:mapleader = ","           " <leader> key
let maplocalleader = ","        " <localleader> key
set encoding=utf8

" ----------------------------------------
" user interface
" ----------------------------------------
set ruler
set number
set scrolloff=5
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" status line
set laststatus=2

" clear highlighting
nnoremap <CR> :noh<CR><CR>

" ----------------------------------------
" tab and indent
" ----------------------------------------
set autoindent
set smartindent
set expandtab
set smarttab

" 4 spaces for 1 tab
set shiftwidth=4
set tabstop=4

" ----------------------------------------
" moving
" ----------------------------------------
" treat long lines as break lines
map j gj
map k gk

" move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" using Command+[jk] on mac
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" insert mode navigation
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" ----------------------------------------
" plugin manager
" ----------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/VimIM'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on


" ----------------------------------------
" plugin settings
" ----------------------------------------
" vimim
let g:vimim_cloud=-1 
let g:vimim_toggle=-1
let g:vimim_punctuation=3                       " including quotation marks
set pastetoggle=<C-h>

" surround
let b:surround_{char2nr("i")} = "_\r_"          " markdown italic
let b:surround_{char2nr("s")} = "**\r**"        " markdown bold
nmap <leader>i viwSiW
imap <leader>i <ESC>viwSiWa
nmap <leader>b viwSsW
imap <leader>b <ESC>viwSsWa

" easymotion
let g:EasyMotion_leader_key='f'

" difference between the current buffer and the file it was loaded from
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

" ----------------------------------------
" mappings
" ----------------------------------------
" switch colon and semicolon
nnoremap ; :
nnoremap : ;

" ----------------------------------------
" functions
" ----------------------------------------
" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
