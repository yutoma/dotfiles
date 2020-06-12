" netrw
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1
" Fzf
call InstallGithubPlugin('junegunn', 'fzf', 'start')
call InstallGithubPlugin('junegunn', 'fzf.vim', 'start')
" go to project root
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
" NERDTree
call InstallGithubPlugin('preservim', 'nerdtree', 'start')
" open NERDTree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" quit vim if last window is closed
autocmd bufenter if (winr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
