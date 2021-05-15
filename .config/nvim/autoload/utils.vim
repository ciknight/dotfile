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

"}}}
