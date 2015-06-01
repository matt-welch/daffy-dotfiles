source $VIMRUNTIME/vimrc_example.vim
" Personalization
let g:snips_author = 'Matt Welch'

"Copied from debian.vim
set nocompatible

" Now we set some defaults for the editor
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set cursorline " Show the cursor line at all times
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"configure file complete to be list bash
set wildmode=list:longest:full
set wildmenu
syntax on

" Make vim quiet.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" set tab stops and space-equivalence
" (TODO: should use 'real' tabs for " Makefiles, etc)
"set lines=50 columns=120
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" mappings to allow window navigation with Ctrl-navigation keys [JMW]
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" default leader is '\'.
" let mapleader='\\'    " escape with backslash
" let mapleader=','     " replace leader with ','

" mappings to quickly toggle search highlight, numbers, listchars
noremap <Leader>h :set hlsearch!<cr>
noremap <Leader>n :set number!<cr>
noremap <Leader>l :set list!<cr>
noremap <Leader>p :set paste!<cr>

" Options incompatible with vi, but good for vim:
if !has("compatible")
    " default colorscheme - vi doesn't have this elflord
    colorscheme elflord
    " desert is similar to elflord, but darker colors
endif


