""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""
filetype off " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" my bundles
" required
Bundle 'gmarik/vundle'

" utility
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'winmanager'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'a.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'superSnipMate'
Bundle 'Conque-Shell'
Bundle 'FencView.vim'

"ftplugin
Bundle 'OmniCppComplete'
Bundle 'pyflakes.vim'
Bundle 'xml.vim'

" syntax
Bundle 'python.vim'

"colors
Bundle 'colorer-color-scheme'

filetype plugin indent on " required

