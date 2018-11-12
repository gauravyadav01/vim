
"Basic Setup
"-------------------------------------------------------------------
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"hack to make cursor beam lineG
set guicursor=


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
"let mapleader=','

"" Searching
set hlsearch
set incsearch

"set ignorecase
set smartcase

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

"

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set ruler
set number relativenumber

"" Status bar
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ \%p%%\ (%l\/%L:%c)


"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread



"dein Plugin Config
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('hashivim/vim-terraform')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#add('tomasiser/vim-code-dark')
  call dein#add('ervandew/supertab')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-surround')
 " call dein#add('vim-airline/vim-airline')
"  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif


"Colorscheme tomasiser/vim-code-dark
let g:codedark_conservative = 1
colorscheme codedark

"Vim-Terraform  hashivim/vim-terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

"Vim Identline Yggdroot/indentLine
let g:indentLine_char = ''

"Vim-arline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"Insearch mapping
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"Mapping
