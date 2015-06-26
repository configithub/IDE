syn on
set nocp
filetype plugin on

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" indentation and tabs
set expandtab
set shiftwidth=2
set softtabstop=2
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

" opencl coloration
au BufNewFile,BufRead *.cl set syntax=opencl 

command! Bash ConqueTerm bash

" comment/uncomment lines c++
au FileType c,cpp,cl command! -range Cm <line1>,<line2>s/^\( *\)/\1\/\//
au FileType c,cpp,cl command! -range Uc <line1>,<line2>s/^\( *\)\/\//\1/
" comment/uncomment lines python
au FileType python command! -range Cm <line1>,<line2>s/^\( *\)/\1#/ 
au FileType python command! -range Uc <line1>,<line2>s/^\( *\)#/\1/ 
" comment/uncomment lines sql
au FileType sql,lua command! -range Cm <line1>,<line2>s/^/--/
au FileType sql,lua command! -range Uc <line1>,<line2>s/^--//
" comment/uncomment lines text file 
au FileType txt command! -range Cm <line1>,<line2>s/^\( *\)/\1#/
au FileType txt command! -range Uc <line1>,<line2>s/^\( *\)#/\1/


" reopen file at same position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" colors
colorscheme desert

"set ofu=syntaxcomplete#Complete

" toggle relative number
let g:NumberToggleTrigger="<F2>"

" disable line numbers with f3
:nmap <F3> :set invnumber<CR>

" current line number in bottom right corner
:set ruler

" backspace as it should be
set backspace=2

" reload snippets for snimpamte
:nmap <F5> :call ReloadAllSnippets() <CR>

" open snippet file 
au FileType python :nmap <F4> :!/usr/bin/vim ~/.vim/snippets/python.snippets <CR>
au FileType c,cpp :nmap <F4> :!/usr/bin/vim ~/.vim/snippets/cpp.snippets <CR>
au FileType lua :nmap <F4> :!/usr/bin/vim ~/.vim/snippets/lua.snippets <CR>

" use bashrc stuff when invoking commands from vim with ![cmd]
set shell=bash\ --login

" use pathogen plugin manager
execute pathogen#infect()
