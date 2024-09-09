syntax on

" set theme
set bg=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_italic=1
" colo solarized

set ai ts=2 et sw=2
set bg=dark
set bo=all
set cb+=unnamedplus
set hi=9999
set hls ic is lz list
set lcs=tab:··,trail:·
set ls=2
" set isk+=_
set noswapfile
set nu nornu ru wmnu
set nowrap
set so=12
set stl=%f%=%-1v:%l:%L%10.40y
set udf
set udir=~/.vim/undo
set ul=10000
iabbrev flaot float
iabbrev teh the
iabbrev amke make
iabbrev lenght length

inoremap jk             <esc>l
" text finna be eaten by the black hole
vnoremap d              "_d
" delete trailing whitespaces
nnoremap dtw            :silent! %s/\s\+$//<cr>
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

" clipboard for wayland if clipboard and wl-copy is available
if $XDG_SESSION_TYPE ==? "WAYLAND" && has('clipboard') && executable("wl-copy")
  autocmd TextYankPost *
          \ if (v:event.operator == 'y' || v:event.operator == 'd') |
          \ silent! execute 'call system("wl-copy", @")' | endif
  nnoremap p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap P :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>P
endif

call plug#begin()
  Plug 'mg979/vim-visual-multi'
  Plug 'chrisbra/Colorizer'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'github/copilot.vim'
call plug#end()

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0 } }

function! Alias(cmd, alias)
  exec 'cnoreabbrev <expr> '.a:cmd
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:cmd.'"))'
        \ .'? ("'.a:alias.'") : ("'.a:cmd.'")'
endfunction
call Alias("runc", "!clang -Wall -Wextra % -o ./bin/%:r -lm && ./bin/%:r")
call Alias("runp", "!python %")
call Alias("runt", "!pdflatex %")

function! WordProcessorMode()
  setlocal textwidth=90
  " this ensures that the word is not broken
  setlocal formatoptions-=t
endfunction
command! WP call WordProcessorMode()

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
