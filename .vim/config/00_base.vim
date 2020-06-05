" filer
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:NERDTreeWinPos = "right"

"" for vim-easy-align
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)



" completion
set infercase



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
