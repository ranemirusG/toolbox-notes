" Show whitespace
" Must be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" De-fuckify whitespace
nnoremap <F4> :retab<CR>:%s/\s\+$//e<CR><C-o>
