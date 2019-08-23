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
set formatoptions += ro " insert comment leader when hit return in insert mode
                        " or when entering a new line


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

" mappings to quickly toggle search highlight, listchars, paste
noremap <Leader>h :set hlsearch!<cr>
noremap <Leader>l :set list!<cr>
noremap <Leader>p :set paste!<cr>
noremap <Leader>y "*y
noremap <Leader>n :cn<cr>
noremap <Leader>b :cp<cr>


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
" Taglist options
" Open taglist with ,tl
nmap <leader>tl :TlistToggle<cr>
" Taglist plugin opens on the right, rather than the left
let Tlist_Use_Right_Window = 1


" ============================================================================
" Appearance
" ============================================================================
set title
" set cursorline " Show the cursor line at all times 
set ruler       " show the cursor position all the time
set background=dark

" ---------------------
" manage line numbers.
" Based on the excellent advice in:
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" noremap <Leader>n :set number!<cr>
nnoremap <Leader>m :call NumberToggle()<cr>

" automatically switch to absolute line numbers whenever Vim loses focus,
" since we don’t really care about the relative line numbers unless we’re moving around:
"autocmd FocusLost * :set number
"autocmd FocusGained * :set relativenumber

" tell Vim to automatically use absolute line numbers when we’re in insert
" mode and relative numbers when we’re in normal mode:
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
" ---------------------

" maybe useful for adjusting vim-size to console size
"set lines=50 columns=120

if has("win32") 
    set guifont=DejaVu_Sans_Mono:h10:cANSI
else
    set guifont=DejaVu\ Sans\ Mono\ 10
endif

" additions to make vim more compatible with varied color terminals
" https://push.cx/2008/256-color-xterms-in-ubuntu
if &t_Co > 2 || has("gui_running")
    syntax on
endif
" Options incompatible with vi, but good for vim:
if !has("compatible")
    " default colorscheme - vi doesn't have this elflord
    if &t_Co == 256
        colorscheme jellybeans
    else
        colorscheme evening
    endif
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

" ============================================================================
" Plugins, macros, etc.
" ============================================================================

" Personalization
let g:snips_author = 'Matt Welch'

" Macros
" ===================
" Open a vertical split, switch to it, search for 'diff', zt to scroll the
" line to the top of the buffer:
let @g = ':vsp/diffztjj'

" vim:set et ts=4 sw=4 sts=3 ai tw=80

