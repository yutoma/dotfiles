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
" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
filetype plugin indent on

