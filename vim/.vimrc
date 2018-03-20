set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" UI and colors
Plugin 'tpope/vim-vinegar'
Plugin 'luochen1990/rainbow'
Plugin 'morhetz/gruvbox'
Plugin 'challenger-deep-theme/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Debugger
Plugin 'vim-vdebug/vdebug'
" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'vim-syntastic/syntastic'
Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'Shougo/echodoc.vim'
Plugin 'Shougo/denite.nvim'

call vundle#end()
filetype plugin indent on

""" Change cursor shape depending on vim mode (KDE Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set relativenumber
set number

set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set wildmode=full
" Show tabs and trailing whitespace
set list listchars=tab:→\ ,trail:·

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

""" Colors
set t_Co=256
colorscheme gruvbox
let g:gruvbox_termcolors = 256
let g:gruvbox_color_column = 'bg1'
let g:gruvbox_contrast_dark = 'soft'
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

""" UI
" let g:netrw_liststyle = 3 " Seems to cause trouble, see https://github.com/tpope/vim-vinegar/issues/13
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

""" Rainbow brackets
let g:rainbow_active = 1

""" PHP CD
let g:phpcd_autoload_path = getcwd() . '/vendor/autoload.php'

""" PHP Insert Use
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Highlight tags in docblocks
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

""" Deoplete
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
   \ 'php': ['php', getcwd() . '/vendor/bin/php-language-server.php'],
   \ }
let g:LanguageClient_loggingLevel = 'DEBUG'

""" LanguageClient
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

""" Denite bindings
call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '-U', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

