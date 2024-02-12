syntax on

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

set ai ts=2 et sw=4
set nu ru wmnu
set hls ic is sm lz list
set bg=dark
set cb=unnamedplus
set bo=all
set so=12
set hi=9999
set lcs=tab:··,trail:·
set iskeyword+=_
set noswapfile
set undofile
set undodir=~/.vim/undo
set undolevels=10000

iabbrev flaot float
iabbrev teh the
iabbrev amke make
iabbrev lenght length

inoremap jk <esc>l
vnoremap d "dd
nnoremap d "dd
nnoremap dd "ddd
inoremap <c-s> <esc>:w!<cr>
nnoremap <space>h :nohl<cr>
nnoremap <space>c :ColorToggle<cr>
nnoremap + <c-a>
nnoremap - <c-x>

call plug#begin()
  Plug 'mg979/vim-visual-multi'
  Plug 'chrisbra/Colorizer'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

fun! Alias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'"))'
        \ .'? ("'.a:to.'") : ("'.a:from.'")'
endfun

call Alias("runc", "!clang -Wall -Wextra % -o ./bin/%:r -lm && ./bin/%:r")
call Alias("runp", "!python %")
call Alias("runt", "!pdflatex %")

