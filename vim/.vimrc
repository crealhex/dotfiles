set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set shiftwidth=2
set tabstop=2
" set expandtab
set relativenumber
set laststatus=2
set noshowmode
set noeb vb t_vb=

so ~/.vim/custom/plugins.vim
" so ~/.vim/plugin-config.vim
so ~/.vim/custom/maps.vim

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%{FugitiveStatusline()}
let g:airline_theme='base16'
