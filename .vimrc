""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""
filetype off " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""" required
Bundle 'gmarik/vundle'

""""" utility
Bundle 'taglist.vim'
Bundle 'Tagbar'
" Plugin to add tab bar ( derived from miniBufExplorer).
Bundle 'TabBar'
Bundle 'winmanager'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'a.vim'
Bundle 'DoxygenToolkit.vim'
"Bundle 'superSnipMate'
Bundle 'Conque-Shell'
Bundle 'FencView.vim'
" XP's Snippet Template engine for vim
" for<C-\>
Bundle 'xptemplate'
Bundle 'vim4program/template_loader'
" Ultimate auto completion system for Vim
Bundle 'neocomplcache'
" Automatic syntax checking
Bundle 'Syntastic'
" Visually shows the location of marks
" \mt : Toggles ShowMarks on and off.
" \mh : Hides an individual mark.
" \ma : Hides all marks in the current buffer.
" \mm : Places the next available mark.
Bundle 'ShowMarks7'
" Vim script for text filtering and alignment
" :Tabularize /,
Bundle 'Tabular'

""""" ftplugin
" Bundle 'OmniCppComplete'
Bundle 'pyflakes.vim'
Bundle 'xml.vim'

""""" syntax
Bundle 'python.vim'
" A plugin for visually displaying indent levels in Vim.
" Usage: <Leader>ig
Bundle 'Indent-Guides'

""""" colors
Bundle 'colorer-color-scheme'

filetype plugin indent on " required

""""""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""""""
" encodings
" auto
let g:fencview_autodetect = 1
" manual
"set fenc=cp936
"set enc=cp936
"set fenc=utf-8
"set enc=utf-8
"set fencs=cp936,ucs-bom,utf-8,gb18030,big5,euc-jp,sjis,euc-kr,ucs-21e,lation1
"let &termencoding=&encoding

" Syntax highlighting
syntax on

" disable vi compatible
set nocompatible

" enable file type detection
filetype on

" enable loading the plugin files for specific file type
filetype plugin on

" enable loading the indent files for specific file type
filetype indent on

" color theme
colorscheme colorer

" wildmode
set wildmenu
set wildmode=list:longest,full

" automatically read file when it has been changed
set autoread

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

set novisualbell
set noerrorbells

""""""""""""""""""""""""""""""""""""""""""""
" search settings
""""""""""""""""""""""""""""""""""""""""""""
" ignore the case of normal letters 
"set ignorecase

" hilight the matching text
set hlsearch

" The matched string is highlighted when typing
set incsearch

""""""""""""""""""""""""""""""""""""""""""""
" status line settings
""""""""""""""""""""""""""""""""""""""""""""
" display status line
set laststatus=2
" customize status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

""""""""""""""""""""""""""""""""""""""""""""
" indent settings
""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4

" replace tab with spaces
"set expandtab
" copy indent from current line when starting a new line
set autoindent

" C-like indent
"set smartindent
"set cindent

" my indent function
function! MyCppIndent()
	setl tabstop=4
	setl softtabstop=4
	setl shiftwidth=4
	setl cino=t0,g0,:0,(0,w1
	setl expandtab
	setl smartindent
endfunction

au BufEnter *.cxx setf cpp
au BufEnter *.c++ setf cpp
au BufEnter *.ipp setf cpp
au BufEnter *.cc setf cpp
au BufEnter *.h setf cpp
au BufEnter *.hpp setf cpp

" call MyCppIndent() according to file type
au FileType c,cpp call MyCppIndent()

""""""""""""""""""""""""""""""""""""""""""""
" autocmd settings
""""""""""""""""""""""""""""""""""""""""""""
" dispaly line number
au FileType xml,html,c,java,perl,shell,bash,cpp,python,vim,php,ruby set number

""""""""""""""""""""""""""""""""""""""""""""
" keybinding
""""""""""""""""""""""""""""""""""""""""""""
" insert match bracket/quote automatically
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
au FileType xml,html,c,cpp,java,python,shell,perl,php inoremap ' ''<ESC>i
au FileType xml,html,c,cpp,java,python,shell,perl,php inoremap ' <c-r>=ClosePair("'")<CR>
au FileType xml,html,c,cpp,java,python,shell,perl,php inoremap " ""<ESC>i
au FileType xml,html,c,cpp,java,python,shell,perl,php inoremap " <c-r>=ClosePair('"')<CR>

""""""""""""""""""""""""""""""""""""""""""""
" templates
""""""""""""""""""""""""""""""""""""""""""""
let g:template_load = 1 
let g:template_tags_replacing = 1 
let g:T_AUTHOR = "sushanghai"
let g:T_AUTHOR_EMAIL = "shanghai.sush@alibaba-inc.com"
let g:T_AUTHOR_WEBSITE = "http://www.alibaba.com"
let g:T_DATE_FORMAT = "%F %T"

""""""""""""""""""""""""""""""""""""""""""""
" ctags and cscope
""""""""""""""""""""""""""""""""""""""""""""
function! GenerateTags()
	let tmp_dir = "$HOME/.vim/tmp"
	let dir = getcwd()

	if exists(tmp_dir)
		call mkdir(tmp_dir)
	endif

	if(executable('cscope') && has('cscope'))
		sil! exec '!find ' . dir . ' -name "*.cpp" -o -name "*.hpp" -o -name "*.h" -o -name "*.c"> ' . tmp_dir . '/cscope.files'
		let l:cs_cmd = 'cd ' . tmp_dir . ' && cscope -bkq -i cscope.files'
		sil! echo system(l:cs_cmd)
		exec '!ctags -L ' . tmp_dir .'/cscope.files --extra=+q --fields=+iaS --c++-kinds=+p --verbose=yes -f ' . tmp_dir . '/tags'
		cs kill 0
		cs add ~/.vim/tmp/cscope.out
		set tags+=~/.vim/tmp/tags
	endif
endfunction

map <F8> :call GenerateTags()<CR>

" fold
set foldmethod=syntax
set foldnestmax=2

""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""
" NERD tree
nmap nt :NERDTreeToggle<CR>

" taglist
nmap tl :Tlist<cr>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Syntastic
let g:syntastic_check_on_open=1

" winmanager
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

let g:winManagerWindowLayout='NERDTree|TagList|BufExplorer'
nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

" indent guides
let g:indent_guides_guide_size=1
