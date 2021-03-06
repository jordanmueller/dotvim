" This is a module based on the work in 
" steve losh's learnvimscript the hard way.

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif


    silent execute "grep! -R --exclude=*\.git* --exclude=*\.svn* " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register 
endfunction
