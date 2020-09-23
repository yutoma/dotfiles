augroup golang
    autocmd!
    autocmd FileType go setlocal noexpandtab
    autocmd BufWritePre *.go LspDocumentFormat
augroup END
