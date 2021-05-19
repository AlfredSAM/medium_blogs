" Part of Plugins setup

" set vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=230

" set nvim-tree.lua
let g:nvim_tree_auto_open = 1

" set neoterm
let g:neoterm_bracketed_paste = 1
let g:neoterm_auto_repl_cmd = 0
" Open the neoterm in a vertical split if current window width is bigger than
" 100, otherwise use a horizontal split.
let g:neoterm_callbacks = {}
function! g:neoterm_callbacks.before_new()
  if winwidth('.') > 100
    let g:neoterm_default_mod = 'botright vertical'
  else
    let g:neoterm_default_mod = 'botright'
  end
endfunction
" Send selected contents in visual mode and move to the next line.
xmap gx $<Plug>(neoterm-repl-send)'>j0
" Send the current line in normal mode and move to the next line.
nmap gx <Plug>(neoterm-repl-send-line)j0
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au VimEnter,BufRead,BufNewFile *.idr set filetype=idris
au VimEnter,BufRead,BufNewFile *.lidr set filetype=lidris
au VimEnter,BufRead,BufNewFile *.lfe set filetype=lfe
" Set shortcut to enter normal mode in terminal buffer
tnoremap <esc> <c-\><c-n>

" Use raian instead of R for nvim-R
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" set rmarkdown file type for safety
au BufNewFile,BufRead *.Rmd set filetype=rmd

" set r file type for safety
au BufNewFile,BufRead *.R set filetype=r

" Set R shortcuts
autocmd FileType r inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType rmd inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType r inoremap <buffer> << <Esc>:normal! a <-<CR>a
autocmd FileType rnoweb inoremap <buffer> << <Esc>:normal! a <-<CR>a
autocmd FileType rmd inoremap <buffer> << <Esc>:normal! a <-<CR>a

