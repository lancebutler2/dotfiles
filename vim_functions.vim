set nocompatible

""""""""""""""""""""""""""""""""""""""
" CONVENIENT FUNCTIONS
"""""""""""""""""""""""""""""""""""""

" view difference between current buffer and file it was loaded from. view changes made
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""
" wipeout unused buffers
function! Wipeout()
    " list of *all* buffer numbers
    let l:buffers = range(1, bufnr('$'))

    " what tab page are we in?
    let l:currentTab = tabpagenr()
    try
        " go through all tab pages
        let l:tab = 0
        while l:tab < tabpagenr('$')
            let l:tab += 1

            " go through all windows
            let l:win = 0
            while l:win < winnr('$')
                let l:win += 1
                " whatever buffer is in this window in this tab, remove it from
                " l:buffers list
                let l:thisbuf = winbufnr(l:win)
                call remove(l:buffers, index(l:buffers, l:thisbuf))
            endwhile
        endwhile

        " if there are any buffers left, delete them
        if len(l:buffers)
                execute 'bwipeout' join(l:buffers)
        endif
    finally
        " go back to our original tab page
        execute 'tabnext' l:currentTab
    endtry
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
