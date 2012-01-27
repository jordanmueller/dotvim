"jordan's little vimrc

"load all my modules with pathogen
call pathogen#infect()

"liaison tab styling (everything is 4 spaces)
set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set copyindent

"handle indenting
set autoindent
set smartindent
inoremap # X#

"visual things
set ruler
set background=dark
filetype plugin indent on
syntax on
set nohlsearch

"Add syntastic messages to status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"remember some stuff
set viminfo=%,'50,\"100,n~/.viminfo

" save file state for next time you open
augroup save_state
    autocmd!
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
augroup END

"mappings
"set paste from insert and normal mode 
inoremap <leader>p <esc>:set paste<CR>i
nnoremap <leader>p :set paste<CR>

"remove the foldcolumn (artifact from vimdiff)
nnoremap <leader>f :set foldcolumn=0<CR>

" edit and source my vimrc on the fly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" add qoutes around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>a"<esc>hbi"<esc>gvw
vnoremap <leader>' <esc>a'<esc>hbi'<esc>gvw

" move to front and end of the line
nnoremap H ^
nnoremap L $

" get rid of <esc> 
inoremap jk <esc>
inoremap <esc> <nop>

" stop using arrow keys in vim
nnoremap OA <nop>
nnoremap OB <nop>
nnoremap OD <nop>
nnoremap OC <nop>
inoremap OA <nop>
inoremap OB <nop>
inoremap OD <nop>
inoremap OC <nop>


" make some commenting things
augroup filetype_perl
    autocmd!
    autocmd FileType perl noremap <buffer> <localleader>c I#<esc>
    autocmd FileType perl noremap <buffer> <localleader>uc ^x
augroup END
