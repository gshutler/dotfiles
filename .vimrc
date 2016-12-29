syn on

set t_Co=256
colorscheme lucius
LuciusBlack

" Load a local .vimrc if present (allows for project-specific settings)
set exrc

" Go to last position if known when opening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g`\"zz" | endif

" Always show status bar
set laststatus=2

set wildignore+=*/vendor/bundle*
set wildignore+=*/node_modules*

" Default tabs to 2 spaces and auto indent
set tabstop=2 shiftwidth=2
set autoindent

" disable text wrapping
set nowrap

" Open new buffers when splitting in natural directions
set splitright
set splitbelow
" Rebalance buffers on window resize
autocmd VimResized * wincmd =
autocmd VimResized * vertical wincmd =

" No swap files, etc
set nobackup
set nowritebackup
set noswapfile

" Enable indent plugin
filetype plugin indent on

set expandtab  " Replace tabs with spaces
set number     " Show line numbers
set cursorline " Highlight current line
set cursorcolumn " Highlight current column
set ruler
set scrolloff=4 " Always show 4 lines of context at the top/bottom

" Hide buffers rather than closing them to maintain undo history
set hidden

" Reduce the lag of pressing O just after Esc
set notimeout
set ttimeout

" Column limit highlighting plus file specific limit definitions
set colorcolumn=+1
set textwidth=80

" Set textwidth to 72 for git commits
autocmd FileType gitcommit setlocal spell textwidth=72

" Don't have sticky search highlight but do highlight whilst searching
set nohlsearch
set incsearch

set fillchars+=vert:\ 
" Visible whitespace
set listchars=tab:»·,precedes:<,extends:>
set list

highlight TrailingWhitespace ctermbg=DarkGray
autocmd InsertEnter * match
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" Include -, !, and ? as part of words for autocomplete and so on
set iskeyword+=\-
set iskeyword+=\!
set iskeyword+=\?

" 256 color reference http://www.mudpedia.org/mediawiki/index.php/Xterm_256_colors
highlight ColorColumn  ctermbg=232
highlight CursorLine   ctermbg=235
highlight CursorColumn ctermbg=235
highlight Pmenu        ctermfg=Black    ctermbg=DarkGray
highlight PmenuSel     ctermfg=Black    ctermbg=White
highlight StatusLine   ctermfg=Black    ctermbg=White    cterm=none gui=none
highlight StatusLineNC ctermfg=Black    ctermbg=DarkGray cterm=none gui=none
highlight MatchParen   ctermfg=DarkGray ctermbg=Black    cterm=none
highlight clear SpellBad
highlight SpellBad ctermfg=009

" CtrlP - Open created files in the current window
let g:ctrlp_open_new_file = 'r'
" CtrlP - Don't jump to open buffers for the selected file
let g:ctrlp_switch_buffer = 0
" CtrlP - Add .ctrlp as a custom root file
let g:ctrlp_root_markers = ['.ctrlp']
" CtrlP - Use ag to list files instead
let g:ctrlp_user_command = 'ag %s --ignore-case --nocolor --nogroup --hidden -g ""'
" CtrlP - Don't use caching
let g:ctrlp_use_caching = 0

" HTML formatting - treat li and p as blocks
let g:html_indent_tags = 'li\|p'

" Markdown formatting - syntax highlighting for ```ruby style blocks
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" COMMENTING HELPERS

function! ObeyTextWidth()
  return "normal! 0" . &textwidth . "llF r\<CR>"
endfunction

" Ctrl+f whilst in normal mode breaks the line for col80 formatting.
nnoremap <C-f> :execute ObeyTextWidth()<CR>
" Ctrl+j whilst in normal mode joins this line with the next one.
nnoremap <C-j> Jd2wi <Esc>w
" Ctrl+k whilst in normal mode joins this line with the previous one.
nnoremap <C-k> kJd2wi <Esc>
" Map K to join line above rather than default of search for command
nnoremap <S-k> kJ
vnoremap <S-k> J

" F8 in normal mode removes all trailing whitespace and extra blank lines.
nnoremap <F8> my:%s/\s\+$//e<CR>:%s/\n\{3,}/\r\r/e<CR>`y

" jj or kk whilst in insert mode returns to normal mode.
imap jj <Esc>
imap kk <Esc>

" Changed active leader to ','
let mapleader = " "

" Shortcut for editing and save-with-reload for .vimrc
nmap <silent> <leader>re :e $MYVIMRC<CR>
nmap <silent> <leader>rs :source $MYVIMRC<CR>

" Quick save
nmap <leader>w :w<CR>
nmap <leader>q :wq<CR>

" Split creation
nmap <leader>v :vsplit<CR>:CtrlP<CR>
nmap <leader>s :split<CR>:CtrlP<CR>

" CtrlP aliases
nmap <leader>p :CtrlP<CR>

" Map ; to : for less shift-key action
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

" Simpler split navigation
noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
noremap <leader>l <c-w>l

" Tab for paragraph movement
noremap <TAB> }
noremap <S-TAB> {

set undofile                " Save undos after file closes
set undodir=~/.vim/undodir/ " Where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save for undo
