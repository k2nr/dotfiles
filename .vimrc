"---------------------------------------------------------------------------
" Encoding {{{
"set enc=utf-8
"set fenc=utf-8
"set fencs=iso-2022-jp,utf-8,euc-jp,cp932
"
"" see: http://www.kawaz.jp/pukiwiki/?vim#cb691f26
"" 文字コードの自動認識
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconvがeucJP-msに対応しているかをチェック
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconvがJISX0213に対応しているかをチェック
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodingsを構築
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  " 定数を処分
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"" 日本語を含まない場合は fileencoding に encoding を使うようにする
"if has('autocmd')
"  function! AU_ReCheck_FENC()
"    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"      let &fileencoding=&encoding
"    endif
"  endfunction
"  autocmd BufReadPost * call AU_ReCheck_FENC()
"endif
"" 改行コードの自動認識
"set fileformats=unix,dos,mac
"" □とか○の文字があってもカーソル位置がずれないようにする
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif
"" }}}

"---------------------------------------
" NeoBundle {{{
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.clj    set filetype=clojure

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundleLazy 'taichouchou2/vim-endwise.git', {'autoload': {'insert' : 1}}
NeoBundleLazy 'Shougo/neocomplcache', {'autoload': {'insert' : 1}}
NeoBundleLazy 'Shougo/neosnippet', {'autoload' : {'insert' : 1}}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'ujihisa/unite-rake', {'depends': 'Shougo/unite.vim'}
NeoBundleLazy 'basyura/unite-rails', {'depends' : 'Shjkougo/unite.vim'}
NeoBundleLazy 'taichouchou2/unite-rails_best_practices', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'build' : {
      \    'mac': 'gem install rails_best_practices',
      \    'unix': 'gem install rails_best_practices',
      \   }
      \ }
NeoBundleLazy 'taichouchou2/unite-reek', {
      \ 'build' : {
      \    'mac': 'gem install reek',
      \    'unix': 'gem install reek',
      \ },
      \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'haml'] },
      \ 'depends' : 'Shougo/unite.vim' }
NeoBundleLazy 'skwp/vim-rspec', {'autoload': {'filetypes': ['ruby', 'eruby', 'haml']}}
NeoBundleLazy 'ruby-matchit', {'autoload': {'filetypes': ['ruby', 'eruby', 'haml']}}
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'h1mesuke/unite-outline', {'depends': 'Shougo/unite.vim'}
NeoBundle 'tsukkee/unite-tag', {'depends': 'Shougo/unite.vim'}
"NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'mattn/zencoding-vim', {'autoload': {'filetypes': ['html', 'erb', 'haml']}}
NeoBundle 'IndentAnything'
NeoBundleLazy 'JavaScript-syntax', {'autoload': {'filetypes': 'javascript'}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': 'javascript'}}

NeoBundle 'gtags.vim'
NeoBundle 'ack.vim'
NeoBundleLazy 'slimv.vim', {'autoload': {'filetypes': ['clojure', 'lisp']}}
NeoBundleLazy 'https://bitbucket.org/kotarak/vimclojure', {
    \ 'rtp' : 'vim',
    \ 'autoload' : {'filetypes': 'clojure'}}
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'Lokaltog/vim-easymotion'
" }}}

let s:bundle_rails = 'unite-rails unite-rails_best_practices unite-rake'
function! s:bundleLoadDepends(bundle_names) "{{{
  execute 'NeoBundleSource '.a:bundle_names
  au! RailsLazyPlugins
endfunction"}}}
aug RailsLazyPlugins
  au User Rails call <SID>bundleLoadDepends(s:bundle_rails)
aug END

filetype on
filetype plugin on
filetype plugin indent on
syntax on
"}}}

"---------------------------------------------------------------------------
" Search {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

set grepprg=grep\ -nH
" }}}

"---------------------------------------------------------------------------
" Edit Setting {{{
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0

set autoindent
set smartindent
set copyindent

set backspace=2
set showmatch
set wildmenu
set hidden

set formatoptions-=or
set formatoptions+=mM

if has('mouse')
      set mouse=a
endif

set clipboard+=unnamed
set matchpairs=(:),{:},[:]

:let java_highlight_functions=1
" }}}

"---------------------------------------------------------------------------
" Visual {{{
set number
set ruler
" show TAB/CRLF
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

set wrap
" always display command line
set laststatus=2

set cmdheight=1
set showcmd
set title

" show encoding and cr/lf type on status line
" see: http://vimwiki.net/?plugin=related&page=%27statusline%27
set statusline=%<%F\ %m%R%H%W%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P

" no beep
set visualbell
set vb t_vb=

" theme (solarized setting)
set background=dark
colorscheme solarized
" }}}

"---------------------------------------------------------------------------
" Fold {{{
set foldenable
" set foldmethod=expr
set foldmethod=marker
" Show folding level
set foldcolumn=2
" }}}

"---------------------------------------------------------------------------
" File Manipulation {{{
set nobackup
set nowritebackup
set noswapfile
set tags+=./tags;
"set autochdir

set wildignore+=*.o,*.obj,.git,*.pyc,*.jar,*.a,*.lib,*~
" }}}

"---------------------------------------------------------------------------
" Key Mapping {{{
let mapleader=","
"let maplocalleader ="\\"

nmap <C-\> <C-]>

