" Entry point for Vim configuration

" ============================================================================
" SYSTEM SANITY & INDENTATION DEFAULTS
" ============================================================================
if &compatible | set nocompatible | endif
filetype plugin indent on
syntax on

set hidden
set ttyfast
set lazyredraw
set updatetime=300
set timeoutlen=500
set synmaxcol=240

set number relativenumber
set scrolloff=7
set sidescrolloff=15
set splitbelow splitright

set ignorecase smartcase
set incsearch hlsearch

set expandtab tabstop=4 shiftwidth=4 softtabstop=4 smarttab

" ============================================================================
" GLOBAL HYGIENE (Anti-Clutter)
" ============================================================================
set nobackup nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/did_undo

let g:netrw_dirhistmax = 0 " Kill .netrwhist tracking files completely

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" ============================================================================
" MINIMALIST PLUGINS (Using vim-plug)
" ============================================================================
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
call plug#end()

" ============================================================================
" KEY MAPPINGS
" ============================================================================
let mapleader = " "

nnoremap <Leader><Leader> <C-^>
vnoremap < <gv
vnoremap > >gv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> <Leader>l :nohlsearch<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>p :Files<CR>

" CoC Tab Completion Selection
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
