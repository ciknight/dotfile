func! Runit()
    exec "w"
    if &filetype == 'c'
        exec "!gcc  % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype =='python'
        exec "!python %"
    elseif &filetype=='ruby'
        exec "!ruby %"
    elseif &filetype=='javascript'
        exec "!node %"
    elseif &filetype=='sh'
        exec "!sh %"
    elseif &filetype=='go'
        exec "!go run %"
    elseif &filetype=='coffee'
        exec "!coffee %"
    elseif &filetype=='less'
        exec "!lessc % %<.css"
    elseif &filetype=='lua'
        exec "!lua %"
    elseif &filetype=='rust'
        exec "!rustc % -o %<"
        exec "! ./%<"
    endif
endfunc
