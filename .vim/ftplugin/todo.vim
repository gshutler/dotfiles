setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal listchars=tab:\|\ ,trail:·,precedes:<,extends:>
setlocal list

noremap <leader>i i[ ] 
noremap <leader>a a[ ] 
noremap <leader>o o[ ] 
noremap <leader>x ^v:s/\[[ X]/\=submatch(0) == '[X' ? "[ " : "[X"/<CR>f]w
