"" Ale the linter
"PackGet 'dense-analysis/ale'
" LSP
PackGet 'prabirshrestha/async.vim'
PackGet 'prabirshrestha/vim-lsp'
PackGet 'mattn/vim-lsp-settings'
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gD :LspReferences<CR>
nmap <silent> gh :LspHover<CR>
" Completion
PackGet 'prabirshrestha/asyncomplete.vim'
PackGet 'prabirshrestha/asyncomplete-lsp.vim'
" Editorconfig
PackGet 'editorconfig/editorconfig-vim'
" Snippet
PackGet 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
PackGet 'honza/vim-snippets'
PackGet 'thomasfaingnaert/vim-lsp-snippets'
PackGet 'thomasfaingnaert/vim-lsp-ultisnips'
