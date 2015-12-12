set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "Package manager
Plugin 'pangloss/vim-javascript' "Better Javascript syntax highlighting (Required by react)
Plugin 'kchmck/vim-coffee-script' "Coffeescript support
Plugin 'puppetlabs/puppet-syntax-vim' "Puppet support
Plugin 'saltstack/salt-vim' "Salt Syntax Support
Plugin 'digitaltoad/vim-jade' "Jade language syntax highlighting
Plugin 'ap/vim-css-color' "Highlights colors in css files
Plugin 'kien/ctrlp.vim' "Ctrl-P <filename> to open
Plugin 'mattn/emmet-vim' "Shortcuts to generate HTML
Plugin 'tpope/vim-sleuth' "Match indentation style

call vundle#end()            " required
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntax highlighting
syntax enable

" Loading the indent file for specific file types
filetype plugin indent on

set number " Line numbering on
set showmatch " Show matching brackets/parenthesis
set tabstop=4 "Tabs take up 4 spaces
"set shiftwidth=2
"set softtabstop=2
set ruler " Display location in file
set showcmd "Show command in the last line of the screen
set incsearch "Search as you type. Return to original location if canceled.
"set mouse=a "Enable the mouse use in all modes
set ignorecase "case insensitive searching
set smartcase "if search isn't all lowercase, casesensitive search
set backspace=indent,eol,start "make backspace behave like normal"

" Display characters to symbolize whitespace
"set list
set listchars=tab:▸\ ,eol:¬

nnoremap <silent> <leader>> :vertical resize 123<CR> "Automatically resize split to fit 120 chars

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown " .md == markdown. .md != modula-2

" ----- mattn/emmet-vim settings -----
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,tpl EmmetInstall "Only enable for html,css,tpl files

" ----- mxw/vim-jsx -----
let g:jsx_ext_required = 0
