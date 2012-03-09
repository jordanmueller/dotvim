"jordan's little vimrc

"load all my modules with pathogen
call pathogen#infect()

"source a local .vim.custom file if it exists.
if filereadable("/home/jordan/.vim.custom")
    source ~/.vim.custom
endif

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
set hlsearch
set incsearch
nnoremap <leader>b :nohlsearch<cr>

"Add syntastic messages to status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"remember some stuff
set viminfo=%,'50,\"100,n~/.viminfo

"toggle paste setting
set pastetoggle=<leader>p

"toggle the list parameter
nnoremap <leader>l :set list!<CR>

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

" call <esc> from the home row 
inoremap jk <esc>

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
    autocmd FileType perl noremap <buffer> <localleader>z :! perl -c '%'<cr>
augroup END

" open the previous buffer in a window to the right
nnoremap <leader>pb :execute "rightbelow vsplit " . bufname("#")<cr>

" Add a semicolon to the end of a line
nnoremap <leader>s :execute "normal! mqA;\e'q"<cr>

" Find/Delete trailing whitespace
nnoremap <leader>w :execute 'normal! gg/\v\s+$' . "\r"<cr>
nnoremap <leader>W :.s/\v\s+$//<cr>

" make all serches very magic (expected regex behavior)
" and clear out previous search highlighting
nnoremap / :nohlsearch<cr>/\v

" grep for the word you are on.
nnoremap <leader>g :silent execute "grep! -R --exclude-dir=.git --exclude-dir=.svn " . shellescape("<cWORD>") . " ."<cr>:copen<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>cc :cclose<cr>
