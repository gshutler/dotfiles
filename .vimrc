syn on

let g:molokai_original = 1
set t_Co=256
colorscheme molokai

" Always show status bar
set laststatus=2

set wildignore+=*/vendor/bundle*
set wildignore+=*/node_modules*

" Default tabs to 2 spaces and auto indent
set tabstop=2 shiftwidth=2
set autoindent

" disable text wrapping
set nowrap

" No swap files, etc
set nobackup
set nowritebackup
set noswapfile

" Enable indent plugin
filetype plugin indent on

set expandtab  " Replace tabs with spaces
set number     " Show line numbers
set cursorline " Highlight current line
set ruler
set scrolloff=4 " Always show 4 lines of context at the top/bottom

" Hide buffers rather than closing them to maintain undo history
set hidden
set undolevels=1000

" Reduce the lag of pressing O just after Esc
set timeoutlen=200

" Column limit highlighting plus file specific limit definitions
set colorcolumn=+1
set textwidth=80

" Set textwidth to 72 for git commits
au FileType gitcommit set textwidth=72

" Don't have sticky search highlight but do highlight whilst searching
set nohlsearch
set incsearch

" Visible whitespace
set listchars=tab:»·,trail:·,precedes:<,extends:>
set list

" 256 color reference http://www.mudpedia.org/wiki/Xterm_256_colors
highlight ColorColumn  ctermbg=232
highlight CursorLine   ctermbg=235
highlight Pmenu        ctermfg=Black    ctermbg=DarkGray
highlight PmenuSel     ctermfg=Black    ctermbg=White
highlight StatusLine   ctermfg=Black    ctermbg=White    cterm=none gui=none
highlight StatusLineNC ctermfg=Black    ctermbg=DarkGray cterm=none gui=none
highlight MatchParen   ctermfg=DarkGray ctermbg=Black    cterm=none

" CtrlP - Open created files in the current window
let g:ctrlp_open_new_file = 'r'
" CtrlP - Add .ctrlp as a custom root file
let g:ctrlp_root_markers = ['.ctrlp']

" HTML formatting - treat li and p as blocks
let g:html_indent_tags = 'li\|p'

" COMMENTING HELPERS

" Ctrl+j whilst in normal mode joins this line with the next one.
nnoremap <C-j> Jd2wi <Esc>

function! ObeyTextWidth()
  return "normal! 0" . &textwidth . "lF r\<CR>"
endfunction

" Ctrl+f whilst in normal mode breaks the line for col80 formatting.
nnoremap <C-f> :execute ObeyTextWidth()<CR>

" Ctrl+k whilst in normal mode joins this line with the previous one.
nnoremap <C-k> kJd2wi <Esc>

" F8 whilst in normal mode removes all whitespace.
nnoremap <F8> my:%s/\s\+$//<CR>`y

" jj whilst in insert mode returns to normal mode.
imap jj <Esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Changed active leader to ','
let mapleader = ","

" Run 'rake test' after saving
map <leader>a :w\|:!rake test<cr>

" Shortcut for editing and save-with-reload for .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Allow ; rather than : to enter commands in normal mode
nnoremap ; :

" Create a log message 'hiding' toggle
syn match LogMessage /\c^\s*log.*/

hi link LogMessage NONE
let s:hide_logs = "no"

function! ToggleLogs()
  if s:hide_logs == "yes"
    hi link LogMessage NONE
    let s:hide_logs = "no"
  else
    hi link LogMessage Comment
    let s:hide_logs = "yes"
  endif
endfunction

nnoremap <silent> <F10> :call ToggleLogs()<CR>

