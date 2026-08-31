" Global environment tweaks loaded automatically at startup

" Highlight trailing whitespace visually in bright red without breaking operations
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Automatically strip trailing whitespace cleanly on every buffer write sequence
autocmd BufWritePre * %s/\s\+$//e
