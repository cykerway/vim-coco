# vim-coco

a vim code commentator;

only line comments are supported (feature, not bug);

## install

install assumes vim 8.0 or later;

### with git

    mkdir -p ~/.vim/pack/foo/start
    cd ~/.vim/pack/foo/start
    git clone https://github.com/cykerway/vim-coco.git

### without git

    mkdir -p ~/.vim/pack/foo/start/vim-coco
    cp plugin ~/.vim/pack/foo/start/vim-coco/

## usage

`coco` provides 3 functions:

-   `CocoComment()`: comment a line;

-   `CocoUncomment()`: uncomment a line;

-   `CocoToggle()`: toggle a line comment;

you can call them directly:

    :call CocoComment()

or map them to key sequences:

    :map <C-c> :call CocoComment()<CR>
    :map <C-u> :call CocoUncomment()<CR>
    :map <C-t> :call CocoToggle()<CR>

you can map them in vimrc;

## config

`coco` provides 2 config variables:

-   `g:cocoPrefixDict` is a dict: (filetype) -> (comment prefix); default:

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

-   `g:cocoDefaultPrefix` is a string: default comment prefix; default:

        let g:cocoDefaultPrefix = '#'

you can override defaults in vimrc;

## license

Copyright (c) 2015-2022 Cyker Way

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <https://www.gnu.org/licenses/>.

