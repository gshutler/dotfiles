syn on

let g:molokai_original = 1
set t_Co=256
colorscheme molokai

" Default tabs to 4 spaces and auto indent
set tabstop=4
set shiftwidth=4
set autoindent

set expandtab  " Replace tabs with spaces
set number     " Show line numbers
set cursorline " Highlight current line
set ruler

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

" 2 space tabs for HTML and Ruby
autocmd FileType html,ruby setlocal shiftwidth=2 tabstop=2

" CtrlP - Open created files in the current window
let g:ctrlp_open_new_file = 'r'

" Make CSApprox fail silently if it isn't run in a GUI vim
let g:CSApprox_verbose_level = 0
