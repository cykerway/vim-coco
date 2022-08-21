""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
""  coco: vim code commentator;
""
""  Copyright (C) 2015-2022 Cyker Way
""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

""  ============================================================================
""  function;
""  ============================================================================

""  set prefix;
function CocoSetPrefix()

    while 1

        if exists('g:coco_pf_dict')
            let l:PF = get(g:coco_pf_dict, &filetype)
            if l:PF != ''
                let l:ps = l:PF()
                break
            endif
        endif

        if exists('g:coco_ps_dict')
            let l:ps = get(g:coco_ps_dict, &filetype)
            if l:ps != ''
                break
            endif
        endif

        if exists('g:coco_ps')
            let l:ps = g:coco_ps
            break
        endif

        let l:PF = get(s:coco_pf_dict, &filetype)
        if l:PF != ''
            let l:ps = l:PF()
            break
        endif

        let l:ps = get(s:coco_ps_dict, &filetype)
        if l:ps != ''
            break
        endif

        let l:ps = s:coco_ps
        break

    endwhile

    let b:cocoPrefix = l:ps
    let b:cocoPrefixLen = strlen(l:ps)

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
    let l:ps = getline(l:currentLine)[0:b:cocoPrefixLen - 1]
    if l:ps == b:cocoPrefix
        :exe "normal" "0" . b:cocoPrefixLen . "x"
        :call cursor(l:currentLine, l:currentColumn - b:cocoPrefixLen)
    endif

endfunction

""  toggle a line comment;
function CocoToggle()

    let l:currentLine = line('.')
    let l:currentColumn = col('.')
    let l:ps = getline(l:currentLine)[0:b:cocoPrefixLen - 1]
    if l:ps == b:cocoPrefix
        :call CocoUncomment()
    else
        :call CocoComment()
    endif

endfunction

""  ============================================================================
""  main script;
""  ============================================================================

""  prefix function dict;
let s:coco_pf_dict = {}

""  prefix string dict;
let s:coco_ps_dict = {
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

""  default prefix string;
let s:coco_ps = '#'

""  autocmd: set prefix;
aug coco
    au!
    au FileType * :call CocoSetPrefix()
aug END

