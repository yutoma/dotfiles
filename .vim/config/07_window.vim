set splitbelow
set splitright
" close QuickFix by q
augroup gfcmd
  autocmd!
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
  autocmd FileType help,qf nnoremap <buffer> q <C-w>c
augroup END

