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
" Snippet
PackGet 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
PackGet 'honza/vim-snippets'
PackGet 'thomasfaingnaert/vim-lsp-snippets'
PackGet 'thomasfaingnaert/vim-lsp-ultisnips'
