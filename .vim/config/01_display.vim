syntax enable
set number
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set showmatch
set matchtime=2
set matchpairs& matchpairs+=<:>
set ambiwidth=double
set background=dark
" status bar
set laststatus=2
set showmode
set showcmd
set ruler
" cursor
if &term =~ "xterm\\|rxvt"
    let &t_SI = "\<Esc>]12;orange\x7"
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
    autocmd VimLeave * silent !echo -ne "\033]112\007"
else
    let &t_SI = "\<Esc>]5 q"
    let &t_EI = "\<Esc>]1 q"
endif
set ttimeoutlen=10
