set nocompatible
filetype plugin indent on

" display
set number
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set showmatch
set matchtime=2
set matchpairs& matchpairs+=<:>
set ambiwidth=double
syntax enable

" status bar
set laststatus=2
set showmode
set showcmd
set ruler

" boundary
set nowrap
set textwidth=0

" indent
set tabstop=4 shiftwidth=4
set smartindent
set shiftround

set backspace=indent,eol,start

" cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set ttimeoutlen=10
set virtualedit=all

" filer
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:NERDTreeWinPos = "right"

"" for vim-easy-align
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)

" clipboard
set clipboard=unnamed

" mouse
set mouse=a

" completion
set infercase

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" behaviour when buffers switching
set autochdir
set autoread

" buffer
set hidden
set switchbuf=useopen

" switching window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-Left>  <C-w><
nnoremap <S-Down>  <C-w>+<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Right> <C-w>>

" close QuickFix by q
augroup gfcmd
  autocmd!
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
  autocmd FileType help,qf nnoremap <buffer> q <C-w>c
augroup END

" save as super user by w!!
cmap w!! w !sudo tee > /dev/null %

" make dir when it does not exist
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
      \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~?
      \ '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
augroup saving
  autocmd!
  autocmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)
augroup END

if executable('rls')
  "  let g:lsp_diagnostics_enabled = 0 " エラー表示はALEで行う
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
    \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
    \ 'whitelist': ['rust'],
    \ })
  autocmd FileType rust setlocal omnifunc=lsp#complete
  " .か:を押したときに自動的にオムニ補完
  autocmd FileType rust imap <expr> . ".\<C-X>\<C-O>"
  autocmd FileType rust imap <expr> : ":\<C-X>\<C-O>"
endif

"let g:lsp_diagnostics_enabled = 1
"scriptencoding utf-8
function! s:on_lsp_buffer_enabled() abort
  "setlocal omnifunc=lsp#complete
  "setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gD <plug>(lsp-references)
  nmap <buffer> gI <plug>(lsp-implementation)
  nmap <buffer> <C-Q> <plug>(lsp-hover)
  nmap <buffer> <F2> <plug>(lsp-rename)
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
