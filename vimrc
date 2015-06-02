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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"configure file complete to be like bash
set wildmode=list:longest:full
set wildmenu
set wildignore +=*.o,*.out,*.obj,.git,*.class,*.pyc         " disable output files
set wildignore +=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz    " disable archives
set wildignore +=*.swp,*~,._*                               " disable backup/temp files

syntax on

" Make vim quiet.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Prevent vim from clearing the terminal scrollback buffer when it exits
set t_ti= t_te=

" ============================================================================
" Editing
" ============================================================================

"" Whitespace

" set tab stops and space-equivalence
" (TODO: should use 'real' tabs for " Makefiles, etc)
"set lines=50 columns=120
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
map <Leader>y "*y

""
"" Search
""

set hlsearch   " Highlight searches
set incsearch  " Highlight dynamically as pattern is typed
set ignorecase " Make searches case-insensitive...
set smartcase  " ...unless they contain at least one uppercase character
set gdefault   " Use global search by default



" Options incompatible with vi, but good for vim:
if !has("compatible")
    " default colorscheme - vi doesn't have this elflord
    colorscheme elflord
    " desert is similar to elflord, but darker colors
endif

" ============================================================================
" Appearance
" ============================================================================
set title
set cursorline
set ruler
set background=dark
set number


" =============================================================================
" Typos, Errors, and Typing Discipline
" =============================================================================

" Disable arrow keys in normal mode and insert mode
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>


