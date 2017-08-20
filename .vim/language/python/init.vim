" set python pep8
autocmd BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set colorcolumn=+1 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |


fun! PyBreakPointOperate(lnum) "{{{
    let py_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX BREAKPOINT'

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

nnoremap <silent> <buffer> <leader>b :call PyBreakPointOperate(line('.'))<CR>
