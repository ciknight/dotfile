"==========================================
" .vimrc of ci_knight
"
" blog site https://blog.ibeats.top
"
"==========================================


"==========================================
" Initial Vim Plugin
"==========================================
if filereadable(expand("~/.vim/autoload/init.vim"))
    source ~/.vim/autoload/init.vim
endif

" 编辑vimrc之后，重新加载 :source %
" autocmd BufWritePost $MYVIMRC source $MYVIMRC


"==========================================
" General Settings
"==========================================
if filereadable(expand("~/.vim/autoload/config.vim"))
    source ~/.vim/autoload/config.vim
endif


"==========================================
" Key Map
"==========================================
if filereadable(expand("~/.vim/autoload/keymap.vim"))
    source ~/.vim/autoload/keymap.vim
endif


"==========================================
" Code Language Setting
"==========================================
if filereadable(expand("~/.vim/language.vim"))
    source ~/.vim/language.vim
endif


"==========================================
" Custom Plugin
"==========================================
if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif


"==========================================
" Plugin Setting
"==========================================
" ====> Theme <====
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme molokai
endif

" ====> Tagbar <====
let g:tagbar_width=35
let g:tagbar_autofocus=1
nnoremap <Leader>t :TagbarToggle<CR>

" ====> ale <====
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'vim' : ['vint'],
\   'python' : ['flake8'],
\   'markdown' : ['mdl'],
\   'sh' : ['shellcheck'],
\   'javascript' : ['eslint'],
\}
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', 'OK']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
highlight ALEErrorSign ctermfg=197 ctermbg=236
highlight ALEWarningSign ctermfg=192 ctermbg=236
" For a more fancy ale statusline
function! ALEGetError()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+') .' '
        endif
    endif
endfunction
function! ALEGetWarning()
    let l:res = ale#statusline#Status()
    if l:res ==# 'OK'
        return ''
    else
        let l:e_w = split(l:res)
        if len(l:e_w) == 2
            return ' •' . matchstr(l:e_w[1], '\d\+')
        elseif match(l:e_w, 'W') > -1
            return ' •' . matchstr(l:e_w[0], '\d\+')
        endif
    endif
endfunction

" ====> gitgutter <====
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 200
let g:gitgutter_async = 1

" ====> Nerd Tree <====
let NERDChristmasTree=0
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeShowBookmarks=1
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示书签
let NERDTreeShowBookmarks=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 打开文件后关闭File Tree
" let NERDTreeQuitOnOpen=1
" Automatically open a NERDTree if no files where specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 打开关闭 NERDTree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
fun! ToggleNERDTreeWithRefresh()
    :NERDTreeToggle
    if(exists("b:NERDTreeType") == 1)
        call feedkeys("R")
    endi
endf
nnoremap <silent> <Leader>r :call ToggleNERDTreeWithRefresh()<CR>

" ====> Ctrlp <====
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']
" 显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

" ====> Indent Guides <====
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" ====> Ctrlsf <====
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" ====> YCM <====
" YCM 补全菜单配色
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228))
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments=1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_complete_in_strings=1
let g:syntastic_always_populate_loc_list=1
let g:ycm_autoclose_preview_window_after_completion=1
" Switch between the last two files
nnoremap <leader><leader> <c-^>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}

" ====> Ultisnips <====
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ====> Rainbow <====
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
            " 不加入这行, 防止黑色括号出现, 很难识别
            " \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ====> Vim Multple cursor <====
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
" let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" 修复ctrl+m
" 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" ====> Vim easy align <====
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" ====> quick run <====
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "message",
            \   },
            \}
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" ====> Vim expand region <====
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ====> nerdcommenter <====
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
" let g:NERDSpaceDelims=1

" ====> airline <====
" 启动显示状态行(1),总是显示状态行(2)
if !exists('g:airline_powerline_fonts')
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
endif
" 是否打开tabline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'

" ====> isort <====
" Shift-V 上下选中, ctrl + i 规范化
let g:vim_isort_map = '<C-i>'

" ====> React Native <====
let g:jsx_ext_required = 0

" ====> Emmet <====
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" only use html,css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default <C-Y> leader:>
" let g:user_emmet_leader_key='<C-Y>'
" scss support
