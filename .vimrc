""""""""""""""""""""""""""""""""""""""""""""
" tips
""""""""""""""""""""""""""""""""""""""""""""
" show previsously given messages
" 查看vim启动时一闪而过的错误消息时很有用
" :mes[sages]

""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""
filetype off " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""" required
Bundle 'gmarik/vundle'

""""" utility
Bundle 'vimwiki'
" Syntax file for Markdown text-to-HTML language
" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" Usage: tl
Bundle 'taglist.vim'
" Display tags of the current file ordered by scope
Bundle 'Tagbar'
" Plugin to add tab bar ( derived from miniBufExplorer).
" Usage: tb
Bundle 'TabBar'
" A windows style IDE for Vim
" Usage: wm
Bundle 'winmanager'
" A tree explorer plugin for navigating the filesystem
" Usage: nt
Bundle 'The-NERD-tree'
" A plugin that allows for easy commenting of code for many filetypes
" Usage:
"	\cc: Comments out the current line or text selected in visual mode.
"	\c<space>: Toggles the comment state of the selected line(s).
"	\cu: Uncomments the selected line(s).
Bundle 'The-NERD-Commenter'
" Alternate Files quickly (.c --> .h etc)
" Usage: 
"	:A switches to the header file
Bundle 'a.vim'
" Simplify Doxygen documentation in C, C++, Python.
" Usage:
"	:Dox
"	:DoxAuthor
"	:DoxLic
"	:DoxBlock
"	:DoxUndoc
Bundle 'DoxygenToolkit.vim'
"Bundle 'superSnipMate'
" Run interactive commands inside a Vim buffer
" Usage:
"	:ConqueTerm <command>
"Bundle 'Conque-Shell'
" Autodetect multiple encodings
"Bundle 'FencView.vim'
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

" The ultimate vim statusline utility
Bundle 'Lokaltog/vim-powerline'

" a C-reference manual especially designed for Vim
"Bundle 'CRefVim'

" Functions and mappings to close open HTML/XML tags
" Usage: ctrl-_
Bundle 'closetag.vim'

" a simple IDE for C/C++
Bundle 'Side-C'

" A C++ Standard Template Library reference manual
" Usage: <Leader>tr: go to documentation for the function
"        <Leader>te: go to an example that uses this function
Bundle 'stlrefvim'

" Eclipse like task list
" Usage: <leader>t
"	     q Quit
"	     e Exit
"	     <cr>
Bundle 'TaskList.vim'

" vim motions on speed
" Usage: <leader><leader>w
"        <leader><leader>fa
Bundle 'EasyMotion'

" vim-script library
Bundle 'L9'

" buffer/file/command/tag/etc explorer with fuzzy matching
" based on L9
Bundle 'FuzzyFinder'

""""" ftplugin
" Bundle 'OmniCppComplete'
"Bundle 'pyflakes.vim'

" run the currently open file through Flake8
" Usage: F7
Bundle 'vim-flake8'

Bundle 'xml.vim'
" Show the function's define.
Bundle 'ShowFunc.vim'

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
let g:fencview_autodetect = 0
" manual
"set fenc=cp936
"set enc=cp936
set fenc=utf-8
set enc=utf-8
set fencs=cp936,ucs-bom,utf-8,gb18030,big5,euc-jp,sjis,euc-kr,ucs-21e,lation1
let &termencoding=&encoding

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
"set foldmethod=syntax
"set foldnestmax=2

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
"    return 1
endfunction

let g:winManagerWindowLayout='NERDTree|TagList|BufExplorer'
nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

" indent guides
let g:indent_guides_guide_size=1

" tagbar
nmap tb :TagbarToggle<CR>

"ShowMarks
let g:showmarks_enable = 1
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

" powerline
let g:Powerline_theme = 'skwp'
" vimwiki
"if has("win32")  
"	let $VIMFILES = $VIM.'/vimfiles'
"else  
"	let $VIMFILES = $HOME.'/.vim/wiki'
"endif

"let g:vimwiki_list = [{'html_header': '~/vimwiki_html/headers.tpl'}]
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"			\ 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown','.mkd':'markdown'}
"
"" markdown to html
""let mapleader = ","
"nnoremap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
