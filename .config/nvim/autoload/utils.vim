" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> Free | <F2> File Explorer | <F3> TabBar | <F4> SpellCheck | <F5> Free | <F6> Free |' .
        \' <F7> Whitechars | <F8> Free | <F9> Free | <F10> Free  | <F11> Free |' .
        \' <F12> This message'
endfunction

" Profile neovim and save results to profile.log
function! g:utils#profile() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
  echom 'Profiling started (will last until you quit neovim).'
endfunction

" When cycling ignore NERDTree and Tagbar
function! g:utils#intelligentCycling() abort
  " Cycle firstly
  wincmd w
  " Handle where you are now
  if &filetype ==# 'nerdtree'
    call g:utils#intelligentCycling()
  endif
  " If in terminal buffer start insert
  if &buftype ==# 'terminal'
    startinsert!
  endif
endfunction

" Be aware of whether you are right or left vertical split
" so you can use arrows more naturally.
" Inspired by https://github.com/ethagnawl.
function! g:utils#intelligentVerticalResize(direction) abort
  let l:window_resize_count = 5
  let l:current_window_is_last_window = (winnr() == winnr('$'))

  if (a:direction ==# 'left')
    let [l:modifier_1, l:modifier_2] = ['+', '-']
  else
    let [l:modifier_1, l:modifier_2] = ['-', '+']
  endif

  let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
  let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
  execute l:command
endfunction

" Search current word with CtrlSF
" Inspired by github.com/zenbro
function! g:utils#searchCurrentWordWithAg() abort
  execute 'CtrlSF' expand('<cword>')
endfunction

" Reset tabs to 4 spaces
function! g:utils#retabToFourSpaces() abort
  setlocal tabstop=4 shiftwidth=4 expandtab
  retab
endfunction

" Reset tabs to 2 spaces
function! g:utils#retabToTwoSpaces() abort
  setlocal tabstop=2 shiftwidth=2 expandtab
  retab
endfunction

" -----------------------------------------------------
" Third Party {{{
" -----------------------------------------------------
" Open Tagbar
function! g:utils#TabBar() abort
  :TagbarToggle
endfunction

" 定义函数SetFileTitle，自动插入文件头 {{{
fun! g:utils#SetFileTitle()
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/usr/bin/env bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding: utf-8 -*-")
        call append(line(".")+1, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line(".")+1, "")
    elseif &filetype == 'lua'
        call setline(1,"#!/usr/local/bin lua")
        call append(line("."), "")
    elseif &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    elseif &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    else
        call setline(1,          "/*************************************************************************")
        call append(line("."),   "  > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    elseif expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif

    " 新建文件后，自动定位到文件末尾
    normal G

endfunc
"}}}

"}}}
