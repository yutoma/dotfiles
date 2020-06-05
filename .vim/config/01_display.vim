syntax enable
set number
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set showmatch
set matchtime=2
set matchpairs& matchpairs+=<:>
set ambiwidth=double
" status bar
set laststatus=2
set showmode
set showcmd
set ruler
" cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set ttimeoutlen=10
