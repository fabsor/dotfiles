set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'Quramy/tsuquyomi'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'StanAngeloff/php.vim'
Plugin 'ianks/vim-tsx'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
syntax on
