"---------------------------------------------------------------------------
" Encoding {{{
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932

" see: http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" 文字コードの自動認識
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
" }}}

"---------------------------------------
" NeoBundle {{{
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  filetype off
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" original repos on github
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'hallettj/jslint.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-fakeclip'

" vim-scripts repos
NeoBundle 'gtags.vim'
NeoBundle 'Command-T'
"NeoBundle 'VimClojure'
NeoBundle 'https://bitbucket.org/kotarak/vimclojure', {'rtp' : 'vim'}

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
set tabstop=4
set shiftwidth=4
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
" }}}

"---------------------------------------------------------------------------
" Key Mapping {{{
let mapleader=","
let maplocalleader ="\\"

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

call togglebg#map("@tbg")
" }}}

"---------------------------------------------------------------------------
" autocmd {{{

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

"---------------------------------------
" GNU GLOBAL (gtags.vim) {{{
nnoremap <Leader>gd :<C-u>Gtags 
nnoremap <Leader>gc :<C-u>GtagsCursor<CR>
nnoremap <Leader>gr :<C-u>Gtags -r 
nnoremap <Leader>gf :<C-u>Gtags -P 
nnoremap <Leader>gg :<C-u>Gtags -g 
" }}}

"---------------------------------------
" TagBar {{{
"nnoremap <Space>t :<C-u>TagbarToggle<cr>
"let g:tagbar_sort      = 0
"let g:tagbar_foldlevel = 2
" }}}

"---------------------------------------
" coffee-script-vim {{{
au BufNewFile,BufReadPost *.coffee setl expandtab
" }}}

"---------------------------------------
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

"---------------------------------------
" Haskell Mode {{{

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
" }}}

"---------------------------------------
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

"---------------------------------------
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

"---------------------------------------
" QFixGrep {{{
let $JS_CMD='node'
" }}}

"---------------------------------------
" vimfiler {{{
"nnoremap <silent><Space>f   :<C-u>VimFiler `=<SID>GetBufferDirectory()`<CR>
"
"call vimfiler#set_execute_file('vim', 'vim')
"call vimfiler#set_execute_file('txt', 'vim')
"
"let g:vimfiler_enable_clipboard     = 0
"let g:vimfiler_safe_mode_by_default = 1
" }}}


"---------------------------------------
" neocomplcache {{{
let g:neocomplcache_enable_at_startup          = 1
let g:neocomplcache_enable_auto_select         = 1
"let g:neocomplcache_enable_smart_case          = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
" see: http://vim-users.jp/2010/11/hack185/
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> neocomplcache#undo_completion()
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?  "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}

"---------------------------------------
" Unite.vim {{{
nnoremap <silent>;b :<C-u>Unite buffer<CR>
nnoremap <silent>;f :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
nnoremap <silent>;m :<C-u>Unite file_mru<CR>
nnoremap <silent>;g :<C-u>Unite grep<CR>
nnoremap <silent>;o :<C-u>Unite outline<CR>
nnoremap <silent>;r :<C-u>Unite register<CR>
nnoremap <silent>;l :<C-u>Unite line<CR>
nnoremap <silent>;t :<C-u>UniteWithCursorWord -buffer-name=tag tag<CR>
nnoremap <silent>;; :<C-u>Unite file_rec/async<CR>

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
" }}}

nnoremap <silent>t  :<C-u>CommandT<Return>
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxFiles=10000
" }}}

inoremap jj <ESC>
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "ng"
let vimclojure#SplitSize = 10
let vimclojure#NailgunServer = "127.0.0.1"
let vimclojure#NailgunPort = "2113"

let g:quickrun_config = { '*': { 'split': '%{winwidth(0) * 2 < winheight(0) * 5 ? "rightbelow" : "vertical rightbelow"}' } }

