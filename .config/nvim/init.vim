set nocompatible
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
set ttimeoutlen=10
" cursor moving
set virtualedit=all
" boundary
set nowrap
set textwidth=0
" indent
set expandtab
set shiftround
set smartindent
set tabstop=2 shiftwidth=2
" deleting
set backspace=indent,eol,start
" mouse
set mouse=a
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
nmap <silent> <Esc><Esc> :nohlsearch<CR>
tnoremap <silent> <Esc><Esc> <C-\><C-n>
" behaviour when buffers switching
set autoread
" buffer
set hidden
set switchbuf=useopen
" clipboard
set clipboard=unnamed
" save automatically
set autowriteall
set splitbelow
set splitright
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
" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
filetype plugin indent on

function! InstallGithubPlugin(id, kind)
    let l:idary = split(a:id, '/')
    let l:local = $HOME . '/.local/share/nvim/site/pack/github/' . a:kind . '/' . l:idary[1]
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
    silent exec ':!find ~/.local/share/nvim/site/pack -type d -mindepth 3 -maxdepth 3 | xargs -P4 -n1 -I{} git --git-dir={}/.git pull'
    redraw!
endfunction
command! -nargs=0 PackPullAll call UpdatePlugins()

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

PackGet 'tpope/vim-surround'
PackGet 'tpope/vim-repeat'
" Easy Align
PackGet 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" LSP
PackGet 'prabirshrestha/async.vim'
PackGet 'prabirshrestha/vim-lsp'
PackGet 'mattn/vim-lsp-settings'
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gD :LspReferences<CR>
nmap <silent> gh :LspHover<CR>
nmap <silent> gn :LspNextError<CR>
nmap <silent> gN :LspPreviousError<CR>
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" Completion
PackGet 'prabirshrestha/asyncomplete.vim'
PackGet 'prabirshrestha/asyncomplete-lsp.vim'
" Editorconfig
PackGet 'editorconfig/editorconfig-vim'

PackGet 'neoclide/coc.nvim'
