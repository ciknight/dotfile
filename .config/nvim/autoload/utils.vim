" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> Free | <F2> NERDTree | <F3> Free | <F4> SpellCheck | <F5> Free | <F6> Free |' .
        \' <F7> Whitechars | <F8> Built-in terminal | <F9> Free | <F10> Free  | <F11> Free |' .
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

" Strip trailing spaces
function! g:utils#stripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Tab wrapper
function! g:utils#tabComplete() abort
  let l:col = col('.') - 1

  if pumvisible()
    return "\<C-n>"
  else
    if !l:col || getline('.')[l:col - 1] !~# '\k'
      return "\<TAB>"
    else
      return "\<C-n>"
    endif
  endif
endfunction

" Manual Tag complete
function! g:utils#manualTagComplete() abort
  if pumvisible()
    return g:deoplete#mappings#close_popup()
  else
    return g:deoplete#mappings#manual_complete('tag')
  endif
endfunction

" Use omni complete source as default
function! g:utils#useOmniTabWrapper() abort
  inoremap <buffer> <expr> <TAB> utils#insertTabOmniWrapper()
endfunction

" Format function, # NOT USED
" Needs: `npm install js-beautify`, `gem install ruby-beautify`, `python`
"function! g:utils#formatFile() abort
"  let l:line = line('.')
"  let l:col = col('.')
"  let l:command_prefix = '%!'

"  if &filetype ==? 'javascript.jsx'
"    let l:command = 'js-beautify -X -f -'
"  elseif &filetype ==? 'html'
"    let l:command = 'html-beautify -f -'
"  elseif &filetype ==? 'css'
"    let l:command = 'css-beautify -f -'
"  elseif &filetype ==? 'json'
"    let l:command = 'python -m json.tool'
"  elseif &filetype ==? 'ruby'
"    let l:command = 'ruby-beautify -c 2 -s'
"  else
"    " Basic vim format fallback
"    normal! gg=G
"  endif

"  if exists('l:command')
"    execute l:command_prefix . l:command
"  endif

"  " Return back to where cursor was
"  call cursor(l:line, l:col)
"endfunction

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
" LinterStatus, use ale
function! g:utils#LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" Run NERDTreeFind or Toggle based on current buffer
function! g:utils#nerdWrapper() abort
  if &filetype ==# '' " Empty buffer
    :NERDTreeToggle
  elseif expand('%:t') =~? 'NERD_tree' " In NERD_tree buffer
    wincmd w
  else " Normal file buffer
    :NERDTreeFind
  endif
endfunction

" Open Tagbar
function! g:utils#TabBar() abort
  :TagbarToggle
endfunction

" set python debug break point
fun! g:utils#PyBreakPointOperate(lnum) abort "{{{
    let py_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # ipdb breakpoint'

    let line = getline(a:lnum)
    let plnum = prevnonblank(a:lnum)
    if &expandtab
        let indents = repeat(' ', indent(plnum))
    else
        let indents = repeat("\t", plnum / &shiftwidth)
    endif

    call append(line('.')-1, indents.py_breakpoint_cmd)
    normal k
endfunction "}}}

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
    normal G
    normal o
    normal o

endfunc
"}}}

"}}}
