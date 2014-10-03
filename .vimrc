set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" tern_for_vim
Plugin 'marijnh/tern_for_vim'

" Syntastic
Plugin 'scrooloose/syntastic'

" DelimitMate
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" NERD Tree
Plugin 'scrooloose/nerdtree'

" vim-javascript
Plugin 'pangloss/vim-javascript'

"vim-javascript-syntax
Plugin 'jelera/vim-javascript-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number              " line numbers
colorscheme desert      " colorscheme desert
set nobackup            " get rid of anoying ~file
