setlocal expandtab
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal listchars=tab:\|\ ,trail:·,precedes:<,extends:>
setlocal list

noremap <leader>a a[ ] 
noremap <leader>o o[ ] 
noremap <leader>x ^v:s/\[[ X]/\=submatch(0) == '[X' ? "[ " : "[X"/<CR>f]w
