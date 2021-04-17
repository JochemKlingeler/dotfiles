set encoding=utf-8
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set wildmode=full
" Show tabs and trailing whitespace
set list listchars=tab:→\ ,trail:·
" Line numbers
set number
" Relative line numbers
set relativenumber

"  Escape
inoremap jj <Esc>

"  Add some movement to insertmode
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-l> <Right>
inoremap <M-h> <Left>

"  Clear highlights
nnoremap <C-l> <cmd>noh<CR>

"  Use Esc in terminal to enter normal mode
tnoremap <Esc> <C-\><C-n>
