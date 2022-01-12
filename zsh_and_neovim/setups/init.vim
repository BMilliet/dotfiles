syntax on

set background=dark
set nocompatible
set number
set relativenumber
set smartindent
set nowrap
set signcolumn=yes
set scrolloff=10
set noswapfile
set tabstop=4 softtabstop=4
set shiftwidth=2
set backspace=2
set nobackup
set nohlsearch
set noerrorbells

filetype plugin indent on

set incsearch
set hlsearch

set colorcolumn=80

let mapleader = " "

" Window swap
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><up> :wincmd j<CR>
nnoremap <leader><down> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^.git$', '.DS_Store', 'node_modules', '.next']
let NERDTreeShowLineNumbers=1
nnoremap <Leader>pt :NERDTreeToggle<Enter>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

