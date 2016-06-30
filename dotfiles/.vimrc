filetype on
filetype plugin on
filetype plugin indent on
syntax on

set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
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

set number
set ruler
" show TAB/CRLF
set list
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
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

set splitbelow
set splitright

set foldenable
" set foldmethod=expr
set foldmethod=marker
" Show folding level
set foldcolumn=2

set nobackup
set nowritebackup
set noswapfile
set tags+=./tags;

set wildignore+=*.o,*.obj,.git,*.pyc,*.jar,*.a,*.lib,*~

let mapleader=","

nmap <C-\> <C-]>

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

onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

nnoremap <Space>e mmT(i<Space><ESC>h%i<Space><ESC>`ml
nnoremap E viw

