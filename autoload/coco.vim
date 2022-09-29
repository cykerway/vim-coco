""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
""  coco: vim code commentator;
""
""  Copyright (C) 2015-2022 Cyker Way
""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

""  ============================================================================
""  variable;
""  ============================================================================

""  prefix function dict;
let s:coco_pf_dict = {}

""  prefix string dict;
let s:coco_ps_dict = {
\       'c'         :   '//',
\       'cpp'       :   '//',
\       'cs'        :   '//',
\       'css'       :   '//',
\       'dart'      :   '//',
\       'go'        :   '//',
\       'java'      :   '//',
\       'javascript':   '//',
\       'lua'       :   '--',
\       'objc'      :   '//',
\       'php'       :   '//',
\       'plaintex'  :   '%%',
\       'scala'     :   '//',
\       'scss'      :   '//',
\       'sql'       :   '--',
\       'swift'     :   '//',
\       'tex'       :   '%%',
\       'typescript':   '//',
\       'vim'       :   '""',
\       'xdefaults' :   '!!',
\   }

""  default prefix string;
let s:coco_ps = '#'

""  ============================================================================
""  function;
""  ============================================================================

""  set comment prefix;
function coco#set_prefix()
    while 1
        ""  search g:coco_pf_dict;
        if exists('g:coco_pf_dict')
            let l:PF = get(g:coco_pf_dict, &filetype)
            if l:PF != ''
                let l:ps = l:PF()
                break
            endif
        endif
        ""  search g:coco_ps_dict;
        if exists('g:coco_ps_dict')
            let l:ps = get(g:coco_ps_dict, &filetype)
            if l:ps != ''
                break
            endif
        endif
        ""  search g:coco_ps;
        if exists('g:coco_ps')
            let l:ps = g:coco_ps
            break
        endif
        ""  search s:coco_pf_dict;
        let l:PF = get(s:coco_pf_dict, &filetype)
        if l:PF != ''
            let l:ps = l:PF()
            break
        endif
        ""  search s:coco_ps_dict;
        let l:ps = get(s:coco_ps_dict, &filetype)
        if l:ps != ''
            break
        endif
        ""  search s:coco_ps;
        let l:ps = s:coco_ps
        break
    endwhile

    let b:coco_ps = l:ps
    let b:coco_ps_len = strlen(l:ps)
endfunction

""  comment line;
function coco#comment()
    let l:line = line('.')
    let l:col = col('.')
    let l:getline = getline('.')
    call setline('.', b:coco_ps .. l:getline)
    call cursor(l:line, l:col + b:coco_ps_len)
endfunction

""  uncomment line;
function coco#uncomment()
    let l:line = line('.')
    let l:col = col('.')
    let l:getline = getline('.')
    if l:getline[0:b:coco_ps_len - 1] == b:coco_ps
        call setline('.', l:getline[b:coco_ps_len:])
        call cursor(l:line, l:col - b:coco_ps_len)
    endif
endfunction

""  toggle line comment;
function coco#toggle()
    let l:line = line('.')
    let l:col = col('.')
    let l:getline = getline('.')
    if l:getline[0:b:coco_ps_len - 1] == b:coco_ps
        call setline('.', l:getline[b:coco_ps_len:])
        call cursor(l:line, l:col - b:coco_ps_len)
    else
        call setline('.', b:coco_ps .. l:getline)
        call cursor(l:line, l:col + b:coco_ps_len)
    endif
endfunction

