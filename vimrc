" For pathogen.vim: auto load all plugins in .vim/bundle

let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'powerline')
endif

    call pathogen#incubate()
    call pathogen#helptags()

" General Settings

set nocompatible        " not compatible with the old-fashion vi mode
set backspace=2         " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside

filetype off            " necessary to make ftdetect work on Linux
syntax on
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on               " syntax highlight
set hlsearch            " search highlighting
colorscheme desert      " set color scheme

set showmatch           " Cursor shows matching ) and }
set showmode            " Show current mode
set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent          " auto indentation
set incsearch           " incremental search
set nobackup            " no *~ backup files
set copyindent          " copy the previous indentation on autoindenting
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=4 
   set shiftwidth=4

   au FileType Makefile set noexpandtab
"}   

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 

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

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

" set leader to ,
let mapleader=","
let g:mapleader=","

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 

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


"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 


