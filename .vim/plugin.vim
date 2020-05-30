" =================== File Info =====================
"
"  Author: jessun1990@gmail.com
"  Filename: ~/.vim/plugin.vim
"  Desc: plugins config of vim/nvim
"
" ===================================================
"
" ================== Basic Config ===================
" auto download plug.vim
if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

set rtp+=/usr/local/opt/fzf
" ===================================================
"
" ==================== Vim-plug =====================
call plug#begin('~/.vim/plugged')

" Basic plugin =================
if has('nvim')
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" golang ======================
"Plug 'fatih/vim-go',{'do': ':GoUpdateBinaries', 'for': 'go'}

" UI ==========================
Plug 'sheerun/vim-polyglot'           " 语法高亮
Plug 'dense-analysis/ale'

Plug 'flazz/vim-colorschemes'        " 配色主题
"Plug 'rafi/awesome-vim-colorschemes' " 配色主题
Plug 'itchyny/lightline.vim'
" Plug 'voldikss/vim-floaterm'
" Plug 'mengelbrecht/lightline-bufferline'

" general =====================
"Plug 'asins/vimcdoc'
" Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'
" Plug 'kristijanhusak/defx-icons'
Plug 'tommcdo/vim-fugitive-blame-ext' " git 信息
Plug 'tpope/vim-fugitive'             " git 相关

" tags ========================
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

" code ========================
Plug 'liuchengxu/vista.vim' " tag
" Plug 'majutsushi/tagbar'    " tag
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
"Plug 'mg979/vim-visual-multi'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 补全
Plug 'scrooloose/nerdcommenter'       " 注释
Plug 'tpope/vim-surround'             " 快捷操作
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" wxminiapp ===================
" Plug 'chemzqm/wxapp.vim'

" rust =========================
"Plug 'rust-lang/rust.vim'

call plug#end()
"
" ===================================================
"
" ======== 'iamcco/markdown-preview.nvim' ===========
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

let g:mkdp_browserfunc = 'g:open_browser'

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 0,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
"
" ===================================================
"
" ================== 'fatih/vim-go' =================
" let g:go_auto_sameids = 1 " 自动高亮所有相同变量
" let g:go_info_mode="gopls"
" let g:go_auto_type_info = 1
" let g:go_fmt_command = "goimports"
" let g:go_fmt_experimental = 1
" let g:go_def_mode = 'gopls'
" let g:go_referrers_mode = 'gopls'
" let g:go_def_mapping_enabled = 1
" let g:go_metalinter_command = "gopls"
" let g:go_rename_command = 'gopls'
" let g:go_metalinter_command = "gopls"
" "
" " golang highlight
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
"
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dg <Plug>(go-def)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" "
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" "
" au FileType go nmap <Leader>ge <Plug>(go-rename)
" au FileType go nmap <Leader>gf <Plug>(go-info)
" au FileType go nmap <Leader>gs <Plug>(go-implements)
" au FileType go nmap <leader>gu <Plug>(go-build)
" au FileType go nmap <leader>gc <Plug>(go-coverage)
" au FileType go nmap <leader>gr <Plug>(go-run)
" au FileType go nmap <leader>gt <Plug>(go-test)
" let g:go_list_type = "quickfix"
" nmap <Leader>cw :cw 5<CR>  " 打开 quickfix 列表
" nmap <Leader>nn :cnext<CR> "
" nmap <Leader>cn :cnext<CR> " 跳转下一项
" nmap <Leader>mm :cprevious<CR>
" nmap <Leader>cp :cprevious<CR> " 跳转上一项
" ===================================================
"
" =============== 'ense-analysis/ale' ===============
" \   'rust': ['rustfmt']
" \   'go': ['gofmt', 'goimports', 'gomod'],
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" \  'rust': ['rls', 'cargo', 'rustc']
" \  'go': ['gopls'],
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 0   " 自动补全
let g:ale_completion_tsserver_autoimport = 1
let g:ale_echo_msg_error_str = 'Err'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'Wrn'
let g:ale_fix_on_save = 0
let g:ale_keep_list_window_open = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 3
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_rust_rls_executable = '~/.cargo/bin/'
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 1   "保持侧边栏可见
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"
" " 跳转错误行快捷键，所以快捷键是Ctrl+k或j
" "nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" "nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <leader>gg <Plug>(ale_go_to_definition)
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" ===================================================
"
" ============== 'scrooloose/nerdtree' ==============
" nmap <leader>nt :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1  " 显示隐藏文件
" let NERDTreeMapOpenIntab='\r'
" let NERDTreeMinimalUI=1   " 去除第一行的帮助提示
" let NERDTreeWinSize=30    " 在左边占多宽
" let NERDTreeChDirMode = 2 " 当前目录的设定
" "自动退出
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" "autocmd vimenter * NERDTree "打开vim时自动打开
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?",
"     \ }
" ===================================================
"
" =============== 'rust-lang/rust.vim' ==============
" 开启rust的自动reformat的功能，这2个命令底层都是rustfmt
" 区别在于rustfmt需要指定文件，在vim里就是当前文件
"let g:rustfmt_command = 'rustfmt'
"let g:rustfmt_command = 'cargo-fmt --all --'
"let g:rustfmt_options = ''
"let g:rustfmt_autosave = 1 "保存的时候自动格式化
"let g:rust_recommended_style = 1
"let g:rust_playpen_url = 'https://play.rust-lang.org/'
"if has('mac')
    "let g:rust_clip_command = 'pbcopy'
