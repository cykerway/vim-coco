""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
""  coco: vim code commentator;
""
""  Copyright (C) 2015-2022 Cyker Way
""  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

""  mapping;
noremap <Plug>(coco_comment)        :call coco#comment()<CR>
noremap <Plug>(coco_uncomment)      :call coco#uncomment()<CR>
noremap <Plug>(coco_toggle)         :call coco#toggle()<CR>

""  command;
com -nargs=0 -range CocoComment     :<line1>,<line2>call coco#comment()
com -nargs=0 -range CocoUncomment   :<line1>,<line2>call coco#uncomment()
com -nargs=0 -range CocoToggle      :<line1>,<line2>call coco#toggle()

""  autocmd;
aug coco
    au!
    au FileType * call coco#set_prefix()
aug END

