function! InstallPlugin(local, remote)
    if !isdirectory(a:local)
        call mkdir(a:local, 'p')
        silent exec ':!git clone --depth 1 ' . a:remote . ' ' . a:local
    endif
endfunction

function! InstallGithubPlugin(group, name, kind)
    call InstallPlugin($HOME . '/.vim/pack/github/' . a:kind . '/' . a:name, 'https://github.com/' . a:group . '/' . a:name . '.git')
endfunction
