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
Plugin 'flazz/vim-colorschemes'
Plugin 'gmist/vim-palette'
Plugin 'luochen1990/rainbow'
Plugin 'MaxSt/FlatColor'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Tags
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'vim-syntastic/syntastic'
Plugin 'phux/php-doc-modded'
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'roxma/nvim-yarp'
    Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'Shougo/echodoc.vim'
Plugin 'Shougo/denite.nvim'
Plugin 'abrace/phpcd.vim'
Plugin 'autozimu/LanguageClient-neovim', { 'do': 'UpdateRemotePlugins' }

call vundle#end()
filetype plugin indent on

""" Change cursor shape depending on vim mode (KDE Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set clipboard=unnamedplus
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
colorscheme flatcolor
let g:flatcolor_termcolors = 16
set background=dark

""" UI
let g:netrw_liststyle = 3
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

""" Rainbow brackets
let g:rainbow_active = 1

""" PHP CD
let g:phpcd_autoload_path = getcwd() . '/vendor/autoload.php'

""" GutenTags
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
set statusline+=%{gutentags#statusline('[Generating...]')}
set statusline+=%#warningmsg#

""" PHP Insert Use
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

""" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Highlight tags in docblocks
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

""" Doc Block
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "0.1"
let g:pdv_cfg_Author = "Jochem Klingeler <jochem.klingeler@gmail.com>"
let g:pdv_cfg_Copyright = strftime('%Y') . " Klingeler"
let g:pdv_cfg_License = "MIT"
let g:pdv_cfg_ReturnVal = "void"
" Options
" Whether or not to automatically add the function end comment (1|0)
let g:pdv_cfg_autoEndFunction = 1
" Whether or not to automatically add the class end comment (1|0)
let g:pdv_cfg_autoEndClass = 1
" Whether to generate the following annotations:
let g:pdv_cfg_annotation_Package = 0
let g:pdv_cfg_annotation_Version = 1
let g:pdv_cfg_annotation_Author = 1
let g:pdv_cfg_annotation_Copyright = 1
let g:pdv_cfg_annotation_License = 1
nnoremap <Leader>d :call PhpDocSingle()<CR>
vnoremap <Leader>d :call PhpDocRange()<CR>

""" Custom RunPhpCsFixer function
function! RunPhpCsFixer()
    let echo = "!php-cs-fixer fix " . expand('%') . ' --rules=@PSR2'
    execute echo
endfunction

""" Custom call to Tidy
nmap <leader>h :!tidy -mi -wrap 0 %<cr>

""" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:LanguageClient_serverCommands = {
    \ 'php': ['php', getcwd() . '/vendor/bin/php-language-server.php'],
    \ }
let g:deoplete#enable_at_startup = 1

""" LanguageClient
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

""" Denite bindings
call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })
" call denite#custom#var('file_rec', 'command',
"       \ ['rg', '--files', '--glob', '!.git', ''])
" call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
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

