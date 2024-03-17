syntax on

set bg=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

hi VertSplit    ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi StatusLine   ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi StatusLineNC ctermfg=NONE  ctermbg=NONE  cterm=NONE

set ai ts=2 et sw=2
set bg=dark
set bo=all
set cb+=unnamedplus
set fcs+=eob:\ ,vert:\▏
set hi=9999
set hls ic is lz list
set lcs=tab:··,trail:·
set ls=2
set isk+=_
set noswapfile
set nu ru wmnu
set nowrap
set so=12
set stl=%f%=%-1c:%l:%L%10.40y
set udf
set udir=~/.vim/undo
set ul=10000
if executable("ocaml")
  set rtp^="/home/nebula/.opam/default/share/ocp-indent/vim"
endif

iabbrev flaot float
iabbrev teh the
iabbrev amke make
iabbrev lenght length

if strlen(getenv("WAYLAND_DISPLAY")) > 0
  autocmd TextYankPost *
          \ if (v:event.operator == 'y' || v:event.operator == 'd') |
          \ silent! execute 'call system("wl-copy", @")' | endif
  nnoremap p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap P :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>P
endif
inoremap jk             <esc>l
" d eaten by the black hole
vnoremap d              "_d
inoremap <c-s>          <esc>:w!<cr>
nnoremap <space>h       :nohl<cr>
nnoremap <space>c       :ColorToggle<cr>
nnoremap +              <c-a>
nnoremap -              <c-x>
nnoremap <space><space> :FZF
          \ --reverse
          \ --border=none
          \ --extended
          \ --color info:254,prompt:37,spinner:108,pointer:235,marker:235<cr>

call plug#begin()
  Plug 'mg979/vim-visual-multi'
  Plug 'chrisbra/Colorizer'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'github/copilot.vim'
call plug#end()

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }
let g:airline#extensions#tabline#enabled = 1

function! Alias(cmd, alias)
  exec 'cnoreabbrev <expr> '.a:cmd
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:cmd.'"))'
        \ .'? ("'.a:alias.'") : ("'.a:cmd.'")'
endfunction
call Alias("runc", "!clang -Wall -Wextra % -o ./bin/%:r -lm && ./bin/%:r")
call Alias("runp", "!python %")
call Alias("runt", "!pdflatex %")

" Github Copilot
autocmd BufReadPre *
     \ let f=getfsize(expand("<afile>"))
     \ | if f > 100000 || f == -2
     \ | let g:copilot#enabled = v:false
     \ | else
     \ | let g:copilot#enabled = v:true
     \ | endif
let g:copilot_filetypes = {
  \ 'c':                v:true,
  \ 'python':           v:true,
  \ 'javascript':       v:true,
  \ 'typescript':       v:true,
  \ 'typescriptreact':  v:true,
  \ 'javascriptreact':  v:true,
  \ 'vim':              v:true,
  \ 'html':             v:true,
  \ 'css':              v:true,
  \ '*':                v:false }

nohl
