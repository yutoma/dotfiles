" netrw
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1
" Fzf
PackGet 'junegunn/fzf'
PackGet 'junegunn/fzf.vim'
" go to project root
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
" NERDTree
PackGet 'preservim/nerdtree'
" open NERDTree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" quit vim if last window is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree git plugin
PackGet 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'   :'*',
            \ 'Staged'     :'+',
            \ 'Untracked'  :'%',
            \ 'Renamed'    :'R',
            \ 'Unmerged'   :'!',
            \ 'Deleted'    :'D',
            \ 'Dirty'      :'*',
            \ 'Ignored'    :'G',
            \ 'Clean'      :'L',
            \ 'Unknown'    :'?',
            \ }
