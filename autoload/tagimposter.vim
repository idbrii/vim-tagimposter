" Create fake tags to populate the tagstack
"
" Inspired by jedi.vim's g:jedi#use_tag_stack.
" https://github.com/davidhalter/jedi-vim/blob/4c430ed536b6484f7c63929a4426d64f981d994e/pythonx/jedi_vim.py#L319
"
" Unlike jedi, tagimposter uses a permanent file (to avoid save/restoring
" wildignore and tags) and can work for any tag jumps, but have weird looking
" symbol names.

function! tagimposter#setup()
    if exists("g:tagimposter_has_hookedup_tagfile")
        return
    endif 
    let g:tagimposter_has_hookedup_tagfile = 1

    let tagfolder = expand(fnamemodify(g:tagimposter_tagfile, ":h"))
    if filewritable(tagfolder) == 0 && exists("*mkdir")
        call mkdir(tagfolder, "p", 0700)
    endif

    exec 'set tags+='. g:tagimposter_tagfile
endf

function! tagimposter#pushtag(symbol)
    let win = winsaveview()
    
    call tagimposter#setup()
    let tagfile = expand(fnamemodify(g:tagimposter_tagfile, ':p'))

    let symbol = g:tagimposter_symbolprefix . a:symbol
    let tagaddress = '/^' . escape(getline('.'), '\/') . '$/'
    " Tags are a symbol, a file, and a tagaddress (:h tags-file-format)
    let tag_str = printf("%s\t%s\t%s;", symbol, expand("%:p"), tagaddress)
    let success = writefile([tag_str], tagfile, "S")
    if success >= 0
        exec 'tjump '. symbol
    else
        echoerr 'Failed to write to '. tagfile
    endif
    
    " tjump moves the cursor to first nonblank, so we must move back.
    call winrestview(win)
endf
