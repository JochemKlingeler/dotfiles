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

"  Registers can be hard...
map <leader>p "0p
map <leader>P "0P
map <leader><C-p> "0<C-p>
map <leader>y "0y
map <leader>Y "0Y
map <leader><C-y> "0<C-y>
map <leader>c "0c
map <leader>C "0C
map <leader><C-c> "0<C-c>
map <leader>d "0d
map <leader>D "0D
map <leader><C-d> "0<C-d>
map <leader>dd "0dd

" Change cursor on vim mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
