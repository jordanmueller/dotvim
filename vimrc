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

"Add syntastic messages to status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"remember some stuff
set viminfo=%,'50,\"100,n~/.viminfo
" save file state for next time you open
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"mappings
"set paste from insert and normal mode 
inoremap <leader>p <esc>:set paste<CR>i
nnoremap <leader>p :set paste<CR>



