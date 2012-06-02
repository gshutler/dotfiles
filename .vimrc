syn on

let g:molokai_original = 1
set t_Co=256
colorscheme molokai

" Default tabs to 2 spaces and auto indent
set tabstop=2
set shiftwidth=2
set autoindent

set expandtab  " Replace tabs with spaces
set number     " Show line numbers
set cursorline " Highlight current line
set ruler

" Reduce the lag of pressing O just after Esc
set timeoutlen=100

" Col80 plus file specific limit highlighting when set
set colorcolumn=+1,80

" Don't have sticky search highlight but do highlight whilst searching
set nohlsearch
set incsearch

" Visible trailing whitespace
set listchars=tab:»·,trail:·,precedes:<,extends:>
set list

" 256 color reference http://www.mudpedia.org/wiki/Xterm_256_colors
highlight ColorColumn  ctermbg=232
highlight CursorLine   ctermbg=235
highlight Pmenu        ctermfg=Black    ctermbg=DarkGray
highlight PmenuSel     ctermfg=Black    ctermbg=White
highlight StatusLine   ctermfg=Black    ctermbg=White    cterm=none gui=none
highlight StatusLineNC ctermfg=Black    ctermbg=DarkGray cterm=none gui=none

" CtrlP - Open created files in the current window
let g:ctrlp_open_new_file = 'r'

" COMMENTING HELPERS

" Ctrl+j whilst in insert mode continues the next line with the same lead as
" the current line, trimming any trailing whitespace.
inoremap <C-j> <CR>#<Esc>k^yw:.s/\s\+$//e<CR>jPf#xA
" Ctrl+j whilst in normal mode breaks the line at the next space line whilst
" adding a lead the same as the current line.
nnoremap <C-j> f r<CR><Esc>k^ywjPw
" Ctrl+o whilst in normal mode creates a new line with the same lead as the
" current line.
nnoremap <C-o> ^ywo#<Esc>Pf#xA
