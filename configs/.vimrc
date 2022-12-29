syntax on

set cursorline
:highlight Cursorline cterm=bold ctermbg=black

set mouse=a
set path+=**
set nocompatible
set wildmenu
set number
set relativenumber
set smartindent
set nowrap
set signcolumn=yes
set scrolloff=10

set shortmess+=c

set tabstop=4 softtabstop=4
set shiftwidth=4
set backspace=2

filetype plugin indent on

set incsearch
set hlsearch

set wildignore=*/.buckd/*,*/buck-ou/*,*/.git/*,*/.github/*,*/buckjavaargs/*,*/Pods/*,*/*.lock/*,*/.DS_Store/*,*/__pycache__/*

" Window movement
let mapleader = ' '
nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><up> :wincmd j<CR>
nnoremap <leader><down> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>

" Auto complete menu
inoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Project search
command -nargs=1 PS vimgrep /<args>/g **/* | cope

" Highlight empty spaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Minimalist-TabComplete-Plugin
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K'
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun
