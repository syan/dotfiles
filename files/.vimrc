" === Initialize {{{
" 初期設定 {{{
version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
" <Leader> をmに <LocalLeader>を,に  {{{
let mapleader = 'm'
let g:mapleader = 'm'
let g:maplocalleader = ','
" }}}
" キーマップ開放 {{{
nnoremap ; <Nop>
xnoremap ; <Nop>
nnoremap m <Nop>
xnoremap m <Nop>
nnoremap , <Nop>
xnoremap , <Nop>
nnoremap s <Nop>
xnoremap s <Nop>
" }}}
nnoremap ; :
map! <S-Insert> <MiddleMouse>
vmap  "*d
map Q gq
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)

vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
map <S-Insert> <MiddleMouse>
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
filetype plugin on
" }}}
" == Configure {{{
" Basic {{{
" set ambiwidth=auto
set autoindent
set backspace=2
set backupdir=~/.vimtmp/backup-files/
set backup
set cmdheight=2
set directory=~/.vimtmp/vimswp/,/tmp/vimswap,.
"set fileencodings=guess,ucs-bom,ucs-2le,ucs-2,iso-2022-jp-3,utf-8,euc-jisx0213,euc-jp
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set formatexpr=Format_Japanese()
set formatoptions=tcqmM
"set guifont=MS_Gothic:h12:cSHIFTJIS
set guifont=Menlo-Regular:h12
set helplang=ja,en
set history=10000
set hlsearch
set ignorecase
set iminsert=0
set imsearch=0
set incsearch
set laststatus=2
set printfont=MS_Mincho:h12:cSHIFTJIS
set ruler
set showmatch
set smartcase
set modeline
set modelines=5
set title
set wildmenu
set timeoutlen=500
" }}}
" editing {{{
syntax on
set tabstop=4
set shiftwidth=4
set virtualedit=all
" }}}
" ステータス行 {{{
"set statusline=%F%m%r%h%w\%=[FMT=%{&ff}]\[TYPE=%Y]\%{'[ENC='.(&fenc!=''?&fenc:&enc).']'}[ASCII=\%03.3b]\[HEX=\%02.2B]\[POS=%05l/%05L,%05v][%p%%]
set statusline=%F%m%r%h%w\%=[%{&ff}:%Y:%{(&fenc!=''?&fenc:&enc)}][CHR=\%03.3b(\%02.2B)]\[POS=%04l/%04L,%03v][%p%%]
" }}}
" list tab setting {{{
set list
set lcs=tab:>.,eol:$,trail:_,extends:\
" }}}
" tags {{{
set tags=tags;
" }}}
" yank test to clipboad {{{
set clipboard+=unnamed
" }}}
" Initialize execute file list. {{{
nnoremap <silent> sv :tabnew<CR>:tabmove<CR>:VimShellCreate<CR>
nnoremap <silent> sV :VimShell<CR>
" }}}
" オートインデント：ON {{{
set autoindent
" }}}
" }}}

" init pathogen {{{
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
" }}}
" NeoBundle {{{
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle/autoload/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/neobundle/plugins/'))
endif

" NeoBundleのリポジトリ登録
source ~/.vim/bundles.vim

filetype plugin indent on     " required!
" }}}
" color {{{
"colorscheme slate
"colorscheme slate
"colorscheme darkZ
"colorscheme desert
"colorscheme torte
colorscheme ron

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=3%dm
  set t_Sb=4%dm
elseif &term =~ "xterm-debian" || "xterm-xfree86"
  set t_Co=16
  set t_Sf=3%dm
  set t_Sb=4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=3%dm
  set t_Sb=4%dm
endif
" }}}
" }}}
"======= 基本動作 ======= {{{
" 折り畳み(zf) {{{
"set foldcolumn=4
set foldmethod=marker
" }}}
" カッコの自動補完 {{{
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>
" }}}
" 行頭にマッチを簡単に {{{
nnoremap // /^
" }}}
" vimgrep時に自動でQuickFixを開く設定 {{{
au QuickfixCmdPost vimgrep cw
au QuickfixCmdPost grep cw
" }}}
" tab move keys {{{
"- [tN]tab new 
nnoremap <silent> tN :tabnew<Cr>
"- [tn]tab next 
nnoremap <silent> tn :tabnext<Cr>
"- [tp]tab before
nnoremap <silent> tp :tabprevious<Cr>
"- [to]tab only
nnoremap <silent> to :tabonly<Cr>
"- [tO]tab only!
nnoremap <silent> tO :tabonly!<Cr>
"- [tc]tab close
nnoremap <silent> tc :tabclose<Cr>
" }}}
" C-] C-@ でESC {{{
inoremap  <Esc>
inoremap <C-@> <Esc>
" }}}
" }}}
"======== FileType ======== {{{
" Python {{{
let python_highlight_all = 1
autocmd BufRead *.py setlocal nosmartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py filetype plugin indent on
"au BufEnter *.py setlocal indentkeys+=0#
" }}}
" Vim {{{
" auto reload vim script
autocmd BufWritePost,FileWritePost {*.vim,*vimrc} if &autoread | source <afile> | endif
" }}}
" imacros {{{
au BufRead,BufNewFile *.iim			set filetype=imacros
" }}}
" }}}
"======== PLUGINS ======== {{{
" = vimshell.vim {{{
" Initialize execute file list.
nnoremap <silent> sv :tabnew<CR>:tabmove<CR>:VimShellCreate<CR>
nnoremap <silent> sV :VimShell<CR>

let g:VimShell_UseCkw = 0

if !exists('g:vimshell_interactive_encodings')
    let g:vimshell_interactive_encodings = {}
endif
let g:vimshell_interactive_encodings['ls'] = 'utf8'
" }}}
" = VimFiler {{{
nnoremap <silent> sf :VimFiler<CR>
nnoremap <silent> sF :VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" }}}
" = neocomplcache.vim {{{
"autocomplpopを無効化
let g:AutoComplPop_NotEnableAtStartup = 1

"neocomplcacheの設定 v5.2 {{{
" 全体 {{{
"起動時にネオコンをOnにするか
let g:neocomplcache_enable_at_startup = 1
" ctagsの場所
" let g:neocomplcache_ctags_program = 'ctags'
let g:neocomplcache_ctags_program = '/usr/local/ctags'
" }}}
" 表示 {{{
" - ポップアップする候補の最大数(100)
let g:neocomplcache_max_list = 100
" - メニューの幅(50)
let g:neocomplcache_max_keyword_width = 50
" - ファイル名の表示幅(15)
let g:neocomplcache_max_menu_width = 15
" }}}
" 入力 {{{
" - 補完開始の文字数(2)
let g:neocomplcache_auto_completion_start_length = 3
" - 手動補完時の補完開始数(2)
let g:neocomplcache_manual_completion_start_length = 3
" }}}
" キャッシュ {{{
" - バッファや辞書で補完対象となるキーワードの最小(4)
let g:neocomplcache_min_keyword_length = 4
" - シンタックスファイルで補完対象となるキーワードの最小(4)
let g:neocomplcache_min_syntax_length = 4
" キャッシュサイズのリミット(500000)
let g:neocomplcache_caching_limit_file_size = 500000
" }}}
" 候補検索 {{{
" 検索はスマートケースで(0)
let g:neocomplcache_enable_smart_case = 1

" }}}

" }}}

"@Depricated
"if !exists('g:NeoComplCache_KeywordPatterns')
"    let g:NeoComplCache_KeywordPatterns = {}
"endif
"let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'

if !exists('g:NeoComplCache_OmniPatterns')
    let g:NeoComplCache_OmniPatterns = {}
endif
let g:NeoComplCache_OmniPatterns['sql'] = '\v\h\w*'
 
" Plugin key-mappings.
" imap <silent><C-l> <Plug>(neocomplcache_snippets_expand)
" smap <silent><C-l> <Plug>(neocomplcache_snippets_expand)
" nmap <silent><C-e> <Plug>(neocomplcache_keyword_caching)
" imap <expr><silent><C-e> pumvisible() ? "\<C-e>" : "\<Plug>(neocomplcache_keyword_caching)"
 
" Plugin key-mappings.
imap <C-l>     <Plug>(neocomplcache_snippets_expand)
smap <C-l>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
inoremap <expr><C-g>     neocomplcache#undo_completion()

autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

" }}}
" Unite {{{
" smartcase ON
let g:unite_enable_ignore_case=1
let g:unite_enable_start_insert=1
nnoremap <silent> <F2> :Unite file_mru<CR>
nnoremap <silent> <F3> :Unite buffer<CR>
nnoremap <silent> <F4> :Unite bookmark<CR>
nnoremap <silent> <C-B> :Unite buffer bookmark<CR>
nnoremap <silent> <C-E> :Unite buffer bookmark file<CR>
nnoremap <silent> sb :Unite bookmark buffer<CR>
nnoremap <silent> se :UniteWithBufferDir file<CR>
nnoremap <silent> sE :UniteWithCurrent file<CR>
nnoremap <silent> sr :Unite file_mru<CR>
nnoremap <silent> si :UniteWithInput buffer bookmark file file_mru<CR>
"nnoremap <silent> sg :Unite grep:%<CR>
nnoremap <silent> sg :Unite grep:$buffers<CR>
vnoremap <silent> sg "vy:Unite grep:$buffers:-iHn:<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nnoremap <silent> sG :Unite grep<CR>
vnoremap <silent> sG "vy:Unite grep:::<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
nnoremap <silent> sH :Unite help<CR>
nnoremap <silent> ss :UniteResume<CR>
"nnoremap <silent> sf :Unite file_rec<CR>
nnoremap <silent> sm :Unite mapping<CR>

call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

" - Unite grep {{{
" windowsのパスがつかえない
let g:unite_source_grep_command='grep'
let g:unite_source_grep_recursive_opt='-R'
let g:unite_source_grep_default_opts='-iRHn'

" }}}
" - Unite outline {{{
nnoremap <silent> so :Unite outline -vertical<CR>
nnoremap <silent> sO :Unite outline:! -vertical -auto-preview<CR>
let g:unite_source_outline_verbose = 1
" }}}
" }}}
" QuickRun {{{

if !exists('g:quickrun_config')
	let g:quickrun_config = {}
	let g:quickrun_config['*'] = {}
"let g:quickrun_config.javascript = {'command' : 'CScript.exe'}
endif
let g:quickrun_config["*"] = {'runmode': "async:vimproc", 'split' : "rightbelow"}

" let g:QuickRunConfig.javascript = {'command' : 'CScript.exe'}

" }}}
" zencoding {{{
"ommnifunc
let g:use_zen_complete_tag = 1
" }}}
" quickhl {{{
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
nmap <Space>/ :QuickhlAdd
nmap <Space>? :QuickhlDel
" }}}
" QFixMemo {{{
let g:QFixHowm_Convert = 0
let g:qfixmemo_dir = '~/qfixmemo'
let g:qfixmemo_ext = 'mkd'
" }}}
" TagExplorer {{{
nnoremap <silent> <F8> :TagExplorer<CR>
nnoremap <silent> <S-F8> :cd %:h<CR>:TagExplorer<CR>
let TE_Exclude_File_Pattern = '.*\.o$\|.*\.obj$\|.*\.meta$\|\.DS_Store$\|.*\.bak$'
" }}}
" Tlist {{{
let Tlist_Use_Horiz_Window = 1
nnoremap <silent> <F9> :Tlist<CR>
" }}}
" PowerLine {{{
" let g:Powerline_symbols = 'fancy'
" }}}
" }}}
" ========== MACROS ========= {{{
" matchit {{{
source $VIMRUNTIME/macros/matchit.vim
" }}}
" }}}
" ========  便利機能 ======== {{{
" commandline window {{{
" http://vim-users.jp/2010/07/hack161/
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nnoremap s: <Esc>:<C-u>
nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction


" function! s:init_cmdwin()
"         call altercmd#define('b', 'gr[ep]', 'Grep', 'i')
"         " AlterCommand <buffer><mode:i> gr[ep] Grepでも可
" endfunction
" }}}
" - 文字コードの自動認識 {{{
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}
" - diffで空白を無視 {{{
set diffexpr=IgnoreSpaceDiff()
function! IgnoreSpaceDiff()
  let opt = ""
  if &diffopt =~ "icase"
    let opt = opt . "-i "
  endif
  if &diffopt =~ "iwhite"
    let opt = opt . "-b "
  endif
  silent execute "!diff --ignore-all-space -a " . opt .
        \  v:fname_in . " " . v:fname_new .
        \  " > " . v:fname_out
endfunction
" }}}
" - buffer to BIG {{{
command! Big wincmd _ | wincmd |
" }}}
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}
" <space>ao move current buffer into a new tab. {{{
nnoremap <silent> <Space>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>
" }}}
" tab move keys {{{
"- [tN]tab new 
nnoremap <silent> tN :tabnew<Cr>
"- [tn]tab next 
nnoremap <silent> tn :tabnext<Cr>
"- [tp]tab before
nnoremap <silent> tp :tabprevious<Cr>
"- [to]tab only
nnoremap <silent> to :tabonly<Cr>
"- [tO]tab only!
nnoremap <silent> tO :tabonly!<Cr>
"- [tc]tab close
nnoremap <silent> tc :tabclose<Cr>
" }}}
" visual mode *# {{{
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" }}}
" s//で前回検索を置換 {{{
nnoremap s/ :<C-u>%s///<Left>
" }}}
" [off]poslist {{{
" map <C-S-o> <Plug>(poslist_prev)
" map <C-S-i> <Plug>(poslist_next)
"let g:dbext_default_profile = 'ORA'
" Oracle
"let g:dbext_default_profile_ORA = 'type=ORA:srvname=TIDDB01_DB:user=TID01_USR:passwd=TIDTID'
" Oracle SQL Connect URL string (notice the : is escaped for the port option)
"let g:dbext_default_profile_ORA_URL = 'type=ORA:srvname=//localhost\:3333/instance_name:user=scott:passwd=tiger'
" }}}
" スカウター {{{
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
" }}}
" - QuickFix移動 {{{
" nnoremap ;j       <Esc>:cn<CR>
" nnoremap ;k       <Esc>:cN<CR>
" nnoremap ;g       <Esc>:<C-u>Grep  *<Left><Left>
" nnoremap ;;g      <Esc>:<C-u>Grep <C-r><C-w> *
" nnoremap ;g       <Esc>:<C-u>vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>
" nnoremap ;;g      <Esc>:<C-u>vimgrep /<C-r><C-w>/j **/*
" }}}
" - ;sでカーソル下の単語を置換 {{{
" nnoremap ;s       <Esc>:<C-u>%s/<C-r><C-w>/
" }}}
" - ;;;gでglobal {{{
" nnoremap ;;;g     <Esc>:<C-u>g/<C-r><C-w>/
" }}}
" [off]矢印でバッファ移動 {{{
" " ← ：前のバッファ
" nnoremap <silent><Left> :bp<CR>
" " → ：次のバッファ
" nnoremap <silent><Right> :bn<CR>
" " ↑ ：ls
" nnoremap <Up> :ls<CR>:b 
" " → ：tabnew
" nnoremap <Down> :ls<CR>:tabnew #
" }}}
" horizontal split {{{
nnoremap sh <C-w>h:call <SID>good_width()<Cr>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l:call <SID>good_width()<Cr>
"nnoremap sH <C-w>H:call <SID>good_width()<Cr>
"nnoremap sJ <C-w>J
"nnoremap sK <C-w>K
"nnoremap sL <C-w>L:call <SID>good_width()<Cr>
function! s:good_width()
  if winwidth(0) < 84
	  "vertical resize 84
  endif
endfunction
" }}}
" virtualedit(フリーカーソル)ではりつけると行末に貼り付け {{{
if has('virtualedit') && &virtualedit =~# '\<all\>'
    nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif
" }}}
" <Leader>/ clear hilight {{{
nmap <silent> <Leader>/ :nohlsearch<CR>
" }}}
" sudo after w!! {{{
cmap w!! !sudo tee % > /dev/null
" }}}
" }}}

" unite-line {{{
let s:unite_source = {
\  'name': 'lines',
\ }
function! s:unite_source.gather_candidates(args, context)
	let lines = getbufline('#', 1, '$')
	let path = expand('#:p')
	let format = '%' . strlen(len(lines)) . 'd:%s'
	return map(lines, '{
				\ "word": printf(format, v:key + 1, v:val),
				\ "source": "lines",
				\ "kind": "jump_list",
				\ "action_path": path,
				\ "action_line": v:key + 1,
				\ }')
endfunction

call unite#define_source(s:unite_source)
unlet s:unite_source

" }}}
" vim: set ft=vim foldmethod=marker :
