" Matt's vimrc file 
"
" Maintainer: Matt Welch <mattw0308@gmail.com>
" Website: https://github.com/matt-welch/daffy-dotfiles
"
" ============================================================================
" Program Behavior
" ============================================================================
" NOTE: where possible, the comments from Bram Moolenar's vimrc_example.vim
" are pasted with the commands for clarity

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" start up pathogen plugin manager
execute pathogen#infect()
syntax on " always do syntax highlighting
filetype plugin indent on

" Now we set some defaults for the editor
set history=50 " keep 50 lines of command line history
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Make vim quiet.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Prevent vim from clearing the terminal scrollback buffer when it exits
set t_ti= t_te=

" Save backups in a common folder instead of in the working directory. 
" End with a double separator to create path independent filenames
if has("win32")
    set directory=$TEMP//
    set backupdir=$TEMP//
else
    set directory=/tmp//
    set backupdir=/tmp//
endif

if version >= 703
    set cm=blowfish
    " Persistant Undo settings
    set undofile
    set undolevels=1000 " Max num of changes that can be undone
    set undoreload=10000 " Max num of lines to save for undo on a buffer reload
    if has("win32")
        set undodir=$TEMP//
    else 
        set undodir=/tmp//
    endif
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" ============================================================================
" Editing
" ============================================================================

"" Whitespace

" set tab stops and space-equivalence
" (TODO: should use 'real' tabs for " Makefiles, etc)
"set lines=50 columns=120
set modeline        " enable modelines 
set expandtab       " Tab in insert mode will produce spaces
set tabstop=4       " width of a tab (in spaces)
set shiftwidth=4    " width of a re-indent operation and auto-indent
set softtabstop=4   " set spaced for tab in insert mode
set autoindent      " enable auto indentation

" Backspace over everything in insert mode
set backspace=indent,eol,start
" below enumerates typical nonprinting characters to be showed with 'set list'
" or can be hidden with the command 'set nolist' or 'set list!'
set nolist  " don't show invisible chars by default
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:_
" set listchars=tab:-\ ,trail:-,eol:$,nbsp:_,extends:.>precedes:.<

" mappings to allow window navigation with Ctrl-navigation keys [JMW]
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" default leader is '\'.
" let mapleader='\\'    " escape with backslash
" let mapleader=','     " replace leader with ','

" mappings to quickly toggle search highlight, numbers, listchars, paste
noremap <Leader>h :set hlsearch!<cr>
noremap <Leader>n :set number!<cr>
noremap <Leader>l :set list!<cr>
noremap <Leader>p :set paste!<cr>
noremap <Leader>y "*y

""
"" Search
""
set hlsearch   " Highlight searches
set incsearch  " Highlight dynamically as pattern is typed
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character
set gdefault   " Use global search by default

" configure file complete to be like bash
set wildmode=list:longest:full
set wildmenu
set wildignore +=*.o,*.out,*.obj,.git,*.class,*.pyc         " disable output files
set wildignore +=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz    " disable archives
set wildignore +=*.swp,*~,._*                               " disable backup/temp files


" tags options: 
set tags=tags,./tags,./src/tags;/

" ============================================================================
" Appearance
" ============================================================================
set title
" set cursorline " Show the cursor line at all times 
set ruler       " show the cursor position all the time
set background=dark
set number
" maybe useful for adjusting vim-size to console size
"set lines=50 columns=120

if has("win32") 
    set guifont=DejaVu_Sans_Mono:h10:cANSI
else
    set guifont=DejaVu\ Sans\ Mono\ 10
endif

" Options incompatible with vi, but good for vim:
if !has("compatible")
    " default colorscheme - vi doesn't have this elflord
    colorscheme evening
    " desert is similar to elflord, but darker colors
endif


" =============================================================================
" Typos, Errors, and Typing Discipline
" =============================================================================

" Disable arrow keys in normal mode and insert mode
" This may be nice for typing discipline but it pisses people off if their 
" expecting arrow keys to, you know, work.  Disabled by default.
" noremap <left> <nop>
" noremap <right> <nop>
" noremap <up> <nop>
" noremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>

" Turn this on if it's irritating, but better off for safety
" set hidden  " don't prompt to save when leaving a modified buffer

" " This is going to do a bunch of stuff that I don't want it to do so imma
" " disable it for now.
" " ============================================================================
" " Plugins, macros, etc.
" " ============================================================================
" 
" " Personalization
let g:snips_author = 'Matt Welch'
" 
" " Toggling Autowrap (from: http://vim.wikia.com/wiki/Toggle_auto-wrap)
" set sr fo=roqm1 tw=78
" im <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>_<BS><Right>
" 
" 
" 
" "NERDTree configuration
" map <F2> :NERDTreeToggle<CR>
" let NERDTreeHijackNetrw=0 "Do not hijack netrw for editing directories.
"
" if has("win32")
"     " Remote SSH settings
"     let g:netrw_cygwin= 0
"     let g:netrw_scp_cmd = 'c:\"Program Files (x86)"\PuTTY\pscp.exe -q '
"     let g:netrw_sftp_cmd= '"c:\"Program Files (x86)"\PuTTY\psftp.exe'
"     let g:netrw_silent = 1
"     
"     set diffexpr=MyDiff()
"     function MyDiff()
"       let opt = '-a --binary '
"       if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"       if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"       let arg1 = v:fname_in
"       if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"       let arg2 = v:fname_new
"       if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"       let arg3 = v:fname_out
"       if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"       let eq = ''
"       if $VIMRUNTIME =~ ' '
"         if &sh =~ '\<cmd'
"           let cmd = '""' . $VIMRUNTIME . '\diff"'
"           let eq = '"'
"         else
"           let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"         endif
"       else
"         let cmd = $VIMRUNTIME . '\diff'
"       endif
"       silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"     endfunction
" endif
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  Text and mail
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufRead,BufNewFile *.txt set filetype=text
" 
" autocmd Filetype text,tex set textwidth=80 fo+=cqt wm=0 "Automatic wrapping at 80col
" "According to thunderbirds settings
" autocmd Filetype mail set textwidth=72
" 
" 
" "a and w reformat the paragraph automatically and a new paragraph
" "is indicated by lines not ending with white-space
" if version>=700
"     autocmd Filetype mail,text,tex set fo+=n spell
" endif
" 
" 
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'
" 
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a single file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
" set grepprg=grep\ -nH\ $*
" 
" "let g:clang_complete_auto = 1
" let g:clang_use_library = 0

" 
