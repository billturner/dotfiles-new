" initialize for plugins
set nocompatible
filetype off

" set up vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" plugins (use single quotes)
Plug 'chriskempson/base16-vim'               " color themes
Plug 'sheerun/vim-polyglot'                  " syntax highlighting
Plug 'tpope/vim-fugitive'                    " helpers for git
Plug 'tpope/vim-surround'                    " helpers for wrapping text

" finish vim-plug
call plug#end()

" initial settings
filetype plugin indent on
set ff=unix
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
scriptencoding utf-8

" set <Leader> to ,
let mapleader=','

" enable syntax hightlighing if available
if has('syntax')
  syntax on
endif

" set theme
set background=dark
colorscheme base16-material-darker

" indentation rules
set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" special cases for indentation and wrapping
if has("autocmd")
  " markdown is special
  autocmd BufNewFile,BufRead *.markdown,*.mkd,*.md setlocal ft=markdown
  autocmd FileType markdown setlocal wrap linebreak nonumber norelativenumber nolist colorcolumn=
  " 4 spaces for python
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
endif

" editor hints
set hidden
set number
set relativenumber
set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,eol:¬

" set an anonymous clipboard
set clipboard=unnamed

" show the status line
set laststatus=2

" configure status line
if has("statusline")
  set statusline=""
  set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline()\ :''}
  set statusline+=\ %f  " filename
  set statusline+=\ %m  " modified?
  set statusline+=\ %y  " filetype
  set statusline+=\ %r  " read-only?
  set statusline+=%= " right side of statusline starts
  set statusline+=\ col:%c,
  set statusline+=\ line\ %l\ of\ %L\ [%P]
endif

" use matchit macros
runtime macros/matchit.vim
