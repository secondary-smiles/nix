vim.cmd [[
augroup set_spell
autocmd FileType text setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType mail setlocal spell
autocmd FileType typst setlocal spell
augroup end

augroup set_wrap
  autocmd FileType text setlocal linebreak
  autocmd FileType markdown setlocal linebreak
  autocmd FileType typst setlocal linebreak
augroup end

augroup set_scrolloff
autocmd FileType markdown nnoremap j jzz
autocmd FileType markdown nnoremap k kzz

autocmd FileType typst nnoremap j jzz
autocmd FileType typst nnoremap k kzz
augroup end

augroup set_langs
autocmd BufNewFile,BufRead *.u set filetype=unison
autocmd BufNewFile,BufRead *.typ set filetype=typst
augroup end
]]
