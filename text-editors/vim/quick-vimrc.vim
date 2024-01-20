" Quick vimrc
" [https://raw.githubusercontent.com/ranemirusG/toolbox-notes/main/text-editors/vim/quick-vimrc.vim]

set nocompatible

"""""""""""""""""""""""""""""""""""
" this may be already by default
" but just in case...

" set encoding=utf-8
" set backspace=indent,eol,start
" syntax on
" filetype plugin indent on

"""""""""""""""""""""""""""""""""""

set mouse=a





set relativenumber
set scrolloff=2

set hlsearch
set incsearch

" Save
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>




" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
