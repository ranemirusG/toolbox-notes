" Quick vimrc
" https://raw.githubusercontent.com/ranemirusG/toolbox-notes/main/text-editors/vim/quick-vimrc.vim

" VIMRC
"Edit vim config
nnoremap <leader>c :tabnew $MYVIMRC<CR> 
autocmd FileType vim nnoremap <buffer> <leader>s :update<CR>:source %<CR>
"Edit neovim config
"nnoremap <Leader>nc :tabnew ~/.config/nvim/init.vim<CR>





"""""""""""""""""""""""""""""""""""
" this may be already by default
" but just in case...

" set nocompatible
" set encoding=utf-8
" set backspace=indent,eol,start
" syntax on
" set wrap
" set ruler
filetype plugin indent on
"""""""""""""""""""""""""""""""""""



" Colors
" Terminal colors
" ver esto https://www.reddit.com/r/vim/comments/6qfhob/how_to_make_vim_follow_terminals_colorscheme/
if has('termguicolors')
   set termguicolors
endif

" colorscheme habamax
color default
" colo wildcharm
" colo zellner



set number
set relativenumber
set scrolloff=2
set textwidth=80
set formatoptions-=t
set cc=+1 " colorcolumn
set linebreak
set showcmd
set laststatus=2

set cursorline
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
set splitbelow
set splitright
set mouse=a





" Indentation
" TODO set 8 spaces for Assembly
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nolist       " Negado para o mapeamento dos caracteres invisíveis... 
set listchars=tab:›-,space:·,trail:⋯,eol:↲
set fillchars=vert:│,fold:\ ,eob:~,lastline:@


" Search
set ignorecase
set infercase
set wildignorecase
" set smartcase "if the search pattern contains upper case chars
set hlsearch
set incsearch
let @/=""


" Completion
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set completeopt=menuone,longest
" set shortmess+=c
set shortmess-=S

" Files and filesystem
set hidden
set path+=**
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
" set undofile

" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'








autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif


set timeout
set ttimeoutlen=100



" Mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Save
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>
" Buffers
nnoremap <Leader>b :ls<CR>:b
" toggle in `nano` style. Other option could be <Leader>bn and <Leader>bp JAJAJA
" alt + ,
nnoremap , :bp<cr>
" alt + .
nnoremap . :bn<cr>


" Highlights `:h hi` (this has to be at the end of this file)
" hi Comment cterm=italic gui=italic
" terminal color settings... 
" hi Normal guibg=NONE ctermbg=NONE

" End of Quick vimrc
