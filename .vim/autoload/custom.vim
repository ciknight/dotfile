"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" 标示不必要的空白字符
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" 保存文件时删除多余空格 {{{
fun! <SID>StripTrailingWhitespaces()
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//
    call setpos('.', cursor_pos)
endfun
" }}}
autocmd FileType vim,c,cpp,java,javascript,python,xml,yml,vim autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数SetTitle，自动插入文件头 {{{
function! SetTitle()
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding: utf-8 -*-")
        call append(line(".")+1, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'lua'
        call setline(1,"#!/usr/local/bin lua")
        call append(line("."), "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "	> File Name: ".expand("%"))
        call append(line(".")+1, "	> Author: ")
        call append(line(".")+2, "	> Mail: ")
        call append(line(".")+3, "	> Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    " 新建文件后，自动定位到文件末尾
endfunc
" }}}
autocmd BufNewFile *.cpp,*.sh,*.rb,*.java,*.py,*.c,*.h,*.lua exec ":call SetTitle()"

" 保存文件最后编辑位置 {{{
autocmd BufNewFile * normal G
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! G`\"" |
            \ endif
" }}}
