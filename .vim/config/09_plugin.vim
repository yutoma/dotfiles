function! InstallGithubPlugin(id, kind)
    let l:idary = split(a:id, '/')
    let l:local = $HOME . '/.vim/pack/github/' . a:kind . '/' . l:idary[1]
    let l:remote = 'https://github.com/' . l:idary[0] . '/' . l:idary[1] . '.git'
    if !isdirectory(l:local)
        call mkdir(l:local, 'p')
        silent exec ':!git clone --depth 1 ' . l:remote . ' ' . l:local
        redraw!
    endif
endfunction
command! -nargs=1 PackGet     call InstallGithubPlugin(<args>, 'start')
command! -nargs=1 PackGetLazy call InstallGithubPlugin(<args>, 'opt')

function! UpdatePlugins()
    silent exec ':!find ~/.vim/pack -type d -mindepth 3 -maxdepth 3 | xargs -P4 -n1 -I{} git --git-dir={}/.git pull'
    redraw!
endfunction
command! -nargs=0 PackPullAll call UpdatePlugins()
