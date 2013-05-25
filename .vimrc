set softtabstop=4
set shiftwidth=4
set sw=4
set expandtab
set wildmenu
set cindent
set paste
set autoindent
set hls
set nocompatible
set showmatch
set background=light
set backspace=2
set tabstop=4
colorscheme desert
syntax on
set hlsearch
"set foldmethod=indent
set ru



nnoremap <c-s-f> 1G=G
inoremap <c-s-f> <ESC>1G=Gi
nnoremap <F12> :TlistToggle<CR>
nnoremap <F2> :noh<CR>

highlight Search term=reverse ctermbg=4 ctermfg=7
"ighlig2ht Normal ctermbg=black ctermfg=white
map <C-E> gT
map <C-Y> gt
map <C-t>n <ESC>:tabnew<CR><ESC>:e
"map <C-t>c <ESC>:tabclose<CR>

set encoding=utf-8
set fileencodings=utf-8
set fileencoding=utf-8
set termencoding=utf-8
""""set color 1""""
"hi Comment ctermfg=Green
"hi Comment ctermfg=darkcyan
"hi Comment ctermfg=blue 


function! SuperCleverTab()
  " check if at beginning of line or after a space
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    "do we have omni completion available
    if &omnifunc != ''
      "use omni-completion 1. priority
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      "no omni completion, try dictionary completio
      return "\<C-K>"
    else
      "use omni completion or dictionary completion
      "use known-word completion
      return "\<C-N>"
    endif
  endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

