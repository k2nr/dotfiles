"---------------------------------------------------------------------------
" Encoding
"set enc=utf-8
"set fenc=utf-8
"set fencs=iso-2022-jp,utf-8,euc-jp,cp932

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

"---------------------------------------------------------------------------
" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

"---------------------------------------------------------------------------
" Edit Setting
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

"---------------------------------------------------------------------------
" Visual
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
set statusline=%<%f\ %m%R%H%W%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P 

" no beep
set visualbell
set vb t_vb=

" theme (solarized setting)
syntax enable
set background=dark
colorscheme solarized

"---------------------------------------------------------------------------
" File Manipulation
set nobackup
set nowritebackup
set noswapfile
set tags+=./tags;
set autochdir

"---------------------------------------------------------------------------
" Key Mapping
let mapleader=","

" use <Space> for plugin launcher prefix
nnoremap <Space> <Nop>
nnoremap <Space>s :shell<CR>

nnoremap gh ^
nnoremap gl $
nnoremap gp o<ESC>p
nnoremap Y y$

nnoremap n nzz 
nnoremap N Nzz 
nnoremap * *zz 
nnoremap # #zz 
nnoremap g* g*zz 
nnoremap g# g#zz

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

nnoremap <C-H> <C-W>h 
nnoremap <C-J> <C-W>j 
nnoremap <C-K> <C-W>k 
nnoremap <C-L> <C-W>l 

" same action as 'o' but keep normal mode
nnoremap <C-o> :<C-u>call append(expand('.'), '')<Cr>j

" double ESC to cancel search highlighting
nnoremap <ESC><ESC> :nohlsearch<CR>

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
nnoremap qtr :set ruler!<cr>
nnoremap qtn :set number!<cr>
nnoremap qtet :set expandtab!<cr>
nnoremap qi2 :set tabstop=2 shiftwidth=2<cr>
nnoremap qi4 :set tabstop=4 shiftwidth=4<cr>
nnoremap qi8 :set tabstop=8 shiftwidth=8<cr>


"---------------------------------------------------------------------------
" autocmd

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

"---------------------------------------------------------------------------
" Plugin Setting
"---------------------------------------------------------------------------

"---------------------------------------
" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc() 

" original repos on github 
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neocomplcache' 
Bundle 'ujihisa/neco-ghc'
Bundle 'Shougo/unite.vim' 
Bundle 'h1mesuke/unite-outline'
Bundle 'tsukkee/unite-tag'
Bundle 'Shougo/vimproc' 
Bundle 'Raimondi/delimitMate'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'

" vim-scripts repos 
"Bundle 'ZenCoding.vim' 
Bundle 'vundle' 
Bundle 'gtags.vim' 
Bundle 'JavaScript-syntax'
Bundle 'Javascript-Indentation'
Bundle 'IndentAnything'
Bundle 'vcscommand.vim'

" non github repos 
Bundle 'git://git.wincent.com/command-t.git' 

filetype on
filetype plugin on
filetype plugin indent on
syntax on

"---------------------------------------
" GNU GLOBAL (gtags.vim)
nnoremap <Leader>gd :Gtags 
nnoremap <Leader>gc :GtagsCursor<CR>
nnoremap <Leader>gr :Gtags -r 
nnoremap <Leader>gf :Gtags -P 
nnoremap <Leader>gg :Gtags -g 

"---------------------------------------
" TagBar
nnoremap <Space>t :TagbarToggle<cr>

"---------------------------------------
" delimitMate
let delimitMate_expand_space = 1

"---------------------------------------
" enable to use as binary editor for *.bin
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


"---------------------------------------
" Haskell Mode

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"

"---------------------------------------
" QFixGrep
if has('win32')
  let Grep_Path       = 'C:\tools\gnu\bin\grep.exe'
  let Fgrep_Path      = 'C:\tools\gnu\bin\fgrep.exe'
  let Egrep_Path      = 'C:\tools\gnu\bin\egrep.exe'
  let Grep_Find_Path  = 'C:\tools\gnu\bin\find.exe'
  let Grep_Xargs_Path = 'C:\tools\gnu\bin\xargs.exe'
endif

" excluded files
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$'
" grep command to use
let mygrepprg = 'grep'
" encoding for grep command
let MyGrep_ShellEncoding = 'utf8'
" additional options
let MyGrepcmd_useropt = ''
" first key to launch Grep
let MyGrep_Key  = 'g'
" second key to launch Grep
let MyGrep_KeyB = ','
" pick the word on the cursor (Yes/No)
let MyGrep_DefaultSearchWord = 1"

"---------------------------------------
" vimfiler
nnoremap <silent><Space>f   :VimFiler `=<SID>GetBufferDirectory()`<CR>

call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'vim')

let g:vimfiler_enable_clipboard = 0
let g:vimfiler_safe_mode_by_default = 1
let g:vimshell_cd_command = 'cd'


"---------------------------------------
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1

" see: http://vim-users.jp/2010/11/hack185/
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> neocomplcache#undo_completion()
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?  "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------------------------
" Unite.vim
nnoremap <silent>;b :Unite buffer<CR>
nnoremap <silent>;f :UniteWithBufferDir -buffer-name=file file<CR>
nnoremap <silent>;m :Unite file_mru<CR>
nnoremap <silent>;g :Unite grep<CR>
nnoremap <silent>;o :Unite outline<CR>
nnoremap <silent>;r :Unite register<CR>
nnoremap <silent>;l :Unite line<CR>
nnoremap <silent>;t :UniteWithCursorWord -buffer-name=tag tag<CR>
nmap     <silent>;; ;l

" Overwrite settings.
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q

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