" use <Space> for plugin launcher prefix
nnoremap <Space> <Nop>
nnoremap <Space>s :shell<CR>

nnoremap gh ^
nnoremap gl $
nnoremap gp o<ESC>p
nnoremap Y y$

nnoremap [c [czz
nnoremap ]c ]czz

nnoremap <C-n> :<C-u>cn<CR>
nnoremap <C-p> :<C-u>cp<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-W><C-W> <C-w>c

nnoremap < <C-W>4<
nnoremap > <C-W>4>

" same action as 'o' but keep normal mode
nnoremap <C-o> :<C-u>call append(expand('.'), '')<Cr>j

" double ESC to cancel search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
vnoremap <ESC> <ESC>

" insert TAB char regardless expandtab setting
inoremap <C-t>  <C-v><TAB>

" emacs like key binds for insert mode
inoremap <C-d>  <Del>
inoremap <C-h> <BS>
inoremap <C-l> <C-o>zz
inoremap <C-k> <C-o>D
inoremap <C-y> <C-o>P
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap jj <ESC>

" see: http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

" shortcuts to change settings
nnoremap @tr  :<C-u>set ruler!<cr>
nnoremap @tn  :<C-u>set number!<cr>
nnoremap @tet :<C-u>set expandtab!<cr>
nnoremap @i2  :<C-u>set tabstop=2 shiftwidth=2<cr>
nnoremap @i4  :<C-u>set tabstop=4 shiftwidth=4<cr>
nnoremap @i8  :<C-u>set tabstop=8 shiftwidth=8<cr>

nnoremap <Space>e mmT(i<Space><ESC>h%i<Space><ESC>`ml
nnoremap E viw

call togglebg#map("@tbg")
" }}}

"---------------------------------------------------------------------------
" omnifunc {{{

" Enable omni completion.
"autocmd FileType ada setlocal omnifunc=adacomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

"---------------------------------------------------------------------------
" Plugin Setting {{{
"---------------------------------------------------------------------------

" GNU GLOBAL (gtags.vim) {{{
nnoremap <Leader>gd :<C-u>Gtags 
nnoremap <Leader>gc :<C-u>GtagsCursor<CR>
nnoremap <Leader>gr :<C-u>Gtags -r 
nnoremap <Leader>gf :<C-u>Gtags -P 
nnoremap <Leader>gg :<C-u>Gtags -g 
" }}}

" TagBar {{{
nnoremap <Space>t :<C-u>TagbarToggle<cr>
let g:tagbar_sort      = 0
let g:tagbar_foldlevel = 2
" }}}

" coffee-script-vim {{{
au BufNewFile,BufReadPost *.coffee setl expandtab
" }}}

" enable to use as binary editor for *.bin {{{
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd -g1
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
" }}}

" Haskell Mode {{{

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
" }}}

" Fugitive {{{
nnoremap <Space>gd :Gdiff<CR>
nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gl :Glog<CR>
nnoremap <Space>ga :Gwrite<CR>
nnoremap <Space>gc :Gcommit<CR>
nnoremap <Space>gC :Git commit --amend<CR>
nnoremap <Space>gb :Gblame<CR>

" quit vimdiff
nnoremap <Space>gD :diffoff<CR><C-w>l<C-w>o
" }}}

" QFixGrep {{{
if has('win32')
  let Grep_Path       = 'C:\tools\gnu\bin\grep.exe'
  let Fgrep_Path      = 'C:\tools\gnu\bin\fgrep.exe'
  let Egrep_Path      = 'C:\tools\gnu\bin\egrep.exe'
  let Grep_Find_Path  = 'C:\tools\gnu\bin\find.exe'
  let Grep_Xargs_Path = 'C:\tools\gnu\bin\xargs.exe'
endif

" excluded files
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$'
" pick the word on the cursor (Yes/No)
let MyGrep_DefaultSearchWord   = 1"
" use filetype highlighting for preview
let QFix_PreviewFtypeHighlight = 1
" grep command to use
let mygrepprg            = 'grep'
" encoding for grep command
let MyGrep_ShellEncoding = 'utf8'
" additional options
let MyGrepcmd_useropt    = 'nH'
" first key to launch Grep
let MyGrep_Key  = 'g'
" second key to launch Grep
let MyGrep_KeyB = ','
" }}}

" neocomplcache {{{
let g:neocomplcache_enable_at_startup          = 1
"let g:neocomplcache_enable_auto_select         = 1
let g:neocomplcache_enable_smart_case          = 1
"let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
inoremap <expr><C-g> neocomplcache#undo_completion()
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><CR>      neocomplcache#smart_close_popup() . "<CR>" . "<Plug>DiscretionaryEnd"
imap <silent><expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
set completeopt-=preview
" }}}

" Unite.vim {{{
nnoremap <silent>;b :<C-u>Unite buffer<CR>
nnoremap <silent>;f :<C-u>UniteWithBufferDir -buffer-name=file file file_mru file/new<CR>
nnoremap <silent>;m :<C-u>Unite file_mru<CR>
nnoremap <silent>;g :<C-u>Unite grep<CR>
nnoremap <silent>;o :<C-u>Unite outline<CR>
nnoremap <silent>;r :<C-u>Unite register<CR>
nnoremap <silent>;l :<C-u>Unite line<CR>
nnoremap <silent>;t :<C-u>UniteWithCursorWord -buffer-name=tag tag<CR>
nnoremap <silent>;; :<C-u>Unite file_rec/async<CR>
nnoremap <silent>;y :<C-u>Unite history/yank<CR>

" Overwrite settings.
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)

  " shortcuts
  call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
  call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
  call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
  call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
  call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
  call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
  call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
endfunction

let g:unite_source_file_mru_limit = 300
let g:unite_source_directory_mru_limit = 300
" start on insert mode
let g:unite_enable_start_insert=1
"let g:unite_source_file_rec_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o\|so\|class\|a\|exe\|dll\|bak\|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\|neocon\|android\|rvm\|gem\)\%($\|/\)'
let g:unite_source_file_rec_min_cache_files=1000
let g:unite_source_history_yank_enable=1
let g:unite_source_history_yank_limit=1000
" }}}

" vim-quickrun {{{
let g:quickrun_config = { '*': { 'split': '%{winwidth(0) * 2 < winheight(0) * 5 ? "rightbelow" : "vertical rightbelow"}' } }
" }}}

" VimClojure {{{

let vimclojure#HighlightBuiltins=1
"let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#FuzzyIndent=1
let vimclojure#WantNailgun = 0
let vimclojure#SetupKeyMap = 0
"let vimclojure#NailgunClient = "ng"
"let vimclojure#SplitSize = 10
"let vimclojure#NailgunServer = "127.0.0.1"
"let vimclojure#NailgunPort = "2113"

" }}}

" vim-slime {{{
let g:slime_target = "tmux"
" }}}

" Command-T {{{
nnoremap <silent>t  :<C-u>CommandT<Return>
nnoremap <silent>T  :<C-u>CommandTTag<Return>
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxFiles=10000
" }}}

" slimv.vim {{{
let g:slimv_swank_cmd = '!osascript -e "tell app \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"cd $(pwd)\"" -e "write text \"sbcl --load ~/.vim/bundle/slimv.vim/slime/start-swank.lisp\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
let g:slimv_swank_clojure = '!osascript -e "tell app \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"cd $(pwd)\"" -e "write text \"lein swank\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'

let g:slimv_leader=','
let g:slimv_repl_split = 4 "vertical split right
" }}}

" endwise.vim {{{
let g:endwise_no_mappings=1
" }}}

" Dash {{{
nmap ,d <Plug>DashSearch
let g:dash_map = {
        \ 'ruby'       : 'rails',
        \ 'python'     : 'python2',
        \ 'javascript' : 'backbone'
        \ }
" }}}

" surround.vim {{{
let g:surround_custom_mapping = {}
let g:surround_custom_mapping._ = {
      \ 'p':  "<pre> \r </pre>",
      \ 'w':  "%w(\r)",
      \ }
let g:surround_custom_mapping.help = {
      \ 'p':  "> \r <",
      \ }
let g:surround_custom_mapping.ruby = {
      \ '-':  "<% \r %>",
      \ '=':  "<%= \r %>",
      \ '9':  "(\r)",
      \ '5':  "%(\r)",
      \ '%':  "%(\r)",
      \ 'w':  "%w(\r)",
      \ '#':  "#{\r}",
      \ '3':  "#{\r}",
      \ 'e':  "begin \r end",
      \ 'E':  "<<EOS \r EOS",
      \ 'i':  "if \1if\1 \r end",
      \ 'u':  "unless \1unless\1 \r end",
      \ 'c':  "class \1class\1 \r end",
      \ 'm':  "module \1module\1 \r end",
      \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
      \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
      \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
      \ }
let g:surround_custom_mapping.javascript = {
      \ 'f':  "function(){ \r }"
      \ }
let g:surround_custom_mapping.lua = {
      \ 'f':  "function(){ \r }"
      \ }
let g:surround_custom_mapping.python = {
      \ 'p':  "print( \r)",
      \ '[':  "[\r]",
      \ }
let g:surround_custom_mapping.vim= {
      \'f':  "function! \r endfunction"
      \ }
"}}}

" smartinput {{{
" }}}

" vim-easymotion {{{
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="f"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" }}}
"}}}