"else
    "let g:rust_clip_command = 'xclip -selection clipboard'
"endif
" " ===================================================
" "
" ============='scrooloose/nerdcommenter' ===========
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" ===================================================
"
" ========================'fzf' =====================
command! -bang LS call fzf#run(fzf#wrap({'source': 'ls'}, <bang>0))

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }
" See `man fzf-tmux` for available options
" if exists('$TMUX')
"   let g:fzf_layout = { 'tmux': '-p90%,60%' }
" else
"   let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" endif

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" ===================================================
"
" ========================'fzf.vim' =====================
nmap <Leader>p :<C-U><C-R>=printf("Files")<CR><CR>
"
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
"
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
"
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
"
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
"
" " Replace the default dictionary completion with fzf-based fuzzy completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" " Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
"
function! s:make_sentence(lines)
    return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction
"
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"
inoremap <expr> <c-x><c-s> fzf#vim#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"
let g:fzf_preview_window = 'right:60%'
" " [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"
" " [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
" " [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R -f ./.tags'
"
" " [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"
" ====================================================
"
" ================== 'vim-easy-align' ================
" 让代码更加易于纵向排版，以=或,符号对齐，使用:Tab /=即按等号对齐
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap ga <Plug>(EasyAlign)
" ====================================================
"
" ================ 'neoclide/coc.nvim' ================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> <space>g :<C-u>CocList<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>f  :call CocAction('format') <CR>
nmap <leader>f  :call CocAction('format') <CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>e :CocCommand explorer<CR>

" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd BufWritePre,BufLeave,VimLeavePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufLeave,VimLeavePre *.go :call CocAction('format')
" ====================================================
"
" =============== 'majutsushi/tagbar' ================
" nnoremap <silent> <Leader>tb :Tagbar<CR>
" ====================================================
"
" ============== 'liuchengxu/vista.vim' ==============
nnoremap <silent> <Leader>vt :Vista!!<CR>
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = [">", ">->"]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
"
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0

autocmd FileType vista nnoremap <buffer> <silent> aa :<c-u>call vista#cursor#FoldOrJump()<CR>
" ====================================================
"
" ================ 'Yggdroot/LeaderF' ================
" don't show the help in normal mode
" let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_Gtagslabel = 'native-pygments'
" let g:Lf_HideHelp = 1
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_PreviewInPopup = 1
" let g:Lf_ShowDevIcons = 0
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" let g:Lf_ShortcutF = "<C-p>"
" let g:Lf_UseCache = 1
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_WindowPosition = 'popup'
" if has('mac')
"    let g:Lf_Ctags = '/usr/local/bin/ctags'
" endif
" " :LeaderfFile 搜索当前目录下所有文件
" " :LeaderfMru 搜索最常用文件
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" " search visually selected text literally
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap go :<C-U>Leaderf! rg --recall<CR>
" " should use `Leaderf gtags --update` first
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"
" "nmap <Leader>p :<C-U><C-R>=printf("Leaderf rg --fuzzy")<CR><CR>
" "nmap <Leader>p :<C-U><C-R>=printf("Leaderf rg --regexMode")<CR><CR>
" highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
" highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201
" let g:Lf_PopupPalette = {
"     \  'light': {
"     \      'Lf_hl_match': {
"     \                'gui': 'NONE',
"     \                'font': 'NONE',
"     \                'guifg': 'NONE',
"     \                'guibg': '#303136',
"     \                'cterm': 'NONE',
"     \                'ctermfg': 'NONE',
"     \                'ctermbg': '236'
"     \              },
"     \      'Lf_hl_cursorline': {
"     \                'gui': 'NONE',
"     \                'font': 'NONE',
"     \                'guifg': 'NONE',
"     \                'guibg': '#303136',
"     \                'cterm': 'NONE',
"     \                'ctermfg': 'NONE',
"     \                'ctermbg': '236'
"     \              }
"     \      }
"     \  }
" ====================================================
"
" ============= 'itchyny/lightline.vim' ==============
function! LightlineFilename()
  return expand('%:p')
  " return expand('%:p:h')
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! BuffGitStatus() abort
  let gitstatus = get(b:, 'coc_git_status', '')
  return gitstatus
endfunction

function! ProGitStatus() abort
  let gitstatus = get(g:, 'coc_git_status', '')
  return gitstatus
endfunction

function! LightlineGitBlame()
  let blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? blame : ''
endfunction

let g:lightline = {}
let g:lightline = {
   \ 'colorscheme': 'seoul256',
   \ 'active': {
   \    'left': [
   \        ['mode', 'paste', 'gitbranch', 'buffgitstatus', 'progitstatus'],
   \     ],
   \    'right': [
   \        ['filetype','fileformat', 'fileencoding','lineinfo','percent'],
   \        ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
   \        ['blame'],
   \     ],
   \ },
   \ 'component_function': {
   \   'blame': 'LightlineGitBlame',
   \   'filename': 'LightlineFilename',
   \   'cocstatus': 'coc#status',
   \   'buffgitstatus': 'BuffGitStatus',
    \  'currentfunction': 'CocCurrentFunction',
   \   'progitstatus': 'ProGitStatus',
   \   'statusdiagnostic': 'StatusDiagnostic',
   \ }
\ }
" \        ['filename']
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
" \  'buffers': 'lightline#bufferline#buffers',
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
" \     'buffer': 'tabsel',
let g:lightline.tabline = {'left': [['filename']]}

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
"let g:lightline#bufferline#unnamed      = '[No Name]'
let g:unite_force_overwrite_statusline = 1
let g:vimfiler_force_overwrite_statusline = 1
let g:vimshell_force_overwrite_statusline = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "[Wrn]"
let g:lightline#ale#indicator_errors = "[Err]"
let g:lightline#ale#indicator_ok = "\uf00c"
autocmd BufEnter ALELint call lightline#update()
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
"
" ====================================================
"
" ================'neoclide/coc-list' ==============
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" ====================================================
"
" ================'neoclide/coc-git' ==============
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" ====================================================
"
"" ================'Shougo/defx.nvim' ==============
" :h defx
" ---
" Problems? https://github.com/Shougo/defx.nvim/issues

" let g:maplocalleader=';'
" nnoremap <silent> <LocalLeader>e
" \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent> <LocalLeader>a
" \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
"
" call defx#custom#option('_', {
"     \ 'winwidth': 25,
"     \ 'split': 'vertical',
"     \ 'direction': 'topleft',
"     \ 'show_ignored_files': 0,
"     \ 'columns': 'indent:git:icons:filename',
"     \ 'root_marker': ' ',
"     \ 'ignored_files':
"     \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
"     \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
"     \ })
"
" call defx#custom#column('git', {
"     \   'indicators': {
"     \     'Modified'  : '•',
"     \     'Staged'    : '✚',
"     \     'Untracked' : 'ᵁ',
"     \     'Renamed'   : '≫',
"     \     'Unmerged'  : '≠',
"     \     'Ignored'   : 'ⁱ',
"     \     'Deleted'   : '✖',
"     \     'Unknown'   : '⁇'
"     \   }
"     \ })
"
" " defx-icons plugin
" let g:defx_icons_column_length = 2
" "let g:defx_icons_mark_icon = ''
"
" " Internal use
" let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')
"
" " Events
" " ---
"
" augroup user_plugin_defx
"     autocmd!
"     " Delete defx if it's the only buffer left in the window
"     autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
"
"     " Move focus to the next window if current buffer is defx
"     autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
"
"     " Clean Defx window once a tab-page is closed
"      autocmd TabClosed * call <SID>defx_close_tab(expand('<afile>'))
"
"     " Automatically refresh opened Defx windows when changing working-directory
"      autocmd DirChanged * call <SID>defx_handle_dirchanged(v:event)
"
"     " Define defx window mappings
"     autocmd FileType defx call <SID>defx_mappings()
"
" augroup END
"
" " Internal functions
" " ---
"
" " Deprecated after disabling defx's (buf)listed
"  function! s:defx_close_tab(tabnr)
"      " When a tab is closed, find and delete any associated defx buffers
"      for l:nr in tabpagebuflist()
"          if getbufvar(l:nr, '&filetype') ==# 'defx'
"              silent! execute 'bdelete '.l:nr
"              break
"          endif
"      endfor
"  endfunction
"
" function! s:defx_toggle_tree() abort
"     " Open current file, or toggle directory expand/collapse
"     if defx#is_directory()
"         return defx#do_action('open_or_close_tree')
"     endif
"     return defx#do_action('multi', ['drop', 'quit'])
" endfunction
"
" function! s:defx_handle_dirchanged(event)
"     " Refresh opened Defx windows when changing working-directory
"     let l:cwd = get(a:event, 'cwd', '')
"     let l:scope = get(a:event, 'scope', '')   " global, tab, window
"     let l:current_win = winnr()
"     if &filetype ==# 'defx' || empty(l:cwd) || empty(l:scope)
"         return
"     endif
"
"     " Find tab-page's defx window
"     for l:nr in tabpagebuflist()
"         if getbufvar(l:nr, '&filetype') ==# 'defx'
"             let l:winnr = bufwinnr(l:nr)
"             if l:winnr != -1
"                 " Change defx's window directory location
"                 if l:scope ==# 'window'
"                     execute 'noautocmd' l:winnr . 'windo' 'lcd' l:cwd
"                 else
"                     execute 'noautocmd' l:winnr . 'wincmd' 'w'
"                 endif
"                 call defx#call_action('cd', [ l:cwd ])
"                 execute 'noautocmd' l:current_win . 'wincmd' 'w'
"                 break
"             endif
"         endif
"     endfor
" endfunction
"
" function! s:jump_dirty(dir) abort
"     " Jump to the next position with defx-git dirty symbols
"     let l:icons = get(g:, 'defx_git_indicators', {})
"     let l:icons_pattern = join(values(l:icons), '\|')
"
"     if ! empty(l:icons_pattern)
"         let l:direction = a:dir > 0 ? 'w' : 'bw'
"         return search(printf('\(%s\)', l:icons_pattern), l:direction)
"     endif
" endfunction
"
" function! s:defx_mappings() abort
"     " Defx window keyboard mappings
"     setlocal signcolumn=no expandtab
"
"     nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
"     nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
"     nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
"     nnoremap <silent><buffer><expr> h     defx#do_action('close_tree')
"     nnoremap <silent><buffer><expr> t     defx#do_action('open_tree_recursive')
"     nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
"     nnoremap <silent><buffer><expr> sg    defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
"     nnoremap <silent><buffer><expr> sv    defx#do_action('multi', [['drop', 'split'], 'quit'])
"     nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
"     nnoremap <silent><buffer><expr> y     defx#do_action('yank_path')
"     nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
"     nnoremap <silent><buffer><expr> gx    defx#do_action('execute_system')
"     nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
"
"     " Defx's buffer management
"     nnoremap <silent><buffer><expr> q      defx#do_action('quit')
"     nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
"     nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
"     nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
"
"     " File/dir management
"     nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
"     nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
"     nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
"     nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
"     nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
"     nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
"     nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')
"
"     " Jump
"     nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
"     nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>
"
"     " Change directory
"     nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
"     nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
"     nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
"     nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
"     nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
"     nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
"     nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
"     nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])
"
"     " Selection
"     nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
"     nnoremap <silent><buffer><expr><nowait> <Space>
"         \ defx#do_action('toggle_select') . 'j'
"
"     nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
"     nnoremap <silent><buffer><expr> C
"         \ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')
"
"     " Tools
"     nnoremap <silent><buffer><expr> w   defx#do_action('call', '<SID>toggle_width')
"     nnoremap <silent><buffer><expr> gd  defx#async_action('multi', ['drop', ['call', '<SID>git_diff']])
"     nnoremap <silent><buffer><expr> gr  defx#do_action('call', '<SID>grep')
"     nnoremap <silent><buffer><expr> gf  defx#do_action('call', '<SID>find_files')
"     if exists('$TMUX')
"         nnoremap <silent><buffer><expr> gl  defx#async_action('call', '<SID>explorer')
"     endif
" endfunction
"
" " TOOLS
" " ---
"
" function! s:git_diff(context) abort
"     execute 'GdiffThis'
" endfunction
"
" function! s:find_files(context) abort
"     " Find files in parent directory with Denite
"     let l:target = a:context['targets'][0]
"     let l:parent = fnamemodify(l:target, ':h')
"     silent execute 'wincmd w'
"     silent execute 'Denite file/rec:'.l:parent
" endfunction
"
" function! s:grep(context) abort
"     " Grep in parent directory with Denite
"     let l:target = a:context['targets'][0]
"     let l:parent = fnamemodify(l:target, ':h')
"     silent execute 'wincmd w'
"     silent execute 'Denite grep:'.l:parent
" endfunction
"
" function! s:toggle_width(context) abort
"     " Toggle between defx window width and longest line
"     let l:max = 0
"     for l:line in range(1, line('$'))
"         let l:len = len(getline(l:line))
"         let l:max = max([l:len, l:max])
"     endfor
"     let l:new = l:max == winwidth(0) ? s:original_width : l:max
"     call defx#call_action('resize', l:new)
" endfunction
"
" function! s:explorer(context) abort
"     " Open file-explorer split with tmux
"     let l:explorer = s:find_file_explorer()
"     if empty('$TMUX') || empty(l:explorer)
"         return
"     endif
"     let l:target = a:context['targets'][0]
"     let l:parent = fnamemodify(l:target, ':h')
"     let l:cmd = 'split-window -p 30 -c ' . l:parent . ' ' . l:explorer
"     silent execute '!tmux ' . l:cmd
" endfunction
"
" function! s:find_file_explorer() abort
"     " Detect terminal file-explorer
"     let s:file_explorer = get(g:, 'terminal_file_explorer', '')
"     if empty(s:file_explorer)
"         for l:explorer in ['lf', 'hunter', 'ranger', 'vifm']
"             if executable(l:explorer)
"                 let s:file_explorer = l:explorer
"                 break
"             endif
"         endfor
"     endif
"     return s:file_explorer
" endfunction
" ====================================================
"
" ================== Reset Config ===================
""
" 移除左侧到波浪线
function! RemoveWavyline()
    hi NonText guifg=bg
endfunction
"
" 隐藏波浪线
if has("gui_running") " GUI
    if has("gui_macvim") " MacVim
        "set guifont=JetBrains\ Mono:h17
        colorscheme mod8
        autocmd BufEnter * call RemoveWavyline()
        "colorscheme NeoSolarized
    elseif " Linux Or Windows Gvim
    endif
else " Terminal
    colorscheme mod8
    if has('mac') " MacOS iterm2 or termial
        colorscheme mod8
    endif " Linux termial
endif
" ===================================================i
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets
