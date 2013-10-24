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

au BufRead,BufNewFile,BufReadPre *.coffee setlocal filetype=coffee
au BufRead,BufNewFile,BufReadPre *.clj    setlocal filetype=clojure
au BufRead,BufNewFile,BufReadPre *.cljs   setlocal filetype=clojure

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'tpope/vim-endwise.git', {'autoload': {'insert' : 1}}
NeoBundleLazy 'Shougo/neocomplete.vim', {'autoload': {'insert' : 1}}
NeoBundleLazy 'Shougo/neosnippet', {'autoload' : {'insert' : 1}}
NeoBundle     'Shougo/unite.vim'
NeoBundle     'Shougo/vimshell.vim'
NeoBundle     'tpope/vim-rails'
NeoBundleLazy 'ruby-matchit', {'autoload': {'filetypes': ['ruby', 'eruby', 'haml']}}
NeoBundle     'tomtom/tcomment_vim'
NeoBundle     'h1mesuke/unite-outline', {'depends': 'Shougo/unite.vim'}
NeoBundle     'tsukkee/unite-tag', {'depends': 'Shougo/unite.vim'}
NeoBundle     'tpope/vim-fugitive'
NeoBundle     'altercation/vim-colors-solarized'
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': ['coffee']}}
NeoBundle     'kana/vim-fakeclip'
NeoBundle     'scrooloose/syntastic'
NeoBundleLazy 'mattn/zencoding-vim', {'autoload': {'filetypes': ['html', 'erb', 'haml']}}
NeoBundle     'IndentAnything'
NeoBundleLazy 'JavaScript-syntax', {'autoload': {'filetypes': 'javascript'}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': 'javascript'}}
NeoBundle     'mileszs/ack.vim'
NeoBundleLazy 'slimv.vim', {'autoload': {'filetypes': ['scheme', 'lisp']}}
NeoBundleLazy 'tpope/vim-fireplace',     {'autoload': {'filetypes': ['clojure']}}
NeoBundleLazy 'tpope/vim-classpath',     {'autoload': {'filetypes': ['clojure']}}
NeoBundleLazy 'guns/vim-clojure-static', {'autoload': {'filetypes': ['clojure']}}
NeoBundleLazy 'vim-scripts/paredit.vim', {'autoload': {'filetypes': ['clojure']}}
NeoBundle     'tpope/vim-surround'
"NeoBundle     'kana/vim-smartinput'
NeoBundle     'wincent/Command-T'
NeoBundle     'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle     'AndrewRadev/switch.vim'
NeoBundle     'vim-scripts/Auto-Pairs'
NeoBundle     'airblade/vim-gitgutter'
" }}}

filetype on

filetype plugin on
filetype plugin indent on
syntax on

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

"" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"---------------------------------------------------------------------------
" Visual {{{
set number
set ruler
" show TAB/CRLF
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=tab:>-,extends:<,trail:-,eol:<

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
" Windows {{{
set splitbelow
set splitright
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
nnoremap <Space>a :Ack<Space>

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
autocmd FileType ada setlocal omnifunc=adacomplete#Complete
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

" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplete#force_overwrite_completefunc = 1

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <expr><BS>  neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <expr><C-y> neocomplete#close_popup()
  inoremap <expr><C-e> neocomplete#cancel_popup()
endfunction
" }}}

" neosnippet {{{
"let s:hooks = neobundle#get_hooks("neosnippet.vim")
"function! s:hooks.on_source(bundle)
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory = '~/.vim/vim-snippets/snippets'

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  nmap A $

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
"endfunction
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
nnoremap <silent>;s :<C-u>Unite snippet<CR>

" Overwrite settings.
au FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)

  " shortcuts
  call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
  call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
  call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
  call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/"')
  call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
  call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
  call unite#custom#substitute('file', '\\ \@!', '/', -30)
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

" Command-T {{{
nnoremap <silent>t  :<C-u>CommandT<Return>
nnoremap <silent>T  :<C-u>CommandTTag<Return>
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxFiles=10000
let g:CommandTMatchWindowReverse=1
" }}}

" slimv.vim {{{
let s:hooks = neobundle#get_hooks("slimv.vim")
function! s:hooks.on_source(bundle)
  let g:slimv_swank_cmd = '!osascript -e "tell app \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"cd $(pwd)\"" -e "write text \"sbcl --load ~/.vim/bundle/slimv.vim/slime/start-swank.lisp\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
  let g:slimv_leader=','
  let g:slimv_repl_split = 4 "vertical split right
  let g:paredit_mode = 1
endfunction

au BufRead *.scm call s:hook_buf_read_scm()
function! s:hook_buf_read_scm()
  nmap <buffer> <silent> cc mal[[v%:VimShellSendString<cr>`a
endfunction
" }}}

" endwise.vim {{{
let g:endwise_no_mappings=1
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

" acejump {{{
"
"" https://gist.github.com/gfixler/3167301
" ACEJUMP
" Based on emacs' AceJump feature (http://www.emacswiki.org/emacs/AceJump).
" AceJump based on these Vim plugins:
"     EasyMotion (http://www.vim.org/scripts/script.php?script_id=3526)
"     PreciseJump (http://www.vim.org/scripts/script.php?script_id=3437)
" Type AJ mapping, followed by a lower or uppercase letter.
" All words on the screen starting with that letter will have
" their first letters replaced with a sequential character.
" Type this character to jump to that word.

highlight AceJumpGrey ctermfg=darkgrey guifg=lightgrey
highlight AceJumpRed ctermfg=darkred guibg=NONE guifg=black gui=NONE

function! AceJump ()
    " store some current values for restoring later
    let origPos = getpos('.')
    let origSearch = @/

    " prompt for and capture user's search character
    echo "AceJump to words starting with letter: "
    let letter = nr2char(getchar())
    " return if invalid key, mouse press, etc.
    if len(matchstr(letter, '\k')) != 1
        echo ""
        redraw
        return
    endif
    " redraws here and there to get past 'more' prompts
    redraw
    " row/col positions of words beginning with user's chosen letter
    let pos = []

    " monotone all text in visible part of window (dark grey by default)
    call matchadd('AceJumpGrey', '\%'.line('w0').'l\_.*\%'.line('w$').'l', 50)

    " loop over every line on the screen (just the visible lines)
    for row in range(line('w0'), line('w$'))
        " find all columns on this line where a word begins with our letter
        let col = 0
    let matchCol = match(' '.getline(row), '.\<'.letter, col)
    while matchCol != -1
        " store any matching row/col positions
        call add(pos, [row, matchCol])
        let col = matchCol + 1
        let matchCol = match(' '.getline(row), '.\<'.letter, col)
    endwhile
    endfor

    if len(pos) > 1
        " jump characters used to mark found words (user-editable)
        let chars = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'

        if len(pos) > len(chars)
            " TODO add groupings here if more pos matches than jump characters
        endif

        " trim found positions list; cannot be longer than jump markers list
        let pos = pos[:len(chars)]

        " jumps list to pair jump characters with found word positions
        let jumps = {}
        " change each found word's first letter to a jump character
        for [r,c] in pos
            " stop marking words if there are no more jump characters
            if len(chars) == 0
                break
            endif
            " 'pop' the next jump character from the list
            let char = chars[0]
            let chars = chars[1:]
            " move cursor to the next found word
            call setpos('.', [0,r,c+1,0])
            " create jump character key to hold associated found word position
            let jumps[char] = [0,r,c+1,0]
            " replace first character in word with current jump character
            exe 'norm r'.char
            " change syntax on the jump character to make it highly visible
            call matchadd('AceJumpRed', '\%'.r.'l\%'.(c+1).'c', 50)
        endfor
        call setpos('.', origPos)

        " this redraw is critical to syntax highlighting
        redraw

        " prompt user again for the jump character to jump to
        echo 'AceJump to words starting with "'.letter.'" '
        let jumpChar = nr2char(getchar())

        " restore previous search register value
        let @/ = origSearch

        " undo all the jump character letter replacement
        norm u

        " if the user input a proper jump character, jump to it
        if has_key(jumps, jumpChar)
            call setpos('.', jumps[jumpChar])
        else
            " if it didn't work out, restore original cursor position
            call setpos('.', origPos)
        endif
    elseif len(pos) == 1
        " if we only found one match, just jump to it without prompting
        " set position to the one match
        let [r,c] = pos[0]
        call setpos('.', [0,r,c+1,0])
    elseif len(pos) == 0
        " no matches; set position back to start
        call setpos('.', origPos)
    endif
    " turn off all search highlighting
    call clearmatches()
    redraw
    " clean up the status line and return
    echo ""
    return
endfunction

nnoremap f :call AceJump()<CR>
" }}}

" ack.vim {{{
let g:ackprg = 'ag --nogroup --nocolor --column -U'
" }}}

" switch.vim {{{
nnoremap - :Switch<cr>
let b:switch_custom_definitions = [
      \   ["describe", "context", "specific", "example"],
      \   ['before', 'after'],
      \   ['be_true', 'be_false'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'eql', 'equal'],
      \   { '\.should_not': '\.should' },
      \   ['\.to_not', '\.to'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ]
" }}}

" vim-endwise {{{
let g:endwise_no_mappings=1
" }}}

" vimshell {{{
nmap ,ss :VimShellSendString<cr>
vmap ,ss :VimShellSendString<cr>
nmap ,si :VimShellInteractive<cr>
" }}}

" fireplace {{{
let s:hooks = neobundle#get_hooks("vim-fireplace")
function! s:hooks.on_source(bundle)
  let g:paredit_mode = 1
endfunction

au BufRead *.clj  call s:hook_buf_read_clj()
au BufRead *.cljs call s:hook_buf_read_clj()
function! s:hook_buf_read_clj()
  nnoremap <buffer> <silent> cr :Require<CR>
  nnoremap <buffer> <silent> cc :Eval<CR>
  vnoremap <buffer> <silent> cc :Eval<CR>
endfunction
" }}}

"}}}"}}}
