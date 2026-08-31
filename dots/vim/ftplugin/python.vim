" Python specific overrides

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" PEP 8 compliance boundary layout indicator column
setlocal colorcolumn=88

" Fast syntax testing execution mapping for local python runtimes
nnoremap <buffer> <Leader>r :w<CR>:!python3 %<CR>
