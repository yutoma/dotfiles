" Ale the linter
PackGet 'dense-analysis/ale'
" LSP
PackGet 'prabirshrestha/async.vim'
PackGet 'prabirshrestha/vim-lsp'
PackGet 'mattn/vim-lsp-settings'
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gD :LspReferences<CR>
" Completion
PackGet 'prabirshrestha/asyncomplete.vim'
PackGet 'prabirshrestha/asyncomplete-lsp.vim'
" Editorconfig
PackGet 'editorconfig/editorconfig-vim'
" Snippet
PackGet 'SirVer/ultisnips'
PackGet 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
