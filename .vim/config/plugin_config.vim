" ====> Theme <====
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme NeoSolarized  " molokai
endif
" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0


" ====> Tagbar <====
let g:tagbar_width = 35
let g:tagbar_autofocus = 1
nnoremap <Leader>t :TagbarToggle<CR>


" ====> ale <====
let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'never'
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
" For a more fancy ale statusline {{{
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
" }}}


" ====> gitgutter <====
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_max_signs = 300
let g:gitgutter_async = 1

" ====> Nerd Tree <====
let NERDChristmasTree = 0
" 设置NERDTree子窗口宽度
let NERDTreeWinSize = 32
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeShowBookmarks = 1
" 设置NERDTree子窗口位置
let NERDTreeWinPos = "left"
" 显示隐藏文件
let NERDTreeShowHidden = 1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI = 1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer = 1
" 显示书签
let NERDTreeShowBookmarks = 1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1
" 打开文件后关闭File Tree
let NERDTreeQuitOnOpen = 1
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
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_filetype_blacklist={
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}
let g:ycm_python_binary_path = '/usr/local/bin/python3'


" ====> jedi-vim <====
let g:jedi#completions_enabled=1
let g:jedi#popup_on_dot=1
let g:jedi#smart_auto_mappings=0 " auto from import
let g:jedi#goto_command="<leader>d"
" let g:jedi#goto_assignments_command="<leader>g"
" let g:jedi#goto_definitions_command=""
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>n"
let g:jedi#completions_command="<C-Space>"
let g:jedi#rename_command="<leader>r"

" ====> Ultisnips <====
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ====> Rainbow <====
let g:rbpt_colorpairs=[
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
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
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
    let g:easy_align_delimiters={}
endif
let g:easy_align_delimiters['#']={ 'pattern': '#', 'ignore_groups': ['String'] }


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
if empty(glob('~/.fonts/README.rst'))
  let g:airline_powerline_fonts=0
else
  let g:airline_powerline_fonts=1
endif
if !exists('g:airline_powerline_fonts')
    if !exists('g:airline_symbols')
        let g:airline_symbols={}
    endif
    let g:airline_symbols.linenr='␊'
    let g:airline_symbols.linenr='␤'
    let g:airline_symbols.linenr='¶'
    let g:airline_symbols.branch='⎇'
    let g:airline_symbols.paste='Þ'
    let g:airline_symbols.whitespace='Ξ'
    let g:airline_left_sep='▶'
    let g:airline_left_alt_sep='❯'
    let g:airline_right_sep='◀'
    let g:airline_right_alt_sep='❮'
endif
" 是否打开tabline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='minimalist' " molokai
let g:airline_section_error='%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'


" ====> vim-yapf <====
let g:yapf_style_conf="~/.config/yapf/style"


" ====> isort <====
" isort don't support python3 and venv
" Shift-V 上下选中, ctrl + i 规范化
" let g:vim_isort_map='<C-i>'
" let g:vim_isort_python_version='python2'
