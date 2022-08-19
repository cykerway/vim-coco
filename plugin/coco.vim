""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
""  coco: vim code commentator;
""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

""  set filetype comment prefix;
function CocoSetPrefix()
    let b:cocoPrefix = get(g:cocoPrefixDict, &filetype, g:cocoDefaultPrefix)
    let b:cocoPrefixLen = strlen(b:cocoPrefix)
endfunction

""  comment a line;
function CocoComment()
    let l:currentLine = line('.')
    let l:currentColumn = col('.')
    :exe "normal" "0i" . b:cocoPrefix
    :call cursor(l:currentLine, l:currentColumn + b:cocoPrefixLen)
endfunction

""  uncomment a line;
function CocoUncomment()
    let l:currentLine = line('.')
    let l:currentColumn = col('.')
    let l:prefix = getline(l:currentLine)[0:b:cocoPrefixLen - 1]
    if l:prefix == b:cocoPrefix
        :exe "normal" "0" . b:cocoPrefixLen . "x"
        :call cursor(l:currentLine, l:currentColumn - b:cocoPrefixLen)
    endif
endfunction

""  toggle a line comment;
function CocoToggle()
    let l:currentLine = line('.')
    let l:currentColumn = col('.')
    let l:prefix = getline(l:currentLine)[0:b:cocoPrefixLen - 1]
    if l:prefix == b:cocoPrefix
        :call CocoUncomment()
    else
        :call CocoComment()
    endif
endfunction

""  comment prefix dictionary;
if !exists('g:cocoPrefixDict')
    let g:cocoPrefixDict = {
\       'c'         :   '//',
\       'cpp'       :   '//',
\       'css'       :   '//',
\       'java'      :   '//',
\       'javascript':   '//',
\       'lua'       :   '--',
\       'plaintex'  :   '%%',
\       'scss'      :   '//',
\       'sql'       :   '--',
\       'tex'       :   '%%',
\       'vim'       :   '""',
\       'xdefaults' :   '!!',
\   }
endif

""  set default comment prefix;
if !exists('g:cocoDefaultPrefix')
    let g:cocoDefaultPrefix = '#'
endif

""  autocmd: set comment prefix;
autocmd BufEnter,FileType * :call CocoSetPrefix()

